theorem h29 (f : ℝ → ℝ) (hfdiff : ContDiff ℝ 2 f) (hfbd : ∀ (x : ℝ), |f x| ≤ 1) (hf0 : f 0 ^ 2 + deriv f 0 ^ 2 = 4) (h2 : ContDiff ℝ 1 f) (h3 : Differentiable ℝ f) (h4 : Differentiable ℝ (deriv f)) (h7 : ∀ (x : ℝ), deriv (deriv f) x = iteratedDeriv 2 f x) (h : ℝ → ℝ := fun x => f x ^ 2 + deriv f x ^ 2) (h8 : Continuous h) (h15 : h 0 = 4) (h19 : ContinuousAt h 0) (h20 : h 0 = 4) (h21 : ∀ ε > 0, ∃ δ > 0, ∀ (x : ℝ), |x - 0| < δ → |h x - h 0| < ε) (δ : ℝ) (hδ : δ > 0) (h28 : ∀ (x : ℝ), |x - 0| < δ → |h x - h 0| < 2) (x : ℝ) (hx : x ∈ Set.Icc (-δ) δ) : x ∈ Set.Icc (-δ) δ := by
  constructor <;> cases' hx with hx₁ hx₂ <;> (try cases' le_total 0 x with hx₃ hx₃) <;>
                (try cases' le_total 0 (x - 0) with hx₄ hx₄) <;>
              (try cases' le_total 0 (x + δ) with hx₅ hx₅) <;>
            (try cases' le_total 0 (δ - x) with hx₆ hx₆) <;>
          simp_all [abs_of_nonneg, abs_of_nonpos, Set.mem_Icc, le_of_lt] <;>
        (try nlinarith) <;>
      (try linarith) <;>
    (try nlinarith)