theorem h₄ (x : ℝ) (h₃ : HasDerivAt (fun x => x + 1) 1 x) : HasDerivAt (fun x => √(5 * x ^ 2 + 35)) (5 * x / √(5 * x ^ 2 + 35)) x :=
  by
  have h₅ : HasDerivAt (fun x : ℝ => (5 * x ^ 2 + 35 : ℝ)) (10 * x) x := by sorry
  have h₆ : HasDerivAt (fun x : ℝ => Real.sqrt (5 * x ^ 2 + 35)) ((10 * x) / (2 * Real.sqrt (5 * x ^ 2 + 35))) x := by sorry
  convert h₆ using 1 <;> field_simp [Real.sqrt_eq_iff_sq_eq, mul_comm] <;> ring_nf <;>
      field_simp [Real.sqrt_eq_iff_sq_eq, mul_comm] <;>
    nlinarith [Real.sqrt_nonneg (5 * x ^ 2 + 35), Real.sq_sqrt (show 0 ≤ 5 * x ^ 2 + 35 by nlinarith)]