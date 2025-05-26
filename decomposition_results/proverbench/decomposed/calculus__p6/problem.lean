theorem cosX3_derivative : deriv (fun x => Real.cos (x^3)) x = -Real.sin (x^3) * (3 * x^2) := by
  have h1 : HasDerivAt (fun x : ℝ => Real.cos (x^3)) (-Real.sin (x^3) * (3 * x^2)) x := by
    have h1 : HasDerivAt (fun x : ℝ => x ^ 3) (3 * x ^ 2) x := by
      simpa using (hasDerivAt_pow 3 x)
    have h2 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x := by
      have h3 : HasDerivAt (fun x : ℝ => x ^ 3) (3 * x ^ 2) x := h1
      have h4 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x := by
        -- Apply the chain rule: derivative of cos(u) is -sin(u) * u'
        have h5 : HasDerivAt (fun x : ℝ => x ^ 3) (3 * x ^ 2) x := h3
        have h6 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x := by
          -- Use the chain rule for cosine
          have h7 : HasDerivAt (fun x : ℝ => x ^ 3) (3 * x ^ 2) x := h5
          have h8 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x := by
            -- Apply the chain rule: derivative of cos(u) is -sin(u) * u'
            convert HasDerivAt.cos (h7) using 1 <;> ring
          exact h8
        exact h6
      exact h4
    exact h2
  
  have h2 : deriv (fun x : ℝ => Real.cos (x^3)) x = -Real.sin (x^3) * (3 * x^2) := by
    apply HasDerivAt.deriv
    exact h1
  
  apply h2