theorem h3 (x : ℝ) : HasDerivAt (fun x => cos x ^ 9) (9 * cos x ^ 8 * -sin x) x :=
  by
  have h4 : HasDerivAt (fun x : ℝ => cos x) (-sin x) x := by sorry
  have h5 : HasDerivAt (fun x : ℝ => cos x ^ 9) (9 * cos x ^ 8 * -sin x) x := by sorry
  --  exact h5
  hole