from openai import OpenAI

client = OpenAI(
  base_url="https://openrouter.ai/api/v1",
  api_key="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",
)


def query_dpv2(input_content):
    completion = client.chat.completions.create(
        extra_headers={
    },
    extra_body={},
    model="deepseek/deepseek-prover-v2:free",
    messages=[
        {
        "role": "user",
        "content": input_content
        }
    ]
    )
    return completion.choices[0].message.content

from decompose_solver import run_with_header_env, header, solve_theorem

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

def dpv2_fix(input_content, error_message_str):
    prompt = make_prompt_for_dpv2(header, input_content, error_message_str)
    answer = query_dpv2(prompt)
    theorem_content = answer.split("```theorem")[1].split("```")[0]
    theorem_content = "theorem" + theorem_content
    return theorem_content



def make_single_fix(fix_func):
    def fix_single_proof(input_content):
        run_result = run_with_header_env(input_content)
        print(run_result)
        error_messages = [m.data for m in getattr(run_result, 'messages', []) if m.severity == "error"]
        if not error_messages:
            return input_content
        else:
            error_message_str = "\n\n".join(error_messages)
            # Pass the original input_content and the error_message_str separately
            theorem_content = fix_func(input_content, error_message_str)
            run_result = run_with_header_env(theorem_content)
            error_messages = [m.data for m in getattr(run_result, 'messages', []) if m.severity == "error"]
            if not error_messages:
                return theorem_content
            else:
                print(f"before_fix: \n{input_content}")
                print(f"after_fix: \n{theorem_content}")
                assert False, "Failed to solve theorem"
                return theorem_content
                # return fix_single_proof_dpv2(theorem_content)
    return fix_single_proof

fix_single_proof_dpv2 = make_single_fix(dpv2_fix)

# fix_single_proof_dpv2("""import Mathlib
# import Aesop
# set_option maxHeartbeats 0
# open BigOperators Real Nat Topology Rat
# theorem hh (x_shadow_ x : ℝ) : x + 0 = x:= by 
#   smp""")

def solve_theorem_dpv2(input_content):
    return solve_theorem(input_content, fix_single_proof_dpv2)

# solve_theorem_dpv2("""theorem ex_mathlib (x : ℝ) : x + 0 = x:= by
#   have (x : ℝ) : x + 0 = x:= by
#     have hh (x : ℝ) : x + 0 = x:= by simp
#     simp
#   have h2 : x + 0 = x:= by
#     rw [mul_zero]
#   exact h2
# """)