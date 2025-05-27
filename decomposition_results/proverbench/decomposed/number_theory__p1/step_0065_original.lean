theorem h₇₇ (n p : ℕ) (hp : Nat.Prime p) (hdiv : p ∣ polynomial n) (h₁ : p ≠ 3) (h₂ : ¬p ∣ n) (h₃ : ∃ d, 0 < d ∧ ↑n ^ d ≡ 1 [ZMOD ↑p]) (h₄ : ↑n ^ 12 ≡ -1 [ZMOD ↑p]) (h₅ : ↑n ^ 24 ≡ 1 [ZMOD ↑p]) (h₆ h₇₁ h₇₃ : p % 24 = 1) (h₇₅ : p ≥ 2) (h₇₆ : p ≥ 1) : (p - 1) / 24 * 24 + 1 = p := by
  have h₇₈ : p % 24 = 1 := h₆
  have h₇₉ : p = 24 * ((p - 1) / 24) + 1 := by sorry
  omega