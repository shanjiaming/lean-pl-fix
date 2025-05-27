theorem h₈ (f : ℝ → ℝ) (hf : Continuous f) (h_diff : ∀ (x : ℝ), DifferentiableAt ℝ f x) (h_deriv : ∀ (x : ℝ), deriv f x = 1 / 5 * Real.sin (5 * x)) (h₁ : deriv f 0 = 1 / 5 * Real.sin (5 * 0)) (h₂ : deriv f 0 = 0) (h₃ : deriv f (Real.pi / 10) = 1 / 5 * Real.sin (5 * (Real.pi / 10))) (h₄ : deriv f (Real.pi / 10) = 1 / 5 * Real.sin (Real.pi / 2)) (h₅ : deriv f (Real.pi / 10) = 1 / 5) : deriv (fun x => -(1 / 25) * Real.cos (5 * x)) (Real.pi / 10) = 1 / 5 * Real.sin (5 * (Real.pi / 10)) :=
  by
  norm_num [Real.cos_pi_div_two, Real.sin_pi_div_two, mul_comm] <;>
                simp_all [Real.cos_pi_div_two, Real.sin_pi_div_two, mul_comm, mul_assoc, mul_left_comm,
                  sub_eq_add_neg] <;>
              ring_nf <;>
            norm_num <;>
          field_simp <;>
        ring_nf <;>
      norm_num <;>
    linarith [Real.pi_pos]