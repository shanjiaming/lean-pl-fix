theorem h_main (f : ℝ → ℝ) (hf : Continuous f) (h_diff : ∀ (x : ℝ), DifferentiableAt ℝ f x) (h_deriv : ∀ (x : ℝ), deriv f x = 1 / 5 * sin (5 * x)) (h_flase_derivative : False) : ∃ C, ∀ (x : ℝ), f x = 1 / 5 * sin (5 * x) + C :=
  by
  --  exfalso
  --  exact h_flase_derivative
  hole