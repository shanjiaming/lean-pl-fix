theorem h_eq (h_pi_div_two_mem :  π / 2 ∈    {r |      r > 0 ∧        ∃ f g,          Differentiable ℝ f ∧            Differentiable ℝ g ∧ (∀ (x : ℝ), |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0}) (h_le_pi_div_two :  sInf      {r |        r > 0 ∧          ∃ f g,            Differentiable ℝ f ∧              Differentiable ℝ g ∧                (∀ (x : ℝ), |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} ≤    π / 2) (h_ge_pi_div_two :  sInf      {r |        r > 0 ∧          ∃ f g,            Differentiable ℝ f ∧              Differentiable ℝ g ∧                (∀ (x : ℝ), |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} ≥    π / 2) : sInf
      {r |
        r > 0 ∧
          ∃ f g,
            Differentiable ℝ f ∧
              Differentiable ℝ g ∧
                (∀ (x : ℝ), |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} =
    π / 2 :=
  by
  apply le_antisymm
  · exact h_le_pi_div_two
  · exact h_ge_pi_div_two