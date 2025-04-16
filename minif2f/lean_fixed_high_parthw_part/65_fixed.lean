import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- 
The midpoint of the line segment between (x,y) and (-9,1) is (3,-5). 
Find (x,y). Show that it is (15,-11).
-/
theorem mathd_algebra_126 (x y : ℝ) (h₀ : 2 * 3 = x - 9) (h₁ : 2 * -5 = y + 1) : x = 15 ∧ y = -11 := by
  -- We need to prove both x = 15 and y = -11. We'll split this into two subgoals.
  constructor
  -- First goal: prove x = 15
  · -- From hypothesis h₀: 2 * 3 = x - 9
    -- Simplify the left side: 2 * 3 = 6
    rw [mul_comm] at h₀  -- Optional: rewrites 2 * 3 to 3 * 2 (not strictly necessary)
    simp at h₀           -- Simplifies 3 * 2 to 6
    -- Now h₀ is 6 = x - 9
    -- Add 9 to both sides to solve for x
    linarith            -- Linear arithmetic can solve this equation
  -- Second goal: prove y = -11
  · -- From hypothesis h₁: 2 * -5 = y + 1
    -- Simplify the left side: 2 * -5 = -10
    simp at h₁          -- Simplifies 2 * -5 to -10
    -- Now h₁ is -10 = y + 1
    -- Subtract 1 from both sides to solve for y
    linarith            -- Linear arithmetic can solve this equation