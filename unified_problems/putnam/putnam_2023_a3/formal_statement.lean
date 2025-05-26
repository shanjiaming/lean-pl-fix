theorem putnam_2023_a3
: sInf {r > 0 | ∃ f g : ℝ → ℝ,
    Differentiable ℝ f ∧ Differentiable ℝ g ∧
    (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧
    f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} = ((Real.pi / 2) : ℝ ) := by