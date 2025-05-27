theorem putnam_1980_b5
    (T : Set ℝ)
    (hT : T = Icc 0 1)
    (P : ℝ → (ℝ → ℝ) → Prop)
    (IsConvex : (ℝ → ℝ) → Prop)
    (S : ℝ → Set (ℝ → ℝ))
    (P_def : ∀ t f, P t f ↔ f 1 - 2*f (2/3) + f (1/3) ≥ t*(f (2/3) - 2*f (1/3) + f 0))
    (IsConvex_def : ∀ f, IsConvex f ↔ ∀ u ∈ T, ∀ v ∈ T, ∀ s ∈ T, f (s*u + (1 - s)*v) ≤ s*(f u) + (1 - s)*(f v))
    (hS : S = fun t : ℝ => {f : ℝ → ℝ | (∀ x ∈ T, f x ≥ 0) ∧ StrictMonoOn f T ∧ IsConvex f ∧ ContinuousOn f T ∧ P t f})
    (t : ℝ) (ht : t ≥ 0) :
    ((fun t : ℝ => 1 ≥ t) : ℝ → Prop ) t ↔ (∀ f ∈ S t, ∀ g ∈ S t, f * g ∈ S t) :=
  by