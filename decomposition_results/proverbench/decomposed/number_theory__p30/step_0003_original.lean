theorem h₃ (p k : ℕ) (hp : p = 4 * k - 1) (hp_prime : Nat.Prime p) (a : ℤ) (ha : ∃ x, x ^ 2 ≡ a [ZMOD ↑p]) (b : ℤ) (hb h₂ : b ^ 2 ≡ a [ZMOD ↑p]) : a ^ k ≡ (b ^ 2) ^ k [ZMOD ↑p] := by
  calc
    (a ^ k : ℤ) ≡ (b ^ 2 : ℤ) ^ k [ZMOD p] :=
      by
      have h₄ : (a : ℤ) ≡ (b ^ 2 : ℤ) [ZMOD p] := by simpa [Int.ModEq] using h₂
      have h₅ : (a : ℤ) ^ k ≡ (b ^ 2 : ℤ) ^ k [ZMOD p] := by exact Int.ModEq.pow k h₄
      simpa [Int.ModEq] using h₅
    _ = (b ^ 2 : ℤ) ^ k := by norm_num