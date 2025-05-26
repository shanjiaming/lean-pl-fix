theorem h₇ (f : ℝ → ℝ) (hf : Continuous f) (h_diff : ∀ (x : ℝ), DifferentiableAt ℝ f x) (h_deriv : ∀ (x : ℝ), deriv f x = 1 / 5 * sin (5 * x)) (h₁ : deriv f 0 = 1 / 5 * sin (5 * 0)) (h₂ : deriv f 0 = 0) (h₃ : deriv f (π / 10) = 1 / 5 * sin (5 * (π / 10))) (h₄ : deriv f (π / 10) = 1 / 5 * sin (π / 2)) (h₅ : deriv f (π / 10) = 1 / 5) : deriv (fun x => -(1 / 25) * cos (5 * x)) (π / 10) = 1 / 5 * sin (5 * (π / 10)) :=
  by
  have h₈ :
    deriv (fun x : ℝ => -(1 / 25 : ℝ) * Real.cos (5 * x)) (Real.pi / 10) = (1 / 5 : ℝ) * Real.sin (5 * (Real.pi / 10)) := by sorry
  --  rw [h₈]
  linarith