import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- 
The graph of $y=ax^2 + bx + c$ is a parabola with vertical axis of symmetry.  
The vertex of this parabola is $(2,3)$ and the parabola contains the point $(4,4)$.  
Find the value of $y$ when $x=6$. Show that it is 7.
-/
theorem mathd_algebra_214 (a : ℝ) (f : ℝ → ℝ) 
    (h₀ : ∀ x, f x = a * (x - 2) ^ 2 + 3)  -- The function is given in vertex form with vertex at (2,3)
    (h₁ : f 4 = 4) :                        -- The parabola passes through (4,4)
    f 6 = 7 := by
  -- First, we'll find the coefficient 'a' using the point (4,4)
  
  -- Step 1: Substitute x=4 into the function definition
  have h₂ : f 4 = a * (4 - 2) ^ 2 + 3 := h₀ 4
  
  -- Step 2: Simplify the equation using h₁ (f 4 = 4)
  have h₃ : 4 = a * (2) ^ 2 + 3 := by
    rw [h₁] at h₂      -- Replace f 4 with 4
    linarith
  have h₄ : 4 = a * 4 + 3 := by
    rw [pow_two] at h₃  -- Replace 2^2 with 4
    linarith
  
  -- Step 4: Solve the linear equation for 'a'
  have h₅ : 1 = a * 4 := by
    rw [← sub_eq_zero] at h₄
    linarith
  
  have h₆ : a = 1/4 := by
    field_simp [h₅]
  have h₇ : ∀ x, f x = (1/4) * (x - 2) ^ 2 + 3 := by
    intro x
    rw [h₀, h₆]
  
  -- Step 6: Compute f(6) using the function definition
  have h₈ : f 6 = (1/4) * (6 - 2) ^ 2 + 3 := h₇ 6
  
  -- Step 7: Simplify the computation
  have h₉ : f 6 = (1/4) * (4) ^ 2 + 3 := by
    linarith
  have h₁₀ : f 6 = (1/4) * 16 + 3 := by
    rw [pow_two] at h₉   -- Replace 4^2 with 16
    linarith
  
  -- Final computation
  have h₁₁ : f 6 = 4 + 3 := by
    norm_num at h₁₀      -- Compute (1/4)*16 = 4
    norm_num
    exact h₁₀
  
  -- Conclusion
  rw [h₁₁]              -- Show that 4 + 3 = 7
  norm_num