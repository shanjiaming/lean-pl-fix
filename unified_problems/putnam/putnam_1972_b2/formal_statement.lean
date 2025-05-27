theorem putnam_1972_b2
    (s v : ℝ)
    (hs : s > 0)
    (hv : v > 0)
    (valid : ℝ → (ℝ → ℝ) → Prop)
    (hvalid : ∀ t x, valid t x ↔
      DifferentiableOn ℝ x (Set.Icc 0 t) ∧ DifferentiableOn ℝ (deriv x) (Set.Icc 0 t) ∧
      AntitoneOn (deriv (deriv x)) (Set.Icc 0 t) ∧
      deriv x 0 = 0 ∧ deriv x t = v ∧ x t - x 0 = s)
    : IsGreatest {t | ∃ x : ℝ → ℝ, valid t x} (((fun s v : ℝ ↦ 2 * s / v) : ℝ → ℝ → ℝ ) s v) :=
  by