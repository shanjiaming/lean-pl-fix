theorem cosX3_derivative : deriv (fun x => Real.cos (x ^ 3)) x = -Real.sin (x ^ 3) * (3 * x ^ 2):=
  by
  have h1 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x:=
    by
    have h1 : HasDerivAt (fun x : ℝ => x ^ 3) (3 * x ^ 2) x:= by -- simpa using (hasDerivAt_pow 3 x)
      hole
    have h2 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x:=
      by
      have h3 : HasDerivAt (fun x : ℝ => x ^ 3) (3 * x ^ 2) x := h1
      have h4 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x:=
        by
        have h5 : HasDerivAt (fun x : ℝ => x ^ 3) (3 * x ^ 2) x := h3
        have h6 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x:=
          by
          have h7 : HasDerivAt (fun x : ℝ => x ^ 3) (3 * x ^ 2) x := h5
          have h8 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x:= by
            --  convert HasDerivAt.cos (h7) using 1 <;> ring
            hole
          --  exact h8
          norm_cast
        --  exact h6
        norm_cast
      --  exact h4
      norm_cast
    --  exact h2
    norm_cast
  have h2 : deriv (fun x : ℝ => Real.cos (x ^ 3)) x = -Real.sin (x ^ 3) * (3 * x ^ 2):=
    by
    --  apply HasDerivAt.deriv
    --  exact h1
    norm_num
  --  apply h2
  norm_num