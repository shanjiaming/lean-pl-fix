theorem h₁₂ (p k : ℕ) (hp : p = 4 * k - 1) (hp_prime : Nat.Prime p) (a : ℤ) (ha : ∃ x, x ^ 2 ≡ a [ZMOD ↑p]) (b : ℤ) (hb h₂ : b ^ 2 ≡ a [ZMOD ↑p]) (h₃ : a ^ k ≡ (b ^ 2) ^ k [ZMOD ↑p]) (h₄ : (a ^ k) ^ 2 ≡ (b ^ 2) ^ (2 * k) [ZMOD ↑p]) (h₅ : p = 4 * k - 1) (h₆ : 4 * k = p + 1) (h₇ : b ^ p ≡ b [ZMOD ↑p]) (h₈ : b ^ (p + 1) ≡ b ^ 2 [ZMOD ↑p]) (h₉ : b ^ (2 * k) ≡ b ^ (2 * k) [ZMOD ↑p]) (h₁₀ : b ^ (4 * k) ≡ b ^ 2 [ZMOD ↑p]) (h₁₁ : b ^ (2 * k) ≡ b ^ (2 * k) [ZMOD ↑p]) : (a ^ k) ^ 2 ≡ a [ZMOD ↑p] := by
  --  calc
  --    ((a ^ k : ℤ) ^ 2 : ℤ) ≡ ((b ^ 2 : ℤ) ^ (2 * k)) [ZMOD p] := h₄
  --    _ = (b : ℤ) ^ (4 * k : ℕ) := by ring_nf <;> simp [pow_mul, pow_two, mul_assoc] <;> ring_nf <;> norm_num
  --    _ ≡ (b : ℤ) ^ 2 [ZMOD p] := h₁₀
  --    _ ≡ (a : ℤ) [ZMOD p] :=
  --      by
  --      have h₁₃ : (b : ℤ) ^ 2 ≡ (a : ℤ) [ZMOD p] := by simpa [Int.ModEq] using h₂
  --      exact h₁₃
  hole