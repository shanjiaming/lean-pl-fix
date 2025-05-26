theorem deriv_antiderivative (x : ℝ) : deriv (fun x => -cos x ^ 9 / 9 + cos x ^ 11 / 11) x = sin x ^ 3 * cos x ^ 8 :=
  by
  have h1 : HasDerivAt (fun x : ℝ => -cos x ^ 9 / 9 + cos x ^ 11 / 11) (sin x ^ 3 * cos x ^ 8) x := by sorry
  have h2 : deriv (fun x : ℝ => -cos x ^ 9 / 9 + cos x ^ 11 / 11) x = sin x ^ 3 * cos x ^ 8 := by sorry
  --  rw [h2] <;> (try ring_nf) <;> (try field_simp) <;>
        (try linarith [sin_le_one x, cos_le_one x, neg_one_le_sin x, neg_one_le_cos x]) <;>
      (try ring_nf) <;>
    (try nlinarith [sin_le_one x, cos_le_one x, neg_one_le_sin x, neg_one_le_cos x, sin_sq_add_cos_sq x])
  hole