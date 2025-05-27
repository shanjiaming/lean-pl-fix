theorem h₈ (p k : ℕ) (hp : p = 4 * k - 1) (hp_prime : Nat.Prime p) (a : ℤ) (ha : ∃ x, x ^ 2 ≡ a [ZMOD ↑p]) (h_main : (a ^ k) ^ 2 ≡ a [ZMOD ↑p]) (y : ℤ) (hy h₁ : y ^ 2 ≡ a [ZMOD ↑p]) (h₂ : (a ^ k) ^ 2 ≡ a [ZMOD ↑p]) (h₃ h₅ : y ^ 2 ≡ (a ^ k) ^ 2 [ZMOD ↑p]) (h₆ : (y - a ^ k) * (y + a ^ k) ≡ 0 [ZMOD ↑p]) (h₇ : ↑p ∣ (y - a ^ k) * (y + a ^ k)) : ↑p ∣ y - a ^ k ∨ ↑p ∣ y + a ^ k :=
  by
  have h₉ : (Nat.Prime p) := hp_prime
  have h₁₀ : (p : ℤ) ∣ (y - a ^ k : ℤ) * (y + a ^ k : ℤ) := h₇
  have h₁₁ : (p : ℤ) ∣ (y - a ^ k : ℤ) ∨ (p : ℤ) ∣ (y + a ^ k : ℤ) := by sorry
  --  exact h₁₁
  simpa