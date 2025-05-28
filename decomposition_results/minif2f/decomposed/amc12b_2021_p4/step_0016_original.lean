theorem h₅₄ (m a : ℕ) (h₀ : 0 < m ∧ 0 < a) (h₁ : ↑m / ↑a = 3 / 4) (h₂ : 4 * ↑m = 3 * ↑a) (h₃ : 4 * m = 3 * a) (h₄ : 84 * ↑m + 70 * ↑a = 76 * (↑m + ↑a)) (h₅₁ : ↑m + ↑a ≠ 0) (h₅₃ : 84 * ↑m + 70 * ↑a = 76 * (↑m + ↑a)) : (84 * ↑m + 70 * ↑a) / (↑m + ↑a) = 76 :=
  by
  rw [show (84 * ↑m + 70 * ↑a : ℝ) = (76 : ℝ) * ((↑m + ↑a : ℝ)) by linarith]
  field_simp [h₅₁] <;> ring_nf <;> field_simp [h₅₁] <;> linarith