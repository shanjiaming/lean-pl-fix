theorem h₄ (F : ℕ → ℝ → ℝ) (hF0 : ∀ (x : ℝ), F 0 x = Real.log x) (hFn : ∀ (n : ℕ), ∀ x > 0, F (n + 1) x = ∫ (t : ℝ) in Ioo 0 x, F n t) (h₂ : F 1 1 = -1) (h₃ : F 1 1 = ∫ (t : ℝ) in Ioo 0 1, F 0 t) : ∫ (t : ℝ) in Ioo 0 1, F 0 t = ∫ (t : ℝ) in Ioo 0 1, Real.log t :=
  by
  congr
  ext t
  rw [hF0 t]