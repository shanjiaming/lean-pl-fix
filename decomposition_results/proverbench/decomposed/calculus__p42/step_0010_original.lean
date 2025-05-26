theorem h8 (x : ℝ) (h2 : HasDerivAt (fun x => -cos x ^ 9 / 9) (cos x ^ 8 * sin x) x) : HasDerivAt (fun x => cos x ^ 11) (11 * cos x ^ 10 * -sin x) x :=
  by
  have h9 : HasDerivAt (fun x : ℝ => cos x) (-sin x) x := by sorry
  have h10 : HasDerivAt (fun x : ℝ => cos x ^ 11) (11 * cos x ^ 10 * -sin x) x := by sorry
  exact h10