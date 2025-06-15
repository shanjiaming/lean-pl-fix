from datasets import load_dataset
from dpv2_solver import query_dpv2 # Assumed to be defined elsewhere
import os
import json # For JSONDecodeError
import time
import threading
from collections import deque
from concurrent.futures import ThreadPoolExecutor, as_completed

# Configuration for concurrency and rate limiting
MAX_WORKERS = 10  # Max concurrent API calls (adjust as needed)
API_REQUESTS_LIMIT = 50  # Max requests (e.g., 50)
API_WINDOW_SECONDS = 60  # Per time window (e.g., 60 seconds for 1 minute)
# Retry configuration for individual problem processing errors (e.g., JSONDecodeError)
PROBLEM_RETRY_MAX_ATTEMPTS = 3
PROBLEM_RETRY_BASE_DELAY_SECONDS = 2 # Base for exponential backoff

class APIRateLimiter:
    def __init__(self, max_requests, per_seconds):
        self.max_requests = max_requests
        self.per_seconds = per_seconds
        self.requests_timestamps = deque()
        self.lock = threading.Lock()

    def wait_for_slot(self):
        current_thread_name = threading.current_thread().name
        while True:
            with self.lock:
                now = time.monotonic()
                # Remove timestamps older than our window
                while self.requests_timestamps and self.requests_timestamps[0] <= now - self.per_seconds:
                    self.requests_timestamps.popleft()

                if len(self.requests_timestamps) < self.max_requests:
                    self.requests_timestamps.append(now)
                    # print(f"[{current_thread_name}] Rate limit slot acquired. Queue: {len(self.requests_timestamps)}")
                    return # Slot acquired
                
                # Calculate time to wait for the oldest request to fall out of the window
                time_to_wait_for_slot = (self.requests_timestamps[0] + self.per_seconds) - now
                # print(f"[{current_thread_name}] Rate limit active. Queue: {len(self.requests_timestamps)}. Waiting for slot.")
            
            # Sleep outside the lock
            actual_sleep_time = max(0, time_to_wait_for_slot) + 0.1 # Small buffer
            # print(f"[{current_thread_name}] Rate limiter sleeping for {actual_sleep_time:.2f}s.")
            time.sleep(actual_sleep_time)

# Global rate limiter instance
rate_limiter = APIRateLimiter(max_requests=API_REQUESTS_LIMIT, per_seconds=API_WINDOW_SECONDS)

