theorem h₂₅ (h₁ : ∫ (x : ℝ) in Set.Icc 2 8, 1 / x + x ^ 2 = (∫ (x : ℝ) in Set.Icc 2 8, 1 / x) + ∫ (x : ℝ) in Set.Icc 2 8, x ^ 2) (h₂₂ : Real.log 8 - Real.log 2 = Real.log (8 / 2)) (h₂₄ : ∫ (x : ℝ) in Set.Icc 2 8, 1 / x = ∫ (x : ℝ) in 2 ..8, 1 / x) : ∫ (x : ℝ) in 2 ..8, 1 / x = Real.log (8 / 2) :=
  by
  rw [← Real.log_div (by norm_num) (by norm_num)]
  have h₂₆ : ∫ x in (2 : ℝ)..(8 : ℝ), (1 / x : ℝ) = Real.log 8 - Real.log 2 :=
    by
    have h₂₇ : ∫ x in (2 : ℝ)..(8 : ℝ), (1 / x : ℝ) = Real.log 8 - Real.log 2 := by
      norm_num [integral_one_div, Real.log_pow, Real.log_mul, Real.log_pow] <;> ring_nf <;> norm_num <;>
        linarith [Real.log_pos (by norm_num : (1 : ℝ) < 2), Real.log_pos (by norm_num : (1 : ℝ) < 8)]
    exact h₂₇
  rw [h₂₆] <;> ring_nf <;> norm_num <;>
    linarith [Real.log_pos (by norm_num : (1 : ℝ) < 2), Real.log_pos (by norm_num : (1 : ℝ) < 8)]