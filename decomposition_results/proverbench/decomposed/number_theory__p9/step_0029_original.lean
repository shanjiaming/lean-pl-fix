theorem h₆₄₆ (n : ℕ) (m : ℤ) (h : ↑m = 2 + 2 * √(28 * ↑n ^ 2 + 1)) (k : ℤ) (hk : √(28 * ↑n ^ 2 + 1) = ↑k) (h₁ : ↑k = √(28 * ↑n ^ 2 + 1)) (h₂ : ↑k ^ 2 = 28 * ↑n ^ 2 + 1) (h₃ : k ^ 2 = 28 * ↑n ^ 2 + 1) (h₄ : m = 2 + 2 * k) (h₅ : k ≥ 0) (h₆₁ : m = 2 + 2 * k) (h₆₂ : k ^ 2 = 28 * ↑n ^ 2 + 1) (h₆₃ : k ≥ 0) (h₆₄₄ : k % 2 = 0) (h₆₄₅ : k ^ 2 % 4 = 0) : (28 * ↑n ^ 2 + 1) % 4 = 1 :=
  by
  have h₆₄₇ : (n : ℤ) ^ 2 % 4 = 0 ∨ (n : ℤ) ^ 2 % 4 = 1 := by sorry
  rcases h₆₄₇ with (h₆₄₇ | h₆₄₇) <;> simp [h₆₄₇, Int.add_emod, Int.mul_emod, pow_two]