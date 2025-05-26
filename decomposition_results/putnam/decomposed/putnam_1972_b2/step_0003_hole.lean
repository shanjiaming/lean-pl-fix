theorem h₁ (s v : ℝ) (hs : s > 0) (hv : v > 0) (valid : ℝ → (ℝ → ℝ) → Prop) (hvalid :  ∀ (t : ℝ) (x : ℝ → ℝ),    valid t x ↔      DifferentiableOn ℝ x (Set.Icc 0 t) ∧        DifferentiableOn ℝ (deriv x) (Set.Icc 0 t) ∧          AntitoneOn (deriv (deriv x)) (Set.Icc 0 t) ∧ deriv x 0 = 0 ∧ deriv x t = v ∧ x t - x 0 = s) : 2 * s / v ∈ {t | ∃ x, valid t x} :=
  by
  --  use fun u => (v ^ 2 / (4 * s)) * u ^ 2
  have h₂ : valid (2 * s / v) (fun u => (v ^ 2 / (4 * s)) * u ^ 2) := by sorry
  --  exact h₂
  hole