theorem cos_5x_indefinite_integral {f : ℝ → ℝ}
    (hf : Continuous f)
    (h_diff : ∀ x, DifferentiableAt ℝ f x)
    (h_deriv : ∀ x, deriv f x = (1 / 5 : ℝ) * Real.sin (5 * x)) :
    ∃ C, ∀ x, f x = (1 / 5 : ℝ) * Real.sin (5 * x) + C :=