theorem h₈ (h₂ : 3 ^ 200 < 10 ^ 100 + 3) (h₄ : 10 ^ 20000 / (10 ^ 100 + 3) = (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) + 3 ^ 200 / (10 ^ 100 + 3)) (h₅ : 0 < 3 ^ 200 / (10 ^ 100 + 3)) (h₆ : 3 ^ 200 / (10 ^ 100 + 3) < 1) : (↑⌊(10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) + 3 ^ 200 / (10 ^ 100 + 3)⌋₊ : ℝ) = (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) :=
  by
  --  rw [Int.floor_eq_iff]
  constructor
  ·
    norm_num at h₅ h₆ ⊢ <;> norm_num [div_eq_mul_inv] at h₅ h₆ ⊢ <;> ring_nf at h₅ h₆ ⊢ <;> norm_num at h₅ h₆ ⊢ <;>
      linarith
  ·
    norm_num at h₅ h₆ ⊢ <;> norm_num [div_eq_mul_inv] at h₅ h₆ ⊢ <;> ring_nf at h₅ h₆ ⊢ <;> norm_num at h₅ h₆ ⊢ <;>
      linarith
  hole