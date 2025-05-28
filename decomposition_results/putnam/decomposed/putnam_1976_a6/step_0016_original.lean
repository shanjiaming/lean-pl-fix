theorem h21 (f : ℝ → ℝ) (hfdiff : ContDiff ℝ 2 f) (hfbd : ∀ (x : ℝ), |f x| ≤ 1) (hf0 : f 0 ^ 2 + deriv f 0 ^ 2 = 4) (h2 : ContDiff ℝ 1 f) (h3 : Differentiable ℝ f) (h4 : Differentiable ℝ (deriv f)) (h7 : ∀ (x : ℝ), deriv (deriv f) x = iteratedDeriv 2 f x) (h : ℝ → ℝ := fun x => f x ^ 2 + deriv f x ^ 2) (h8 : Continuous h) (h15 : h 0 = 4) (h19 : ContinuousAt h 0) (h20 : h 0 = 4) : ∀ ε > 0, ∃ δ > 0, ∀ (x : ℝ), |x - 0| < δ → |h x - h 0| < ε :=
  by
  intro ε hε
  have h22 : Filter.Tendsto h (𝓝 0) (𝓝 (h 0)) := h19
  have h23 : Filter.Tendsto h (𝓝 0) (𝓝 4) := by sorry
  have h24 : ∀ᶠ (x : ℝ) in 𝓝 0, |h x - h 0| < ε := by sorry
  exact h24 <;> simp_all [abs_sub_comm] <;> linarith