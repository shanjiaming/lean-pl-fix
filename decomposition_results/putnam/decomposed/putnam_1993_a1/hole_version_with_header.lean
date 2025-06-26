import Mathlib

-- 4 / 9
/--
The horizontal line $y=c$ intersects the curve $y=2x-3x^3$ in the first quadrant as in the figure. Find $c$ so that the areas of the two shaded regions are equal. [Figure not included. The first region is bounded by the $y$-axis, the line $y=c$ and the curve; the other lies under the curve and above the line $y=c$ between their two points of intersection.]
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)

theorem putnam_1993_a1
: 0 < ((4 / 9) : ℝ ) ∧ ((4 / 9) : ℝ ) < (4 * Real.sqrt 2) / 9 ∧ (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ ) - (2 * x - 3 * x ^ 3)) 0) = (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ )) 0) := by
  have h₁ : 0 < ((4 / 9) : ℝ) := by hole_1
  
  have h₂ : ((4 / 9) : ℝ) < (4 * Real.sqrt 2) / 9 := by
    have h₂₁ : Real.sqrt 2 > 1 := by
      hole_2
    have h₂₂ : (4 : ℝ) / 9 < (4 * Real.sqrt 2) / 9 := by
      hole_3
    hole_4
  
  have h₃ : (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0) = (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0) := by
    have h₃₁ : (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0) = 0 := by
      
      have h₃₁₁ : ∀ x ∈ Set.Ioo 0 ((Real.sqrt 2) / 3), (max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0 : ℝ) = 0 := by
        intro x hx
        have h₃₁₂ : 0 < x := by
          hole_5
        have h₃₁₃ : x < (Real.sqrt 2) / 3 := by
          hole_6
        have h₃₁₄ : (4 / 9 : ℝ) - (2 * x - 3 * x ^ 3) ≤ 0 := by
          
          have h₃₁₅ : 0 < x := h₃₁₂
          have h₃₁₆ : x < (Real.sqrt 2) / 3 := h₃₁₃
          have h₃₁₇ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
          have h₃₁₈ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
          have h₃₁₉ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
          
          hole_7
        
        have h₃₁₅ : (max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0 : ℝ) = 0 := by
          hole_8
        hole_9
      
      have h₃₁₆ : (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0) = 0 := by
        have h₃₁₇ : (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0) = ∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), (0 : ℝ) := by
          hole_10
        hole_11
      hole_12
    have h₃₂ : (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0) = 0 := by
      
      have h₃₂₁ : ∀ x ∈ Set.Ioo 0 ((Real.sqrt 6) / 3), (max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0 : ℝ) = 0 := by
        intro x hx
        have h₃₂₂ : 0 < x := by
          hole_13
        have h₃₂₃ : x < (Real.sqrt 6) / 3 := by
          hole_14
        have h₃₂₄ : (2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ) ≤ 0 := by
          
          have h₃₂₅ : 0 < x := h₃₂₂
          have h₃₂₆ : x < (Real.sqrt 6) / 3 := h₃₂₃
          have h₃₂₇ : 0 < Real.sqrt 6 := Real.sqrt_pos.mpr (by norm_num)
          have h₃₂₈ : 0 < Real.sqrt 6 := Real.sqrt_pos.mpr (by norm_num)
          have h₃₂₉ : 0 < Real.sqrt 6 := Real.sqrt_pos.mpr (by norm_num)
          
          hole_15
        
        have h₃₂₅ : (max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0 : ℝ) = 0 := by
          hole_16
        hole_17
      
      have h₃₂₆ : (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0) = 0 := by
        have h₃₂₇ : (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0) = ∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), (0 : ℝ) := by
          hole_18
        hole_19
      hole_20
    
    hole_21
  
  hole_22