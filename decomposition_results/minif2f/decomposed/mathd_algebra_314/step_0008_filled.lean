theorem h₃ (n : ℕ) (h₀ : n = 11) (h₁ : 1 / 4 = 0) (h₂ : (1 / 4) ^ (n + 1) = 0) : (1 / 4) ^ (n + 1) * 2 ^ (2 * n) = 0 := by
  --  --  rw [h₂] <;> simp [Nat.mul_zero] <;> norm_num <;> simp_all <;> ring_nf <;> norm_num <;> simp_all
  norm_num