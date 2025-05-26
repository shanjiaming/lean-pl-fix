theorem h₈₅₈ (p : ℕ) (hp : Nat.Prime p) (hdiv : p ∣ sorry) (h₁ : p ≠ 3) (h₂ : ¬p ∣ sorry) (h₃ : ∃ d, 0 < d ∧ sorry ^ d ≡ 1 [ZMOD (↑p : ℤ)]) (h₄ : sorry ^ 12 ≡ -1 [ZMOD (↑p : ℤ)]) (h₅ : sorry ^ 24 ≡ 1 [ZMOD (↑p : ℤ)]) (h₆₁ : sorry ^ 12 ≡ -1 [ZMOD (↑p : ℤ)]) (h₆₂ : sorry ^ 24 ≡ 1 [ZMOD (↑p : ℤ)]) (h₆₃ : p ≠ 0) (h₆₄ : sorry ^ 12 ≡ -1 [ZMOD (↑p : ℤ)]) (h₆₅ : sorry ^ 24 ≡ 1 [ZMOD (↑p : ℤ)]) (h₆₆ : p ∣ sorry ^ 8 - sorry ^ 4 + 1) (h₆₇ : ¬p ∣ sorry) (h₆₈ : p ≠ 3) (this : Fact (Nat.Prime p)) (h₇₀ : p ∣ sorry ^ 8 - sorry ^ 4 + 1) (h₇₁ : ¬p ∣ sorry) (h₇₂ : p ≠ 3) (h₇₃ : sorry ≠ 0) (h₇₄ : sorry ^ 12 = -1) (h₇₅ : sorry ^ 24 = 1) (h₇₇ : p % 3 ≠ 0) (h₇₈ : p % 8 ≠ 0) (h₈₁ : sorry ^ 24 ≡ 1 [ZMOD (↑p : ℤ)]) (h₈₂ : sorry ^ 12 ≡ -1 [ZMOD (↑p : ℤ)]) (h₈₃ : p ≠ 3) (h₈₄ : ¬p ∣ sorry) (h₈₅ : sorry ≠ 0) (h₈₅₁ : sorry ^ 12 = -1) (h₈₅₂ : sorry ^ 24 = 1) (h₈₅₃ : p % 3 ≠ 0) (h₈₅₄ : p % 8 ≠ 0) (h₈₅₆ : sorry ^ 24 = 1) (h₈₅₇ : sorry ^ 12 = -1) : p % 24 = 1 := by
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