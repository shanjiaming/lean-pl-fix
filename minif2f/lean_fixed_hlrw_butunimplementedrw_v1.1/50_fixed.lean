import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What is the positive value of the expression $\sqrt{x^3 - 2^y}$ when $x = 5$ and $y = 2$? Show that it is 11.-/
theorem mathd_algebra_547 (x y : ℝ) (h₀ : x = 5) (h₁ : y = 2) : Real.sqrt (x ^ 3 - 2 ^ y) = 11 := by
  -- First, we substitute the given values x = 5 and y = 2 into the expression
  rw [h₀, h₁]
  -- Now the goal becomes: Real.sqrt (5 ^ 3 - 2 ^ 2) = 11
  
  -- Compute 5^3 which is 125
  have h5pow3 : 5 ^ 3 = 125 := by norm_num
  -- Compute 2^2 which is 4
  have h2pow2 : 2 ^ 2 = 4 := by norm_num
  
  -- Substitute these computed values into the expression
  rw [h5pow3]
  rw [h2pow2]
  -- Now the goal becomes: Real.sqrt (125 - 4) = 11
  
  -- Compute the subtraction inside the square root: 125 - 4 = 121
  have hsub : 125 - 4 = 121 := by norm_num
  rw [hsub]
  -- Now the goal becomes: Real.sqrt 121 = 11
  
  -- Compute the square root of 121, which is 11
  have hsqrt : Real.sqrt 121 = 11 := by norm_num
  rw [hsqrt]
  -- Goal is now simply 11 = 11
  
  -- Finally, reflexivity completes the proof
  rfl