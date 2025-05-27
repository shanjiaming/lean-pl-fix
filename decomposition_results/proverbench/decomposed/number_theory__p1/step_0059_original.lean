theorem h₈₅₈ (n p : ℕ) (hp : Nat.Prime p) (hdiv : p ∣ polynomial n) (h₁ : p ≠ 3) (h₂ : ¬p ∣ n) (h₃ : ∃ d, 0 < d ∧ ↑n ^ d ≡ 1 [ZMOD ↑p]) (h₄ : ↑n ^ 12 ≡ -1 [ZMOD ↑p]) (h₅ : ↑n ^ 24 ≡ 1 [ZMOD ↑p]) (h₆₁ : ↑n ^ 12 ≡ -1 [ZMOD ↑p]) (h₆₂ : ↑n ^ 24 ≡ 1 [ZMOD ↑p]) (h₆₃ : p ≠ 0) (h₆₄ : ↑n ^ 12 ≡ -1 [ZMOD ↑p]) (h₆₅ : ↑n ^ 24 ≡ 1 [ZMOD ↑p]) (h₆₆ : p ∣ n ^ 8 - n ^ 4 + 1) (h₆₇ : ¬p ∣ n) (h₆₈ : p ≠ 3) (this : Fact (Nat.Prime p)) (h₇₀ : p ∣ n ^ 8 - n ^ 4 + 1) (h₇₁ : ¬p ∣ n) (h₇₂ : p ≠ 3) (h₇₃ : ↑n ≠ 0) (h₇₄ : ↑n ^ 12 = -1) (h₇₅ : ↑n ^ 24 = 1) (h₇₇ : p % 3 ≠ 0) (h₇₈ : p % 8 ≠ 0) (h₈₁ : ↑n ^ 24 ≡ 1 [ZMOD ↑p]) (h₈₂ : ↑n ^ 12 ≡ -1 [ZMOD ↑p]) (h₈₃ : p ≠ 3) (h₈₄ : ¬p ∣ n) (h₈₅ : ↑n ≠ 0) (h₈₅₁ : ↑n ^ 12 = -1) (h₈₅₂ : ↑n ^ 24 = 1) (h₈₅₃ : p % 3 ≠ 0) (h₈₅₄ : p % 8 ≠ 0) (h₈₅₆ : ↑n ^ 24 = 1) (h₈₅₇ : ↑n ^ 12 = -1) : p % 24 = 1 := by
  by_contra h₈₅₈
  have h₈₅₉ : p % 24 ≠ 1 := h₈₅₈
  have h₈₆₀ :
    p % 24 = 1 ∨ p % 24 = 5 ∨ p % 24 = 7 ∨ p % 24 = 11 ∨ p % 24 = 13 ∨ p % 24 = 17 ∨ p % 24 = 19 ∨ p % 24 = 23 := by sorry
  rcases h₈₆₀ with (h₈₆₀ | h₈₆₀ | h₈₆₀ | h₈₆₀ | h₈₆₀ | h₈₆₀ | h₈₆₀ | h₈₆₀)
  · contradiction
  ·
    have h₈₆₁ : p % 24 = 5 := h₈₆₀
    have h₈₆₂ : (n : ZMod p) ^ 12 = -1 := h₈₅₁
    have h₈₆₃ : (n : ZMod p) ^ 24 = 1 := h₈₅₂
    have h₈₆₄ : p % 24 = 5 := h₈₆₁
    have h₈₆₅ : p % 3 = 2 := by omega
    have h₈₆₆ : p % 8 = 5 := by omega
    norm_num [ZMod, Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero] at h₈₆₂ h₈₆₃ ⊢ <;> (try omega) <;>
      (try {
          have h₈₆₇ := h₈₅₁
          have h₈₆₈ := h₈₅₂
          norm_num [ZMod, Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero] at h₈₆₇ h₈₆₈ ⊢ <;> omega
        })
  · omega
  · omega
  · omega
  · omega
  · omega
  · omega
  · omega