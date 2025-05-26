theorem h10 (x : ℝ) (h2 : HasDerivAt (fun x => -cos x ^ 9 / 9) (cos x ^ 8 * sin x) x) (h9 : HasDerivAt (fun x => cos x) (-sin x) x) : HasDerivAt (fun x => cos x ^ 11) (11 * cos x ^ 10 * -sin x) x := by
  --  convert HasDerivAt.pow 11 h9 using 1 <;> ring_nf <;> simp [sin_sq, cos_sq] <;> ring_nf
  hole