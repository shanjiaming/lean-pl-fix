theorem putnam_1964_a2
(α : ℝ)
: (((fun _ ↦ ∅) : ℝ → Set (ℝ → ℝ) ) α = {f : ℝ → ℝ | (∀ x ∈ Icc 0 1, f x > 0) ∧ ContinuousOn f (Icc 0 1) ∧ ∫ x in (0)..1, f x = 1 ∧ ∫ x in (0)..1, x * f x = α ∧ ∫ x in (0)..1, x^2 * f x = α^2}) := by