theorem h₂ (n : Type u) (inst✝³ : Fintype n) (inst✝² : DecidableEq n) (K : Type u_1) (inst✝¹ : Field K) (P : Matrix n n K) (inst✝ : Invertible P) (h₀ : P.det * P⁻¹.det = 1) : P.det ≠ 0 := by
  intro h
  rw [h] at h₀
  norm_num at h₀ <;> simp_all [Matrix.det_nonsing_inv] <;> aesop
  hole