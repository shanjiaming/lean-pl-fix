theorem h1 (x : ℝ) : HasDerivAt (fun x => -cos x ^ 9 / 9 + cos x ^ 11 / 11) (sin x ^ 3 * cos x ^ 8) x :=
  by
  have h2 : HasDerivAt (fun x : ℝ => -cos x ^ 9 / 9) (cos x ^ 8 * sin x) x := by sorry
  have h7 : HasDerivAt (fun x : ℝ => cos x ^ 11 / 11) (-cos x ^ 10 * sin x) x := by sorry
  have h12 : HasDerivAt (fun x : ℝ => -cos x ^ 9 / 9 + cos x ^ 11 / 11) (sin x ^ 3 * cos x ^ 8) x := by sorry
  exact h12