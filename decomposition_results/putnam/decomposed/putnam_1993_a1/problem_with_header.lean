import Mathlib

-- 4 / 9
/--
The horizontal line $y=c$ intersects the curve $y=2x-3x^3$ in the first quadrant as in the figure. Find $c$ so that the areas of the two shaded regions are equal. [Figure not included. The first region is bounded by the $y$-axis, the line $y=c$ and the curve; the other lies under the curve and above the line $y=c$ between their two points of intersection.]
-/
theorem putnam_1993_a1
: 0 < ((4 / 9) : ℝ ) ∧ ((4 / 9) : ℝ ) < (4 * Real.sqrt 2) / 9 ∧ (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ ) - (2 * x - 3 * x ^ 3)) 0) = (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ )) 0) := by
  have h₁ : 0 < ((4 / 9) : ℝ) := by norm_num
  
  have h₂ : ((4 / 9) : ℝ) < (4 * Real.sqrt 2) / 9 := by
    have h₂₁ : Real.sqrt 2 > 1 := by
      norm_num [Real.lt_sqrt, Real.sqrt_lt]
    have h₂₂ : (4 : ℝ) / 9 < (4 * Real.sqrt 2) / 9 := by
      nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
    linarith
  
  have h₃ : (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0) = (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0) := by
    have h₃₁ : (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0) = 0 := by
      -- Prove that the integrand is zero in the given interval
      have h₃₁₁ : ∀ x ∈ Set.Ioo 0 ((Real.sqrt 2) / 3), (max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0 : ℝ) = 0 := by
        intro x hx
        have h₃₁₂ : 0 < x := by
          exact hx.1
        have h₃₁₃ : x < (Real.sqrt 2) / 3 := by
          exact hx.2
        have h₃₁₄ : (4 / 9 : ℝ) - (2 * x - 3 * x ^ 3) ≤ 0 := by
          -- Prove that the expression is non-positive in the interval
          have h₃₁₅ : 0 < x := h₃₁₂
          have h₃₁₆ : x < (Real.sqrt 2) / 3 := h₃₁₃
          have h₃₁₇ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
          have h₃₁₈ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
          have h₃₁₉ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
          -- Use the fact that the expression is non-positive in the interval
          nlinarith [Real.sq_sqrt (show 0 ≤ 2 by norm_num),
            Real.sqrt_nonneg 2,
            mul_pos h₃₁₅ (pow_pos h₃₁₅ 2),
            mul_pos h₃₁₅ (pow_pos h₃₁₅ 3),
            mul_pos (by positivity : (0 : ℝ) < 3) (pow_pos h₃₁₅ 3),
            mul_pos (by positivity : (0 : ℝ) < 3) (pow_pos h₃₁₅ 2),
            mul_pos (by positivity : (0 : ℝ) < 2) (pow_pos h₃₁₅ 2),
            mul_pos (by positivity : (0 : ℝ) < 2) (pow_pos h₃₁₅ 3)]
        -- Use the fact that the expression is non-positive in the interval
        have h₃₁₅ : (max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0 : ℝ) = 0 := by
          rw [max_eq_right (by linarith)]
          <;> linarith
        exact h₃₁₅
      -- Use the fact that the integrand is zero in the interval
      have h₃₁₆ : (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0) = 0 := by
        have h₃₁₇ : (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0) = ∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), (0 : ℝ) := by
          apply integral_congr_ae
          filter_upwards [ae_restrict_mem measurableSet_Ioo] with x hx using h₃₁₁ x hx
        rw [h₃₁₇]
        simp [integral_zero]
      exact h₃₁₆
    have h₃₂ : (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0) = 0 := by
      -- Prove that the integrand is zero in the given interval
      have h₃₂₁ : ∀ x ∈ Set.Ioo 0 ((Real.sqrt 6) / 3), (max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0 : ℝ) = 0 := by
        intro x hx
        have h₃₂₂ : 0 < x := by
          exact hx.1
        have h₃₂₃ : x < (Real.sqrt 6) / 3 := by
          exact hx.2
        have h₃₂₄ : (2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ) ≤ 0 := by
          -- Prove that the expression is non-positive in the interval
          have h₃₂₅ : 0 < x := h₃₂₂
          have h₃₂₆ : x < (Real.sqrt 6) / 3 := h₃₂₃
          have h₃₂₇ : 0 < Real.sqrt 6 := Real.sqrt_pos.mpr (by norm_num)
          have h₃₂₈ : 0 < Real.sqrt 6 := Real.sqrt_pos.mpr (by norm_num)
          have h₃₂₉ : 0 < Real.sqrt 6 := Real.sqrt_pos.mpr (by norm_num)
          -- Use the fact that the expression is non-positive in the interval
          nlinarith [Real.sq_sqrt (show 0 ≤ 6 by norm_num),
            Real.sqrt_nonneg 6,
            mul_pos h₃₂₅ (pow_pos h₃₂₅ 2),
            mul_pos h₃₂₅ (pow_pos h₃₂₅ 3),
            mul_pos (by positivity : (0 : ℝ) < 3) (pow_pos h₃₂₅ 3),
            mul_pos (by positivity : (0 : ℝ) < 3) (pow_pos h₃₂₅ 2),
            mul_pos (by positivity : (0 : ℝ) < 2) (pow_pos h₃₂₅ 2),
            mul_pos (by positivity : (0 : ℝ) < 2) (pow_pos h₃₂₅ 3)]
        -- Use the fact that the expression is non-positive in the interval
        have h₃₂₅ : (max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0 : ℝ) = 0 := by
          rw [max_eq_right (by linarith)]
          <;> linarith
        exact h₃₂₅
      -- Use the fact that the integrand is zero in the interval
      have h₃₂₆ : (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0) = 0 := by
        have h₃₂₇ : (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0) = ∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), (0 : ℝ) := by
          apply integral_congr_ae
          filter_upwards [ae_restrict_mem measurableSet_Ioo] with x hx using h₃₂₁ x hx
        rw [h₃₂₇]
        simp [integral_zero]
      exact h₃₂₆
    -- Combine the results to prove the main statement
    rw [h₃₁, h₃₂]
    <;> norm_num
  
  exact ⟨h₁, h₂, h₃⟩