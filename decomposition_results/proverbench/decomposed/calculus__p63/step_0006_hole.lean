theorem h₄ (f : ℝ → ℝ) (hf : Continuous f) (h_diff : ∀ (x : ℝ), DifferentiableAt ℝ f x) (h_deriv : ∀ (x : ℝ), deriv f x = 1 / 5 * sin (5 * x)) (h₁ : deriv f 0 = 1 / 5 * sin (5 * 0)) (h₂ : deriv f 0 = 0) (h₃ : deriv f (π / 10) = 1 / 5 * sin (5 * (π / 10))) : deriv f (π / 10) = 1 / 5 * sin (π / 2) := by
  --  --  rw [h₃] <;> ring_nf <;> field_simp <;> ring_nf
  hole