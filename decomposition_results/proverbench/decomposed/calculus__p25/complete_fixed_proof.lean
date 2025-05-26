theorem cosine_derivative_formula (x : ℝ) : deriv (fun x => cos (3 * x + x ^ 2)) x = -sin (3 * x + x ^ 2) * (3 + 2 * x):=
  by
  have h1 : HasDerivAt (fun x : ℝ => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x:=
    by
    have h1 : HasDerivAt (fun x : ℝ => 3 * x + x ^ 2) (3 + 2 * x) x:= by -- sorry
      hole
    have h2 : HasDerivAt (fun x : ℝ => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x:=
      by
      have h3 : HasDerivAt (fun x : ℝ => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x:=
        by
        have h4 : HasDerivAt (fun x : ℝ => 3 * x + x ^ 2) (3 + 2 * x) x := h1
        have h5 : HasDerivAt (fun x : ℝ => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x:=
          by
          have h6 : HasDerivAt (fun x : ℝ => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x:= by
            --  convert HasDerivAt.cos h4 using 1 <;> ring_nf
            hole
          --  exact h6
          hole
        --  exact h5
        hole
      --  exact h3
      hole
    --  exact h2
    hole
  have h2 : deriv (fun x : ℝ => cos (3 * x + x ^ 2)) x = -sin (3 * x + x ^ 2) * (3 + 2 * x):=
    by
    --  apply HasDerivAt.deriv
    --  exact h1
    hole
  --  apply h2
  linarith