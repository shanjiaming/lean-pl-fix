theorem h₁₈₆ (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (h_sum : a ^ 2 / (1 + a ^ 2) + b ^ 2 / (1 + b ^ 2) + c ^ 2 / (1 + c ^ 2) = 1) (h₁₁ : 0 < a * b * c) (h₁₂ : 0 < a * b) (h₁₃ : 0 < a * c) (h₁₄ : 0 < b * c) (h₁₅ : 0 < √2) (h₁₆ : a ^ 2 / (1 + a ^ 2) + b ^ 2 / (1 + b ^ 2) + c ^ 2 / (1 + c ^ 2) = 1) (h₁₇ : a ^ 2 * b ^ 2 * c ^ 2 ≤ 1 / 8) (h₁₈₁ : 0 < √2) (h₁₈₂ : (a * b * c) ^ 2 ≤ 1 / 8) (h₁₈₄ : 0 < 2 * √2) (h₁₈₅ : 0 < 1 / (2 * √2)) : (a * b * c) ^ 2 ≤ (1 / (2 * √2)) ^ 2 := by
  calc
    (a * b * c) ^ 2 ≤ 1 / 8 := h₁₈₂
    _ = (1 / (2 * Real.sqrt 2)) ^ 2 := by
      field_simp [Real.sqrt_eq_iff_sq_eq, pow_two, mul_assoc] <;> ring_nf <;> field_simp <;> ring_nf <;> norm_num <;>
        linarith [Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
    _ = (1 / (2 * Real.sqrt 2)) ^ 2 := by rfl