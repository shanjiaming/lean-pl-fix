theorem putnam_2016_a3
(f : ℝ → ℝ)
(hf : ∀ x : ℝ, x ≠ 0 → f x + f (1 - 1 / x) = arctan x)
: (∫ x in (0)..1, f x = ((3 * Real.pi / 8) : ℝ )) := by