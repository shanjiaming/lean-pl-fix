theorem putnam_1993_b3 :
  let (r, s) := ((5 / 4, -1 / 4) : ℚ × ℚ );
  (MeasureTheory.volume
    {p : Fin 2 → ℝ | 0 < p ∧ p < 1 ∧ Even (round (p 0 / p 1))}
  ).toReal
  = r + s * Real.pi := by