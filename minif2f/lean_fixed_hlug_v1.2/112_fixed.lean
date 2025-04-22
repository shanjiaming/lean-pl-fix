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
    omega
  have h₅ : a = 1 := by
    -- We know 1 ≤ a and 8a ≤ 9
    -- Try a=1: 8*1=8 ≤9, satisfies all conditions
    -- Try a=2: 8*2=16 >9, doesn't satisfy
    -- Therefore a must be 1
    omega
  have h₆ : b = 8 := by
    rw [h₅, mul_one] at h₃
    omega
  
  -- Now compute the original number 10a + b
  have h₇ : 10 * a + b = 10 * 1 + 8 := by
    rw [h₅, h₆]
  
  -- Simplify to show the result is 18
  simp [h₅, h₆]