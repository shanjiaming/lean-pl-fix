from decompose_solver import run_with_header_env, header, solve_theorem

current_file_str = ""

def fix_single_proof(input_content):
    global current_file_str
    current_list = []
    current_location = None
    run_result = run_with_header_env(input_content, all_tactics=True)
    for tactic in run_result.tactics:
        tactictxt = tactic.tactic
        print("tactictxt", tactictxt)
        # breakpoint()
        tactictxt = tactictxt.strip().split()[0]
        if current_location is not None and current_location >= tactic.start_pos:
            continue
        current_location = tactic.end_pos
        # if tactic == "sorry":
            # continue
        current_list.append(tactictxt)
    current_file_str += " ".join(current_list) + "\n"
    return input_content


# fix_single_proof_dpv2("""import Mathlib
# import Aesop
# set_option maxHeartbeats 0
# open BigOperators Real Nat Topology Rat
# theorem hh (x_shadow_ x : ℝ) : x + 0 = x:= by 
#   smp""")

# fix_single_proof_dpv2 = lambda x: save_to_file(x, "dpv2_batch_solver.py")

import os
def fix_single_proof_dpv2(proof_framework):
    folder_name = f"zzz_proof_framework"
    os.makedirs(folder_name, exist_ok=True)
    filename = "demo_theorem"
    with open(os.path.join(folder_name, f"{filename}_tactic_collector.txt"), "w") as f:
        f.write(proof_framework)
    return proof_framework


def solve_theorem_dpv2(input_content):
    global current_file_str
    current_file_str = ""
    solve_theorem(input_content, fix_single_proof)
    return current_file_str

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

s="""theorem ex_mathlib (x : ℝ) : x + 0 = x:= by
  have (y : ℝ) : y + 0 = y:= by
    have hh (z : ℝ) : z + 0 = z:= by simp
    exact hh
  have h2 : x + 0 = x:= by
    rw [add_zero]
  exact h2
"""

print(solve_theorem_dpv2(s))


# 1. 'have this : (y : ℝ)' have bug, 多余的冒号
# 2. '似乎直接跑会受到错误影响。会自动跳过多余策略吗？未可知'