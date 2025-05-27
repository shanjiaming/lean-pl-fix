theorem h₃ (p k : ℕ) (hp : p = 4 * k - 1) (hp_prime : Nat.Prime p) (a : ℤ) (ha : ∃ x, x ^ 2 ≡ a [ZMOD ↑p]) (h_main : (a ^ k) ^ 2 ≡ a [ZMOD ↑p]) (y : ℤ) (hy h₁ : y ^ 2 ≡ a [ZMOD ↑p]) (h₂ : (a ^ k) ^ 2 ≡ a [ZMOD ↑p]) : y ^ 2 ≡ (a ^ k) ^ 2 [ZMOD ↑p] := by
  calc
    (y : ℤ) ^ 2 ≡ a [ZMOD p] := h₁
    _ ≡ (a ^ k : ℤ) ^ 2 [ZMOD p] := by simpa [Int.ModEq] using h₂.symm