theorem partial_g_x (x y : ℝ) : deriv (fun x => g x y) x = (4 * x - 2 * y) * exp (-y):=
  by
  have h1 : g = fun x y => (x ^ 2 + (y - x) ^ 2) * exp (-y):=
    by
    funext x y
    calc
      g x y = f x (y - x) := rfl
      _ = (x ^ 2 + (y - x) ^ 2) * exp (-(x + (y - x))) := by
        simp [f, add_assoc] <;> ring_nf <;> simp [exp_neg, add_assoc] <;> field_simp [exp_ne_zero] <;> ring_nf
      _ = (x ^ 2 + (y - x) ^ 2) * exp (-y) := by
        congr 1 <;> ring_nf <;> simp [exp_neg, add_assoc] <;> field_simp [exp_ne_zero] <;> ring_nf
    hole
  have h2 : deriv (fun x => g x y) x = (4 * x - 2 * y) * exp (-y):=
    by
    have h3 : deriv (fun x => g x y) x = deriv (fun x => (x ^ 2 + (y - x) ^ 2) * exp (-y)) x:=
      by
      congr
      ext x
      rw [h1] <;> simp [g] <;> ring_nf
      hole
    rw [h3]
    have h4 : deriv (fun x => (x ^ 2 + (y - x) ^ 2) * exp (-y)) x = (4 * x - 2 * y) * exp (-y):=
      by
      have h5 : HasDerivAt (fun x => (x ^ 2 + (y - x) ^ 2) * exp (-y)) ((4 * x - 2 * y) * exp (-y)) x:=
        by
        have h6 : HasDerivAt (fun x => x ^ 2 + (y - x) ^ 2) (4 * x - 2 * y) x:=
          by
          have h7 : HasDerivAt (fun x => x ^ 2) (2 * x) x:= by simpa using (hasDerivAt_pow 2 x)
            hole
          have h8 : HasDerivAt (fun x => (y - x) ^ 2) (2 * (y - x) * (-1 : ℝ)) x:=
            by
            have h9 : HasDerivAt (fun x => y - x) (-1 : ℝ) x:= by simpa using (hasDerivAt_const x y).sub (hasDerivAt_id x)
              hole
            have h10 : HasDerivAt (fun x => (y - x) ^ 2) (2 * (y - x) * (-1 : ℝ)) x:=
              by
              have h11 : HasDerivAt (fun x => y - x) (-1 : ℝ) x := h9
              convert HasDerivAt.pow 2 h11 using 1 <;> ring_nf <;> simp [h9.deriv] <;> ring_nf <;> linarith
              hole
            exact h10
            hole
          have h12 : HasDerivAt (fun x => x ^ 2 + (y - x) ^ 2) (2 * x + (2 * (y - x) * (-1 : ℝ))) x:=
            by
            have h13 : HasDerivAt (fun x => x ^ 2 + (y - x) ^ 2) (2 * x + (2 * (y - x) * (-1 : ℝ))) x := h7.add h8
            exact h13
            hole
          convert h12 using 1 <;> ring_nf <;> linarith
          hole
        have h14 : HasDerivAt (fun x => (x ^ 2 + (y - x) ^ 2) * exp (-y)) ((4 * x - 2 * y) * exp (-y)) x:=
          by
          have h15 : HasDerivAt (fun x => x ^ 2 + (y - x) ^ 2) (4 * x - 2 * y) x := h6
          have h16 : HasDerivAt (fun x => (x ^ 2 + (y - x) ^ 2) * exp (-y)) ((4 * x - 2 * y) * exp (-y)) x:= by
            convert h15.mul (hasDerivAt_const x (exp (-y))) using 1 <;> ring_nf <;> simp [exp_ne_zero] <;> ring
            hole
          exact h16
          hole
        exact h14
        hole
      have h17 : deriv (fun x => (x ^ 2 + (y - x) ^ 2) * exp (-y)) x = (4 * x - 2 * y) * exp (-y):=
        by
        apply HasDerivAt.deriv
        exact h5
        hole
      exact h17
      hole
    rw [h4]
    hole
  rw [h2]
  hole