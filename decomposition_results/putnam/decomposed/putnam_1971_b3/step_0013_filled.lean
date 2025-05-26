theorem h₆ (T : ℝ) (hT : 0 < T) (h : ¬False) (h₁ h₂ : T > 0) (t : ℝ) (ht₁ : t ≥ T) (ht₂ : ⌊t⌋₊ = 2 * ⌊t - T⌋₊) (h₄ : t ≥ T) (h₅ : ⌊t⌋₊ = 2 * ⌊t - T⌋₊) : T > 0 := by -- exact_mod_cast h₁
  linarith