import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- For what values of $x$ is it true that $x^2 - 5x - 4 \le 10$? Express your answer in interval notation. Show that it is x ∈ [-2,7].-/
theorem mathd_algebra_101 (x : ℝ) (h₀ : x ^ 2 - 5 * x - 4 ≤ 10) : x ≥ -2 ∧ x ≤ 7 := by
  -- First, we rewrite the inequality to standard quadratic form: x² - 5x - 14 ≤ 0
  have h₁ : x ^ 2 - 5 * x - 14 ≤ 0 := by
    -- Subtract 10 from both sides of the original inequality
    linarith only [h₀]
  
  -- Factor the quadratic expression: (x + 2)(x - 7) ≤ 0
  have h₂ : (x + 2) * (x - 7) ≤ 0 := by
    -- Expand (x + 2)(x - 7) to show it equals x² - 5x - 14
    rw [add_mul, sub_mul, mul_comm x 2, ← sub_eq_add_neg]
    simp only [mul_one, sub_sub, add_sub_cancel]
    exact h₁
  
  -- The product (x+2)(x-7) ≤ 0 when x is between the roots -2 and 7
  -- We use the theorem mul_nonpos_iff which states that a*b ≤ 0 ↔ (a ≤ 0 ∧ b ≥ 0) ∨ (a ≥ 0 ∧ b ≤ 0)
  rw [mul_nonpos_iff] at h₂
  
  -- We now consider both cases from the disjunction
  cases' h₂ with h₂_left h₂_right
  · -- Case 1: (x + 2 ≤ 0 ∧ x - 7 ≥ 0)
    -- This would mean x ≤ -2 and x ≥ 7 simultaneously, which is impossible
    -- We show this leads to a contradiction
    rcases h₂_left with ⟨h_le, h_ge⟩
    have : x ≤ -2 ∧ x ≥ 7 := ⟨h_le, by linarith only [h_ge]⟩
    -- But x can't be ≤ -2 and ≥ 7 at the same time
    linarith only [this]
  
  · -- Case 2: (x + 2 ≥ 0 ∧ x - 7 ≤ 0)
    -- This gives us x ≥ -2 and x ≤ 7, which is our desired conclusion
    rcases h₂_right with ⟨h_ge, h_le⟩
    exact ⟨by linarith only [h_ge], by linarith only [h_le]⟩