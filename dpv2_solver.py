from openai import OpenAI

from dotenv import load_dotenv
import os

load_dotenv()
OPENROUTER_API_KEY = os.getenv("OPENROUTER_API_KEY")

client = OpenAI(
  base_url="https://openrouter.ai/api/v1",
  api_key=OPENROUTER_API_KEY,
)


def query_dpv2(input_content):
    completion = client.chat.completions.create(
        extra_headers={
    },
    extra_body={},
    # model="deepseek/deepseek-prover-v2:free",
    model="deepseek/deepseek-prover-v2",
    messages=[
        {
        "role": "user",
        "content": input_content
        }
    ]
    )
    return completion.choices[0].message.content

from decompose_solver import solve_theorem, solve_theorem_unified, solve_theorem_by_id
from unified_lean_environment import unified_env
from unified_problem_manager import Problem, problem_manager

def make_prompt_for_dpv2(header_content, theorem_content, error_msg):
    return f"""Fix this proof:
{header_content}
{theorem_content}
Error message:
{error_msg}

Return your answer in the following format:
```theorem THEOREM_CONTENT
PROOF_CONTENT
```
"""

def dpv2_fix(header, input_content, error_message_str):
    prompt = make_prompt_for_dpv2(header, input_content, error_message_str)
    answer = query_dpv2(prompt)
    theorem_content = answer.split("```theorem")[1].split("```")[0]
    theorem_content = "theorem" + theorem_content
    return theorem_content

def dpv2_fix_unified(problem: Problem, input_content: str, error_message_str: str):
    """DPV2 fix function that uses the problem's specific header"""
    header_content = problem_manager.get_header_content(problem)
    prompt = make_prompt_for_dpv2(header_content, input_content, error_message_str)
    answer = query_dpv2(prompt)
    theorem_content = answer.split("```theorem")[1].split("```")[0]
    theorem_content = "theorem" + theorem_content
    return theorem_content

def make_single_fix(header, fix_func):
    def fix_single_proof(input_content):
        run_result = unified_env.run_with_header(header, input_content)
        print(run_result)
        error_messages = [m.data for m in getattr(run_result, 'messages', []) if m.severity == "error"]
        if not error_messages:
            return input_content
        else:
            error_message_str = "\n\n".join(error_messages)
            # Pass the original input_content and the error_message_str separately
            theorem_content = fix_func(header, input_content, error_message_str)
            run_result = unified_env.run_with_header(header, theorem_content)
            error_messages = [m.data for m in getattr(run_result, 'messages', []) if m.severity == "error"]
            if not error_messages:
                return theorem_content
            else:
                print(f"before_fix: \n{input_content}")
                print(f"after_fix: \n{theorem_content}")
                assert False, "Failed to solve theorem"
                return theorem_content
    return fix_single_proof

def make_single_fix_unified(problem: Problem, fix_func):
    """Create a fix function that uses the unified environment with the problem's header"""
    def fix_single_proof(input_content):
        header_content = problem_manager.get_header_content(problem)
        run_result = unified_env.run_with_header(header_content, input_content)
        print(run_result)
        error_messages = [m.data for m in getattr(run_result, 'messages', []) if m.severity == "error"]
        if not error_messages:
            return input_content
        else:
            error_message_str = "\n\n".join(error_messages)
            # Pass the problem, original input_content and the error_message_str
            theorem_content = fix_func(problem, input_content, error_message_str)
            run_result = unified_env.run_with_header(header_content, theorem_content)
            error_messages = [m.data for m in getattr(run_result, 'messages', []) if m.severity == "error"]
            if not error_messages:
                return theorem_content
            else:
                print(f"before_fix: \n{input_content}")
                print(f"after_fix: \n{theorem_content}")
                assert False, "Failed to solve theorem"
                return theorem_content
    return fix_single_proof
