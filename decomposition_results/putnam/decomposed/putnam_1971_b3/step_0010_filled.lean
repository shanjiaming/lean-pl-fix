theorem h₆ (T : ℝ) (hT : 0 < T) (h : ¬False) (h₁ h₂ : T > 0) (h₄ : 2 * T ≥ T) (h₅ : ⌊2 * T⌋₊ = 2 * ⌊T⌋₊) : ⌊2 * T - T⌋₊ = ⌊T⌋₊ :=
  by
  have h₆₁ : (2 * T : ℝ) - T = T := by sorry
  --  rw [h₆₁]
  ring