import Mathlib
import Aesop

set_option maxHeartbeats 0  -- Disables heartbeat limit to prevent timeout during proof

open BigOperators Real Nat Topology Rat

/-- Let \[f(x) = \begin{cases}
-x^2 - 1 &\text{if }x<0, \\
2&\text{if }0 \le x< 4, \\
\sqrt{x}&\text{if }x \ge 4.
\end{cases}
\]Find $f(\pi)$. Show that it is 2.-/
theorem mathd_algebra_480 (f : ℝ → ℝ) (h₀ : ∀ x < 0, f x = -x ^ 2 - 1)
  (h₁ : ∀ x, 0 ≤ x ∧ x < 4 → f x = 2) (h₂ : ∀ x ≥ 4, f x = Real.sqrt x) : f Real.pi = 2 := by
  -- Our goal is to compute f(π) and prove it equals 2
  -- First we need to determine which case of the piecewise function applies to π
  
  -- Step 1: Establish that 0 ≤ π < 4
  -- We'll need two facts about π:
  -- 1. π is positive (greater than 0)
  -- 2. π is less than 4
  
  -- Prove π > 0 using Mathlib's pi_pos lemma
  have pi_pos : 0 < Real.pi := pi_pos
  
  -- Prove π < 4 by showing π < 3.15 and 3.15 < 4
  -- First show 3.15 < 4 by norm_num (normalization of numerical expressions)
  have h_lt_4 : Real.pi < 4 := by
    -- We use the known approximation π < 3.15 from Mathlib
    refine lt_trans ?_ (by norm_num)
    exact pi_lt_three_point_fifteen
  
  -- Now we have all conditions to apply the second case of the function definition:
  -- 0 ≤ π (from pi_pos) and π < 4 (from h_lt_4)
  
  -- Apply the second case of the function definition using h₁
  -- First create the conjunction 0 ≤ π ∧ π < 4
  have pi_interval : 0 ≤ Real.pi ∧ Real.pi < 4 := by
    exact ⟨le_of_lt pi_pos, h_lt_4⟩
  
  -- Now apply h₁ with π and our interval proof
  have f_pi_eq : f Real.pi = 2 := h₁ Real.pi pi_interval
  
  -- Our goal is exactly what we just proved
  exact f_pi_eq