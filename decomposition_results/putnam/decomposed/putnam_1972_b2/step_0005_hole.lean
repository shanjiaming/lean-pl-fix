theorem h₃ (s v : ℝ) (hs : s > 0) (hv : v > 0) (valid : ℝ → (ℝ → ℝ) → Prop) (hvalid :  ∀ (t : ℝ) (x : ℝ → ℝ),    valid t x ↔      DifferentiableOn ℝ x (Icc 0 t) ∧        DifferentiableOn ℝ (deriv x) (Icc 0 t) ∧          AntitoneOn (deriv (deriv x)) (Icc 0 t) ∧ deriv x 0 = 0 ∧ deriv x t = v ∧ x t - x 0 = s) : (deriv fun u => v ^ 2 / (4 * s) * u ^ 2) = fun u => v ^ 2 / (4 * s) * (2 * u) :=
  by
  --  funext u
  --  --  --  ring_nf <;> field_simp [mul_comm] <;> ring_nf <;> norm_num <;> linarith
  hole