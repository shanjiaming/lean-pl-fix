theorem putnam_1990_b1
    (P : (ℝ → ℝ) → Prop)
    (P_def : ∀ f, P f ↔ ∀ x,
      (f x) ^ 2 = (∫ t in (0 : ℝ)..x, (f t) ^ 2 + (deriv f t) ^ 2) + 1990)
    (f : ℝ → ℝ) :
    (ContDiff ℝ 1 f ∧ P f) ↔ f ∈ (({fun x : ℝ => (Real.sqrt 1990) * Real.exp x, fun x : ℝ => -(Real.sqrt 1990) * Real.exp x}) : Set (ℝ → ℝ) ) :=
  by