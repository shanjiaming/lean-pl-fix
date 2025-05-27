theorem h₁  : (√5 * √13) ^ 2 = 65 :=
  by
  have h₁₁ : 0 ≤ sqrt 5 := by sorry
  have h₁₂ : 0 ≤ sqrt 13 := by sorry
  have h₁₃ : 0 ≤ sqrt 5 * sqrt 13 := by sorry
  --  calc
  --    (sqrt 5 * sqrt 13) ^ 2 = (sqrt 5) ^ 2 * (sqrt 13) ^ 2 := by
  --      ring_nf <;> simp [mul_pow, pow_mul] <;> ring_nf <;> norm_num
  --    _ = 5 * 13 := by rw [Real.sq_sqrt (show 0 ≤ 5 by norm_num), Real.sq_sqrt (show 0 ≤ 13 by norm_num)]
  --    _ = 65 := by norm_num
  hole