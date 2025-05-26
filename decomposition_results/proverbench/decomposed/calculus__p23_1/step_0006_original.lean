theorem h₁₄ (n : ℕ) (h₁₁ : 3 ^ n > 0) (h₁₂ : 2 / 3 > 0) (h₁₃ : 1 + (2 / 3) ^ n > 0) : 3 ^ n * (1 + (2 / 3) ^ n) = 3 ^ n + 2 ^ n := by
  calc
    (3 : ℝ) ^ n * (1 + (2 / 3 : ℝ) ^ n) = (3 : ℝ) ^ n * 1 + (3 : ℝ) ^ n * ((2 / 3 : ℝ) ^ n) := by ring
    _ = (3 : ℝ) ^ n + (3 : ℝ) ^ n * ((2 / 3 : ℝ) ^ n) := by ring
    _ = (3 : ℝ) ^ n + (2 : ℝ) ^ n :=
      by
      have h₁₅ : (3 : ℝ) ^ n * ((2 / 3 : ℝ) ^ n) = (2 : ℝ) ^ n := by
        calc
          (3 : ℝ) ^ n * ((2 / 3 : ℝ) ^ n) = ((3 : ℝ) * (2 / 3 : ℝ)) ^ n := by rw [mul_pow] <;> field_simp <;> ring_nf
          _ = (2 : ℝ) ^ n := by norm_num <;> ring_nf <;> field_simp <;> ring_nf
      rw [h₁₅]
    _ = (3 : ℝ) ^ n + (2 : ℝ) ^ n := by ring