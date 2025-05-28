theorem putnam_1968_a1  : 22 / 7 - Real.pi = ∫ (x : ℝ) in 0 ..1, x ^ 4 * (1 - x) ^ 4 / (1 + x ^ 2) :=
  by
  have h₀ : (∫ x in (0)..1, (x ^ 4 * (1 - x) ^ 4 / (1 + x ^ 2))) = 22 / 7 - Real.pi := by sorry
  have h₁ : 22 / 7 - Real.pi = ∫ x in (0)..1, x ^ 4 * (1 - x) ^ 4 / (1 + x ^ 2) := by sorry
  rw [h₁] <;> simp [mul_comm] <;> ring_nf <;> norm_num <;> linarith [Real.pi_pos]