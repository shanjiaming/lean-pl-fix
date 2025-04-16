import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- 
One dimension of a cube is increased by 1, another is decreased by 1, and the third is left unchanged. 
The volume of the new rectangular solid is 5 less than that of the cube. What was the volume of the cube?

Options:
(A) 8 (B) 27 (C) 64 (D) 125 (E) 216 

We will prove that the correct answer is (D) 125.
-/
theorem amc12a_2009_p5 (x : ℝ) (h₀ : x ^ 3 - (x + 1) * (x - 1) * x = 5) : x ^ 3 = 125 := by
  -- First, let's simplify the given equation h₀ which represents the volume difference
  -- Original volume: x³
  -- New volume: (x+1)*(x-1)*x
  -- Difference: x³ - (x+1)(x-1)x = 5

  -- Step 1: Expand (x+1)(x-1) using difference of squares formula
  have h₁ : (x + 1) * (x - 1) = x^2 - 1 := by ring

  -- Step 2: Substitute back into the original equation
  -- Now the equation becomes: x³ - (x² - 1)*x = 5
  have h₂ : x^3 - (x^2 - 1) * x = 5 := by rwa [h₁]

  -- Step 3: Expand the left side of the equation
  -- (x² - 1)*x = x³ - x
  -- So the equation becomes: x³ - (x³ - x) = 5
  have h₃ : x^3 - (x^3 - x) = 5 := by
    rw [mul_sub, mul_one] at h₂
    exact h₂

  -- Step 4: Simplify the equation further
  -- x³ - x³ + x = 5 → x = 5
  have h₄ : x = 5 := by
    simp only [sub_sub_cancel_left] at h₃
    exact h₃

  -- Step 5: Now we can compute x³
  -- x = 5 → x³ = 5³ = 125
  rw [h₄]
  norm_num