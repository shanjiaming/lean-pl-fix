theorem h_volume (T : ℝ) (hT : 0 < T) (h_main : False) : (MeasureTheory.volume : Set ℝ → ENNReal) {t | t ≥ T ∧ ⌊t⌋₊ = 2 * ⌊t - T⌋₊} = 1 :=
  by
  exfalso
  exact h_main