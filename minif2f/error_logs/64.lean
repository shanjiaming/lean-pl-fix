import Mathlib
import Aesop

set_option maxHeartbeats 0  -- Disables heartbeat limit to prevent timeout during execution

open BigOperators Real Nat Topology Rat  -- Opens relevant mathematical namespaces

/-- 
Let $f(x) = 3\sqrt{2x - 7} - 8$. Find $f(8)$. Show that it is 1.
This theorem states that for a function f defined as above, evaluating f at 8 yields 1.
-/
theorem mathd_algebra_433 (f : ℝ → ℝ) (h₀ : ∀ x, f x = 3 * Real.sqrt (2 * x - 7) - 8) : f 8 = 1 := by
  -- First, we'll use the function definition provided in hypothesis h₀
  rw [h₀]  -- Rewrite the goal f 8 using the function definition
  -- Now the goal becomes: 3 * Real.sqrt (2 * 8 - 7) - 8 = 1
  
  -- Let's simplify the expression inside the square root
  have step1 : 2 * 8 - 7 = 9 := by  -- First compute 2*8-7
    norm_num  -- Normalize numerical expressions (computes 2*8=16, then 16-7=9)
  
  -- Rewrite the goal using this simplified form
  rw [step1]  -- Now the goal becomes: 3 * Real.sqrt 9 - 8 = 1
  
  -- We know that √9 = 3, so let's state this fact
  have step2 : Real.sqrt 9 = 3 := by
    exact Real.sqrt_eq_three  -- Uses the library lemma that √9 = 3
  
  -- Rewrite the goal using this fact
  rw [step2]  -- Now the goal becomes: 3 * 3 - 8 = 1
  
  -- Compute 3 * 3 - 8
  have step3 : 3 * 3 - 8 = 1 := by
    norm_num  -- Computes 3*3=9, then 9-8=1
  
  -- Finally, rewrite the goal using this computation
  rw [step3]  -- Goal is now 1 = 1
  
  -- The goal is now trivially true by reflexivity
  rfl  -- Closes the goal using reflexivity of equality