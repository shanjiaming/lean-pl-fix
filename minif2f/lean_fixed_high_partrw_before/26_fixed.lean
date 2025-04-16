import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- If $321_{b}$ is equal to the base 10 integer 57, find $b$ given that $b>0$. Show that it is 4.-/
theorem mathd_numbertheory_48 (b : ℕ) (h₀ : 0 < b) (h₁ : 3 * b ^ 2 + 2 * b + 1 = 57) : b = 4 := by
  -- Our goal is to solve for b in the equation 3b² + 2b + 1 = 57
  -- First, simplify the equation to standard quadratic form
  have h₂ : 3 * b ^ 2 + 2 * b + 1 - 57 = 0 := by rw [h₁]; simp
  -- Which simplifies to 3b² + 2b - 56 = 0
  have h₃ : 3 * b ^ 2 + 2 * b - 56 = 0 := by linear_combination h₂
  
  -- We can now solve this quadratic equation for b
  -- The quadratic formula solutions are (-2 ± √(4 + 672))/6
  -- Calculate discriminant: 2² - 4*3*(-56) = 4 + 672 = 676
  have discr : 2^2 - 4 * 3 * (-56) = 676 := by norm_num
  -- Square root of discriminant is 26 since 26² = 676
  norm_num
  
  -- The positive solution is (-2 + 26)/6 = 24/6 = 4
  -- The negative solution would be (-2 - 26)/6 = -28/6 which is negative and invalid (b > 0)
  
  -- We can verify that b = 4 satisfies the original equation
  have h₄ : b = 4 ∨ b = (-2 - 26)/6 := by
    -- Apply quadratic formula
    apply eq_quadratic_roots
    · show 3 ≠ 0; norm_num
    · show 2 ≠ 0; norm_num
    · show -56 ≠ 0; norm_num
    · exact h₃
    · rw [discr]
  
  -- Eliminate the negative solution since b > 0
  cases h₄ with
  | inl h => exact h
  | inr h => 
    -- The negative solution is invalid since b is a natural number > 0
    have h₅ : b < 0 := by
      rw [h]
      -- Compute (-2 - 26)/6 = -28/6 ≈ -4.666...
      norm_num
    omega