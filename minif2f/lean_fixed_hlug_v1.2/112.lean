import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What positive two-digit integer is exactly twice the sum of its digits? Show that it is 18.-/
theorem mathd_numbertheory_284 (a b : ℕ) (h₀ : 1 ≤ a ∧ a ≤ 9 ∧ b ≤ 9)
  (h₁ : 10 * a + b = 2 * (a + b)) : 10 * a + b = 18 := by
  -- We need to solve for digits a and b where:
  -- 1. a is between 1 and 9 (first digit can't be 0)
  -- 2. b is between 0 and 9
  -- 3. The number (10a + b) equals twice the sum of its digits (2*(a + b))
  
  -- First, simplify the equation h₁ to find a relationship between a and b
  have h₂ : 10 * a + b = 2 * a + 2 * b := by
    -- Distribute the multiplication on the right side of h₁
    rw [mul_add] at h₁
    exact h₁
  
  -- Subtract 2a and b from both sides to simplify
  have h₃ : 8 * a = b := by
    -- Rewrite h₂: 10a + b - 2a - b = 2a + 2b - 2a - b
    -- Simplifies to: 8a = b
    linarith
  
  -- Now we know b = 8a. But from h₀, we know:
  -- 1 ≤ a ≤ 9 and b ≤ 9 (since b is a digit)
  
  -- Substitute b = 8a into b ≤ 9
  have h₄ : 8 * a ≤ 9 := by
    rw [← h₃]
    exact h₀.2.2
  
  -- Since a is a natural number ≥ 1, let's find possible values
  -- 8*1 = 8 ≤ 9, 8*2 = 16 > 9 ⇒ only a=1 is possible
  
  -- Solve for a using the inequality 8a ≤ 9 and a ≥ 1
  have h₅ : a = 1 := by
    -- We know 1 ≤ a and 8a ≤ 9
    -- Try a=1: 8*1=8 ≤9, satisfies all conditions
    -- Try a=2: 8*2=16 >9, doesn't satisfy
    -- Therefore a must be 1
    interval_cases a
    · -- Case a=0: contradicts h₀ (1 ≤ a)
      simp at h₀
    · -- Case a=1: check if it satisfies all conditions
      simp
    · -- Cases a=2 through a=9: all lead to 8a > 9
      all_goals {
        have : 8 * a > 9 := by
          have : a ≥ 2 := by assumption
          linarith
        contradiction
      }
  
  -- Now that we know a=1, we can find b using h₃
  have h₆ : b = 8 := by
    rw [h₅, mul_one] at h₃
    exact h₃
  
  -- Now compute the original number 10a + b
  have h₇ : 10 * a + b = 10 * 1 + 8 := by
    rw [h₅, h₆]
  
  -- Simplify to show the result is 18
  simp [h₅, h₆]