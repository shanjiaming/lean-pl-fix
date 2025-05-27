theorem h₈₀ (n p : ℕ) (hp : Nat.Prime p) (hdiv : p ∣ polynomial n) (h₁ : p ≠ 3) (h₂ : ¬p ∣ n) (h₃ : ∃ d, 0 < d ∧ ↑n ^ d ≡ 1 [ZMOD ↑p]) (h₄ : ↑n ^ 12 ≡ -1 [ZMOD ↑p]) (h₅ : ↑n ^ 24 ≡ 1 [ZMOD ↑p]) (h₆₁ : ↑n ^ 12 ≡ -1 [ZMOD ↑p]) (h₆₂ : ↑n ^ 24 ≡ 1 [ZMOD ↑p]) (h₆₃ : p ≠ 0) (h₆₄ : ↑n ^ 12 ≡ -1 [ZMOD ↑p]) (h₆₅ : ↑n ^ 24 ≡ 1 [ZMOD ↑p]) (h₆₆ : p ∣ n ^ 8 - n ^ 4 + 1) (h₆₇ : ¬p ∣ n) (h₆₈ : p ≠ 3) (this : Fact (Nat.Prime p)) (h₇₀ : p ∣ n ^ 8 - n ^ 4 + 1) (h₇₁ : ¬p ∣ n) (h₇₂ : p ≠ 3) (h₇₃ : ↑n ≠ 0) (h₇₄ : ↑n ^ 12 = -1) (h₇₅ : ↑n ^ 24 = 1) (h₇₇ : p % 3 ≠ 0) (h₇₈ : p % 8 ≠ 0) : p % 24 = 1 := by
  have h₈₁ := h₆₅
  have h₈₂ := h₆₄
  have h₈₃ : p ≠ 3 := h₁
  have h₈₄ : ¬(p : ℕ) ∣ n := h₆₇
  have h₈₅ : (n : ZMod p) ≠ 0 := by sorry
  have h₈₅₁ : (n : ZMod p) ^ 12 = -1 := h₇₄
  have h₈₅₂ : (n : ZMod p) ^ 24 = 1 := h₇₅
  have h₈₅₃ : p % 3 ≠ 0 := h₇₇
  have h₈₅₄ : p % 8 ≠ 0 := h₇₈
  have h₈₅₅ : p % 24 = 1 := by sorry
  exact h₈₅₈