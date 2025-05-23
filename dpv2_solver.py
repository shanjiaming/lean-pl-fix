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

from decompose_solver import run_with_header_env, header, solve_theorem, solve_theorem_unified, solve_theorem_by_id, unified_env
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

def dpv2_fix(input_content, error_message_str):
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

fix_single_proof_dpv2 = make_single_fix(dpv2_fix)

# New unified version
def fix_single_proof_dpv2_unified(problem: Problem):
    """Create a DPV2 fixer for a specific problem using its header"""
    return make_single_fix_unified(problem, dpv2_fix_unified)

def solve_theorem_dpv2(input_content):
    return solve_theorem(input_content, fix_single_proof_dpv2)

def solve_theorem_dpv2_unified(problem: Problem):
    """Solve a theorem using DPV2 with the unified system"""
    fixer = fix_single_proof_dpv2_unified(problem)
    return solve_theorem_unified(problem, fixer)

def solve_theorem_dpv2_by_id(dataset: str, problem_id: str):
    """Solve a theorem by dataset and problem ID using DPV2"""
    problem = problem_manager.get_problem(dataset, problem_id)
    if not problem:
        raise ValueError(f"Problem {dataset}/{problem_id} not found")
    return solve_theorem_dpv2_unified(problem)

s="""theorem algebra_9onxpypzleqsum2onxpy (x y z : ℝ) (h₀ : 0 < x ∧ 0 < y ∧ 0 < z) :
    9 / (x + y + z) ≤ 2 / (x + y) + 2 / (y + z) + 2 / (z + x) := by
  have h₁ : 0 < x + y := by linarith
  have h₂ : 0 < y + z := by linarith
  have h₃ : 0 < z + x := by linarith
  have h₄ : 0 < x + y + z := by linarith
  have h₅ : 0 < (x + y) * (y + z) * (z + x) := by positivity
  have h₆ : 0 < (x + y) * (y + z) := by positivity
  have h₇ : 0 < (y + z) * (z + x) := by positivity
  have h₈ : 0 < (z + x) * (x + y) := by positivity
  have h₉ : 2 * (x + y + z) * (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) ≥ 9 := by
    have h₉₁ : 0 < x + y := by linarith
    have h₉₂ : 0 < y + z := by linarith
    have h₉₃ : 0 < z + x := by linarith
    have h₉₄ : 0 < (x + y) * (y + z) := by positivity
    have h₉₅ : 0 < (y + z) * (z + x) := by positivity
    have h₉₆ : 0 < (z + x) * (x + y) := by positivity
    field_simp [h₉₁.ne', h₉₂.ne', h₉₃.ne']
    rw [le_div_iff (by positivity)]
    nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x),
      sq_nonneg (x + y - y - z), sq_nonneg (y + z - z - x), sq_nonneg (z + x - x - y)]
  
  have h₁₀ : (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) ≥ 9 / (2 * (x + y + z)) := by
    have h₁₀₁ : 0 < x + y + z := by linarith
    have h₁₀₂ : 0 < 2 * (x + y + z) := by positivity
    have h₁₀₃ : 0 < x + y := by linarith
    have h₁₀₄ : 0 < y + z := by linarith
    have h₁₀₅ : 0 < z + x := by linarith
    -- Use the given inequality to derive the desired result
    calc
      (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) ≥ 9 / (2 * (x + y + z)) := by
        -- Use the given inequality to derive the desired result
        have h₁₀₆ : 2 * (x + y + z) * (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) ≥ 9 := by
          simpa [add_assoc] using h₉
        calc
          (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) = (2 * (x + y + z) * (1 / (x + y) + 1 / (y + z) + 1 / (z + x))) / (2 * (x + y + z)) := by
            field_simp [h₁₀₁.ne', h₁₀₂.ne']
            <;> ring
            <;> field_simp [h₁₀₁.ne', h₁₀₂.ne']
            <;> ring
          _ ≥ 9 / (2 * (x + y + z)) := by
            -- Use the given inequality to derive the desired result
            rw [ge_iff_le]
            rw [div_le_div_iff (by positivity) (by positivity)]
            nlinarith
      _ = 9 / (2 * (x + y + z)) := by rfl
  
  have h₁₁ : (2 / (x + y) + 2 / (y + z) + 2 / (z + x)) ≥ 9 / (x + y + z) := by
    have h₁₁₁ : 2 / (x + y) + 2 / (y + z) + 2 / (z + x) = 2 * (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) := by
      ring
    rw [h₁₁₁]
    have h₁₁₂ : 9 / (x + y + z) = 2 * (9 / (2 * (x + y + z))) := by
      field_simp [h₄.ne']
      <;> ring
      <;> field_simp [h₄.ne']
      <;> ring
    rw [h₁₁₂]
    have h₁₁₃ : 1 / (x + y) + 1 / (y + z) + 1 / (z + x) ≥ 9 / (2 * (x + y + z)) := by
      linarith
    nlinarith
  
  have h₁₂ : 9 / (x + y + z) ≤ 2 / (x + y) + 2 / (y + z) + 2 / (z + x) := by
    linarith
  
  exact h₁₂
"""

# s="""theorem ex_mathlib (x : ℝ) : x + 0 = x:= by
#   have (y : ℝ) : y + 0 = y:= by
#     have hh (z : ℝ) : z + 0 = z:= by simp
#     exact hh
#   have h2 : x + 0 = x:= by
#     rw [add_zero]
#   exact h2
# """

# solve_theorem_dpv2(s)
