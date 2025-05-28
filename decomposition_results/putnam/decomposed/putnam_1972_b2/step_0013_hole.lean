theorem h₈ (s v : ℝ) (hs : s > 0) (hv : v > 0) (valid : ℝ → (ℝ → ℝ) → Prop) (hvalid :  ∀ (t : ℝ) (x : ℝ → ℝ),    valid t x ↔      DifferentiableOn ℝ x (Icc 0 t) ∧        DifferentiableOn ℝ (deriv x) (Icc 0 t) ∧          AntitoneOn (deriv (deriv x)) (Icc 0 t) ∧ deriv x 0 = 0 ∧ deriv x t = v ∧ x t - x 0 = s) : (fun u => v ^ 2 / (4 * s) * u ^ 2) (2 * s / v) - (fun u => v ^ 2 / (4 * s) * u ^ 2) 0 = s :=
  by
  have h₉ : (v ^ 2 / (4 * s)) * (2 * s / v) ^ 2 - (v ^ 2 / (4 * s)) * 0 ^ 2 = s := by sorry
  --  simpa using h₉
  hole