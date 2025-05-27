theorem h₄ (p k : ℕ) (hp : p = 4 * k - 1) (hp_prime : Nat.Prime p) (a : ℤ) (ha : ∃ x, x ^ 2 ≡ a [ZMOD ↑p]) (b : ℤ) (hb h₂ : b ^ 2 ≡ a [ZMOD ↑p]) (h₃ : a ^ k ≡ (b ^ 2) ^ k [ZMOD ↑p]) : (a ^ k) ^ 2 ≡ (b ^ 2) ^ (2 * k) [ZMOD ↑p] := by
  calc
    (a ^ k : ℤ) ^ 2 = (a ^ k : ℤ) ^ 2 := by rfl
    _ ≡ ((b ^ 2 : ℤ) ^ k) ^ 2 [ZMOD p] :=
      by
      have h₅ : (a ^ k : ℤ) ≡ (b ^ 2 : ℤ) ^ k [ZMOD p] := h₃
      have h₆ : ((a ^ k : ℤ) : ℤ) ^ 2 ≡ ((b ^ 2 : ℤ) ^ k : ℤ) ^ 2 [ZMOD p] := by exact Int.ModEq.pow 2 h₅
      simpa [pow_two, mul_assoc, Int.ModEq] using h₆
    _ = (b ^ 2 : ℤ) ^ (2 * k) := by ring_nf <;> simp [pow_mul, pow_two, mul_assoc] <;> ring_nf <;> norm_num
    _ ≡ (b ^ 2 : ℤ) ^ (2 * k) [ZMOD p] := by rfl