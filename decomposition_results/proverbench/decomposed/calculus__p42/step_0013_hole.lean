theorem h11 (x : ℝ) (h2 : HasDerivAt (fun x => -cos x ^ 9 / 9) (cos x ^ 8 * sin x) x) (h8 : HasDerivAt (fun x => cos x ^ 11) (11 * cos x ^ 10 * -sin x) x) : HasDerivAt (fun x => cos x ^ 11 / 11) (-cos x ^ 10 * sin x) x := by
  --  --  convert HasDerivAt.div_const h8 11 using 1 <;> ring_nf at * <;> field_simp at * <;> ring_nf at * <;>
    linarith [sin_le_one x, cos_le_one x, neg_one_le_sin x, neg_one_le_cos x]
  hole