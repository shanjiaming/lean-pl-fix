theorem h₁₁ (p m : ℕ) (h₀ : isSolution p m) (h₁ : ∀ q < p, ¬∃ n, isSolution q n) (h₂ : ∀ k < m, ¬isSolution p k) (h_p_eq_17 : p = 17) (h₁₀ : m ≥ 111) : isSolution p 110 := by
  rw [h_p_eq_17] at *
  constructor
  · norm_num [Nat.Prime]
  constructor
  · norm_num
  · norm_num [Nat.pow_succ, Nat.pow_zero, Nat.mul_assoc] at * <;> decide