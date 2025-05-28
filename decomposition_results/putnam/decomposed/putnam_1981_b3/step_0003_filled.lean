theorem h₁ (P : ℕ → Prop) (hP : ∀ (n : ℕ), P n ↔ ∀ (p : ℕ), Nat.Prime p ∧ p ∣ n ^ 2 + 3 → ∃ k, ↑p ∣ ↑k ^ 2 + 3 ∧ k ^ 2 < n) (n : ℕ) : ∃ m, ↑m > ↑n ∧ P m := by
  --  use 3 * (n + 1)
  --  constructor
  --  --  · norm_num [mul_add, mul_one, add_assoc] <;> nlinarith
  --  · rw [hP]
  --    intro p hp
    have h₂ : p ∣ (3 * (n + 1)) ^ 2 + 3 := by sorry
    have h₃ : Nat.Prime p := hp.1
    have h₄ : p = 2 ∨ p = 3 ∨ p ≥ 5 := by sorry
  --    rcases h₄ with (rfl | rfl | h₄)
  --    · use 1
  --      constructor
  --      · norm_num
      ·
        have h₅ : 1 ^ 2 < 3 * (n + 1) := by sorry
  --        exact h₅
  --    · use 0
  --      constructor
  --      · norm_num
      ·
        have h₅ : 0 ^ 2 < 3 * (n + 1) := by sorry
  --        exact h₅
    ·
      have h₅ : p ≥ 5 := h₄
      have h₆ : p ∣ (3 * (n + 1)) ^ 2 + 3 := h₂
      have h₇ : ∃ k : ℕ, (p : ℤ) ∣ (k : ℤ) ^ 2 + 3 ∧ k ^ 2 < 3 * (n + 1) := by sorry
  --      obtain ⟨k, h₈, h₉⟩ := h₇
  --      exact ⟨k, h₈, by nlinarith⟩
  hole