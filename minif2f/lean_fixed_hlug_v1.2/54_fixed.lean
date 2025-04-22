import Mathlib
import Aesop

set_option maxHeartbeats 0  -- Disables the heartbeat limit to prevent timeout during execution

open BigOperators Real Nat Topology Rat

/-- 
At each basketball practice last week, Jenny made twice as many free throws as she made at the previous practice. 
At her fifth practice she made 48 free throws. How many free throws did she make at the first practice? 
Show that it is 3.
-/
theorem mathd_algebra_455 (x : ℝ) (h₀ : 2 * (2 * (2 * (2 * x))) = 48) : x = 3 := by
  -- The problem describes a geometric progression where each term is double the previous one
  -- Let's break down the given equation which represents the 5th practice (after 4 doublings):
  -- Practice 1: x
  -- Practice 2: 2x
  -- Practice 3: 2*(2x) = 4x
  -- Practice 4: 2*(4x) = 8x
  -- Practice 5: 2*(8x) = 16x = 48 (given in h₀)
  
  -- First, simplify the left-hand side of the equation h₀
  have h₁ : 2 * (2 * (2 * (2 * x))) = 16 * x := by
    -- Step-by-step simplification:
    -- Start with the innermost multiplication
    have step1 : 2 * x = 2 * x := by rfl
    -- Multiply by next 2
    have step2 : 2 * (2 * x) = 4 * x := by ring
    -- Multiply by next 2
    have step3 : 2 * (2 * (2 * x)) = 8 * x := by rw [step2]; ring
    -- Multiply by final 2
    have step4 : 2 * (2 * (2 * (2 * x))) = 16 * x := by rw [step3]; ring
    -- Use the final step
    exact step4
  
  -- Now rewrite the original hypothesis h₀ using the simplified form
  rw [h₁] at h₀
  -- Now we have h₀: 16 * x = 48
  
  -- To solve for x, we'll divide both sides by 16
  have h₂ : x = 48 / 16 := by
    -- Apply the property that if a * x = b then x = b / a (for a ≠ 0)
    linarith
  have h₃ : 48 / 16 = 3 := by norm_num
  
  -- Combine the results to prove x = 3
  rw [h₂]
  norm_num