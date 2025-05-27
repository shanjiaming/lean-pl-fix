theorem h₇ (f : ℝ → ℝ) (hf : Continuous f) (h_diff : ∀ (x : ℝ), DifferentiableAt ℝ f x) (h_deriv : ∀ (x : ℝ), deriv f x = 1 / 5 * Real.sin (5 * x)) (h₁ : deriv f 0 = 1 / 5 * Real.sin (5 * 0)) (h₂ : deriv f 0 = 0) (h₃ : deriv f (Real.pi / 10) = 1 / 5 * Real.sin (5 * (Real.pi / 10))) (h₄ : deriv f (Real.pi / 10) = 1 / 5 * Real.sin (Real.pi / 2)) (h₅ : deriv f (Real.pi / 10) = 1 / 5) : deriv (fun x => -(1 / 25) * Real.cos (5 * x)) (Real.pi / 10) = 1 / 5 * Real.sin (5 * (Real.pi / 10)) :=
  by
  have h₈ :
    deriv (fun x : ℝ => -(1 / 25 : ℝ) * Real.cos (5 * x)) (Real.pi / 10) = (1 / 5 : ℝ) * Real.sin (5 * (Real.pi / 10)) := by sorry
  --  rw [h₈]
  linarith