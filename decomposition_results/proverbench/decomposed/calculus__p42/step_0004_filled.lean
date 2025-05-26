theorem h2 (x : ℝ) : HasDerivAt (fun x => -cos x ^ 9 / 9) (cos x ^ 8 * sin x) x :=
  by
  have h3 : HasDerivAt (fun x : ℝ => cos x ^ 9) (9 * cos x ^ 8 * -sin x) x := by sorry
  have h6 : HasDerivAt (fun x : ℝ => -cos x ^ 9 / 9) (cos x ^ 8 * sin x) x := by sorry
  --  exact h6
  simpa