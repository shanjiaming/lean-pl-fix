theorem cosine_derivative_formula (x : ℝ) :
  deriv (fun x => cos (3 * x + x ^ 2)) x = -sin (3 * x + x ^ 2) * (3 + 2 * x) := by
  have h1 : HasDerivAt (fun x : ℝ => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x := by
    have h1 : HasDerivAt (fun x : ℝ => 3 * x + x ^ 2) (3 + 2 * x) x := by
      -- Prove that the inner function `u(x) = 3 * x + x ^ 2` has the derivative `3 + 2 * x`
      have h1 : HasDerivAt (fun x : ℝ => 3 * x + x ^ 2) (3 + 2 * x) x := by
        -- Use the sum rule for derivatives
        have h2 : HasDerivAt (fun x : ℝ => 3 * x) 3 x := by
          simpa using (hasDerivAt_id x).const_mul 3
        have h3 : HasDerivAt (fun x : ℝ => x ^ 2) (2 * x) x := by
          simpa using (hasDerivAt_pow 2 x)
        have h4 : HasDerivAt (fun x : ℝ => 3 * x + x ^ 2) (3 + 2 * x) x := by
          convert h2.add h3 using 1 <;> ring
        exact h4
      exact h1
    -- Apply the chain rule to `cos(u(x))`
    have h2 : HasDerivAt (fun x : ℝ => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x := by
      have h3 : HasDerivAt (fun x : ℝ => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x := by
        -- Use the chain rule to differentiate `cos(u(x))`
        have h4 : HasDerivAt (fun x : ℝ => 3 * x + x ^ 2) (3 + 2 * x) x := h1
        have h5 : HasDerivAt (fun x : ℝ => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x := by
          -- Apply the chain rule
          have h6 : HasDerivAt (fun x : ℝ => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x := by
            convert HasDerivAt.cos h4 using 1 <;> ring_nf
          exact h6
        exact h5
      exact h3
    exact h2
  
  have h2 : deriv (fun x : ℝ => cos (3 * x + x ^ 2)) x = -sin (3 * x + x ^ 2) * (3 + 2 * x) := by
    -- Apply the fact that the derivative is the same as the given expression
    apply HasDerivAt.deriv
    exact h1
  
  apply h2