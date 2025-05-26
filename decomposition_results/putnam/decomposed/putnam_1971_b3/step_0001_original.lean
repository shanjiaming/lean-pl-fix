theorem putnam_1971_b3 (T : ℝ) (hT : 0 < T) : (MeasureTheory.volume : Set ℝ → ENNReal) {t | t ≥ T ∧ ⌊t⌋₊ = 2 * ⌊t - T⌋₊} = 1 :=
  by
  have h_main : False := by sorry
  have h_volume : MeasureTheory.volume {t : ℝ | t ≥ T ∧ Nat.floor t = 2 * (Nat.floor (t - T))} = 1 := by sorry
  exact h_volume