theorem h7 (x : ℝ) (h2 : HasDerivAt (fun x => -cos x ^ 9 / 9) (cos x ^ 8 * sin x) x) : HasDerivAt (fun x => cos x ^ 11 / 11) (-cos x ^ 10 * sin x) x :=
  by
  have h8 : HasDerivAt (fun x : ℝ => cos x ^ 11) (11 * cos x ^ 10 * -sin x) x := by sorry
  have h11 : HasDerivAt (fun x : ℝ => cos x ^ 11 / 11) (-cos x ^ 10 * sin x) x := by sorry
  --  exact h11
  norm_cast