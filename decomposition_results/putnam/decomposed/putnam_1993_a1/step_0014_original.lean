theorem h₃₁₇ (h₁ : 0 < 4 / 9) (h₂ : 4 / 9 < 4 * √2 / 9) (h₃₁₁ : ∀ x ∈ Set.Ioo 0 (√2 / 3), max (4 / 9 - (2 * x - 3 * x ^ 3)) 0 = 0) : ∫ (x : ℝ) in Set.Ioo 0 (√2 / 3), max (4 / 9 - (2 * x - 3 * x ^ 3)) 0 = ∫ (x : ℝ) in Set.Ioo 0 (√2 / 3), 0 :=
  by
  apply integral_congr_ae
  filter_upwards [ae_restrict_mem measurableSet_Ioo] with x hx using h₃₁₁ x hx