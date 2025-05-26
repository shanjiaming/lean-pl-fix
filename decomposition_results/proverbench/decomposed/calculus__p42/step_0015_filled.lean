theorem h13 (x : ℝ) (h2 : HasDerivAt (fun x => -cos x ^ 9 / 9) (cos x ^ 8 * sin x) x) (h7 : HasDerivAt (fun x => cos x ^ 11 / 11) (-cos x ^ 10 * sin x) x) : HasDerivAt (fun x => -cos x ^ 9 / 9 + cos x ^ 11 / 11) (cos x ^ 8 * sin x + -cos x ^ 10 * sin x) x := by
  --  convert h2.add h7 using 1 <;> ring_nf at * <;>
    linarith [sin_le_one x, cos_le_one x, neg_one_le_sin x, neg_one_le_cos x]
  hole