def process_single_problem(problem_data, base_dir, global_rate_limiter):
    problem_name = problem_data['name']
    output_filepath = os.path.join(base_dir, problem_name + '.lean')
    current_thread_name = threading.current_thread().name

    # This check is mostly for safety if a problem slips through pre-filtering.
    # The main pre-filtering loop is the primary mechanism for skipping existing files.
    if os.path.exists(output_filepath):
        # This message might be redundant if pre-filtering logs it, but good for clarity.
        # print(f"[{current_thread_name}] File {output_filepath} already exists. Skipping problem {problem_name} (checked in worker).")
        return f"Skipped (exists, re-checked in worker): {problem_name}"

    print(f"[{current_thread_name}] Starting to process problem: {problem_name}")

    formal_statement = (problem_data['header'] + problem_data['formal_statement']).strip()
    prompt_template = """
    Complete the following Lean 4 code:

    ```lean4
    {}
    ```

    Before producing the Lean 4 code to formally prove the given theorem, provide a detailed proof plan outlining the main proof steps and strategies.
    The plan should highlight key ideas, intermediate lemmas, and proof structures that will guide the construction of the final formal proof.
    Wrap your final answer in ```lean4 and ``` tags.
    """.strip()
    prompt = prompt_template.format(formal_statement)

    api_response_content = None
    
    for attempt in range(PROBLEM_RETRY_MAX_ATTEMPTS):
        try:
            # Wait for rate limiter before making the API call
            global_rate_limiter.wait_for_slot()
            
            # print(f"[{current_thread_name}] Calling API for {problem_name} (attempt {attempt + 1}/{PROBLEM_RETRY_MAX_ATTEMPTS})")
            api_response_content = query_dpv2(prompt) # query_dpv2 is the API call function
            # print(f"[{current_thread_name}] API call successful for {problem_name}")
            break # Successful query, exit retry loop
        except json.JSONDecodeError as e:
            print(f"[{current_thread_name}] JSONDecodeError for problem {problem_name} (attempt {attempt + 1}/{PROBLEM_RETRY_MAX_ATTEMPTS}): {e}")
            if attempt + 1 == PROBLEM_RETRY_MAX_ATTEMPTS:
                print(f"[{current_thread_name}] Failed to query {problem_name} after {PROBLEM_RETRY_MAX_ATTEMPTS} attempts due to JSONDecodeError. Giving up.")
                return f"Failed (JSONDecodeError after retries): {problem_name}"
            # Exponential backoff for retries on this specific problem's error
            sleep_duration = PROBLEM_RETRY_BASE_DELAY_SECONDS * (2 ** attempt)
            print(f"[{current_thread_name}] Retrying {problem_name} in {sleep_duration}s...")
            time.sleep(sleep_duration)
        except Exception as e: # Catch other unexpected errors from query_dpv2
            print(f"[{current_thread_name}] Unexpected error during query for problem {problem_name} (attempt {attempt + 1}): {e}. Giving up on this problem.")
            return f"Failed (Unexpected Exception): {problem_name}" # Stop retrying for unexpected errors

    if api_response_content is None:
        # This path is taken if all retries for JSONDecodeError failed and loop completed.
        return f"Failed (No API Response after retries): {problem_name}"

    # Parsing logic for the API response
    start_tag = "```lean4"
    end_tag = "```"
    start_index = api_response_content.rfind(start_tag)
    
    extracted_code = ""
    if start_index != -1:
        content_start_actual = start_index + len(start_tag)
        # Search for the end_tag *after* the found start_tag's content begins
        end_index = api_response_content.rfind(end_tag, content_start_actual)
        if end_index != -1 and end_index > content_start_actual : # Ensure end_tag is after content_start_actual
            extracted_code = api_response_content[content_start_actual:end_index].strip()
        else:
            print(f"[{current_thread_name}] Warning: End tag '{end_tag}' not found appropriately after start tag for problem {problem_name}.")
            return f"Failed (Parsing - end tag issue): {problem_name}"
    else:
        print(f"[{current_thread_name}] Warning: Start tag '{start_tag}' not found for problem {problem_name}.")
        return f"Failed (Parsing - no start tag): {problem_name}"

    if not extracted_code.strip():
        print(f"[{current_thread_name}] Warning: Extracted code is empty for problem {problem_name}.")
        # Depending on requirements, this might be a failure or an acceptable empty result.
        # For now, let's treat it as a potential issue but still write the empty file.
        # If empty files are not desired, return a "Failed (Empty Content)" status here.

    # File writing
    # The base_dir (output_base_dir) is created once globally before starting threads.
    with open(output_filepath, 'w') as f:
        f.write(extracted_code)
    
    return f"Success: {problem_name}"

# --- Main script execution logic, replacing the original loop ---
import json
ds = []
with open("dataset/proofnet.jsonl", 'r') as f:
    for line in f:
        ds.append(json.loads(line))
output_base_dir = "dataset/proofnet"

# Ensure the base output directory exists. This is thread-safe.
os.makedirs(output_base_dir, exist_ok=True)

# Pre-filter problems to avoid submitting tasks for already existing files
problems_to_process_list = []
for problem_item_data in ds:
    problem_item_name = problem_item_data['name']
    output_file_path_check = os.path.join(output_base_dir, problem_item_name + '.lean')
    if os.path.exists(output_file_path_check):
        print(f"File {output_file_path_check} already exists. Skipping problem {problem_item_name} (pre-check).")
    else:
        problems_to_process_list.append(problem_item_data)


if not problems_to_process_list:
    print("No new problems to process after pre-filtering.")
else:
    print(f"Found {len(problems_to_process_list)} problems to process.")
    
    with ThreadPoolExecutor(max_workers=MAX_WORKERS, thread_name_prefix='ProverBenchWorker') as executor:
        # Submit all tasks to the executor
        future_to_problem_name_map = {
            executor.submit(process_single_problem, prob_data, output_base_dir, rate_limiter): prob_data['name']
            for prob_data in problems_to_process_list
        }

        # Process results as they complete
        for future_task in as_completed(future_to_problem_name_map):
            completed_problem_name = future_to_problem_name_map[future_task]
            try:
                result_message = future_task.result() # Get the return value from process_single_problem
                # The process_single_problem function prints detailed status for its operations.
                # This print confirms completion from the main thread's perspective.
                print(f"[Main] Task for problem '{completed_problem_name}' completed. Result: {result_message}")
            except Exception as exc:
                # This catches exceptions that might occur if future.result() itself fails,
                # or if an unhandled exception escapes process_single_problem (though it aims to handle them).
                print(f"[Main] Problem '{completed_problem_name}' generated an unhandled exception in executor: {exc}")

# The original selection ended at f.write(answer).
# The code above, including the ThreadPoolExecutor block, replaces the original for loop.
# Any code after the original for loop in the file would follow here.
# For example, a final "All processing finished." message would be outside this selection.