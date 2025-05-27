theorem derivative_of_exponential_function :
  deriv (fun x => exp (-x^2 / 2)) = fun x => -x * exp (-x^2 / 2) := by
  have h₀ : deriv (fun x => exp (-x^2 / 2)) = fun x => -x * exp (-x^2 / 2) := by
    funext x
    rw [show (deriv (fun x => exp (-x ^ 2 / 2)) x) = -x * exp (-x ^ 2 / 2) by
      -- Use the chain rule to compute the derivative of the composition of functions.
      have h₁ : HasDerivAt (fun x : ℝ => exp (-x ^ 2 / 2)) (-x * exp (-x ^ 2 / 2)) x := by
        -- Compute the derivative of the inner function (-x^2 / 2).
        have h₂ : HasDerivAt (fun x : ℝ => -x ^ 2 / 2 : ℝ → ℝ) (-x) x := by
          -- Use the power rule and constant multiple rule.
          have h₃ : HasDerivAt (fun x : ℝ => (x : ℝ) ^ 2) (2 * x) x := by
            simpa using (hasDerivAt_pow 2 x)
          have h₄ : HasDerivAt (fun x : ℝ => - (x : ℝ) ^ 2) (- (2 * x)) x := by
            convert h₃.neg using 1 <;> ring
          have h₅ : HasDerivAt (fun x : ℝ => (- (x : ℝ) ^ 2) / 2) (- (2 * x) / 2) x := by
            convert (h₄.div_const 2) using 1 <;> ring
          convert h₅ using 1 <;> ring
          <;> field_simp
          <;> ring
        -- Apply the chain rule.
        have h₆ : HasDerivAt (fun x : ℝ => exp (-x ^ 2 / 2)) (exp (-x ^ 2 / 2) * (-x)) x := by
          have h₇ : HasDerivAt (fun x : ℝ => (-x ^ 2 / 2 : ℝ)) (-x) x := h₂
          have h₈ : HasDerivAt (fun x : ℝ => exp (-x ^ 2 / 2)) (exp (-x ^ 2 / 2) * (-x)) x := by
            apply HasDerivAt.exp
            exact h₇
          exact h₈
        convert h₆ using 1 <;> ring
      -- Convert the HasDerivAt statement to the desired form.
      have h₂ : deriv (fun x : ℝ => exp (-x ^ 2 / 2)) x = -x * exp (-x ^ 2 / 2) := by
        convert HasDerivAt.deriv h₁ using 1 <;> ring
      exact h₂
    ]
  exact h₀