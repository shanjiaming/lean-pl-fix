theorem h_le_pi_div_two (h_pi_div_two_mem :  π / 2 ∈    {r |      r > 0 ∧        ∃ f g,          Differentiable ℝ f ∧            Differentiable ℝ g ∧ (∀ (x : ℝ), |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0}) : sInf
      {r |
        r > 0 ∧
          ∃ f g,
            Differentiable ℝ f ∧
              Differentiable ℝ g ∧
                (∀ (x : ℝ), |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} ≤
    π / 2 :=
  by
  have h₁ :
    Real.pi / 2 ∈
      {r > 0 |
        ∃ f g : ℝ → ℝ,
          Differentiable ℝ f ∧
            Differentiable ℝ g ∧ (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} :=
    h_pi_div_two_mem
  have h₂ :
    sInf
        ({r > 0 |
          ∃ f g : ℝ → ℝ,
            Differentiable ℝ f ∧
              Differentiable ℝ g ∧ (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0}) ≤
      Real.pi / 2 := by sorry
  exact h₂