theorem h2 (x : ℝ) (h1 : HasDerivAt (fun x => -cos x ^ 9 / 9 + cos x ^ 11 / 11) (sin x ^ 3 * cos x ^ 8) x) : deriv (fun x => -cos x ^ 9 / 9 + cos x ^ 11 / 11) x = sin x ^ 3 * cos x ^ 8 :=
  by
  apply HasDerivAt.deriv
  exact h1