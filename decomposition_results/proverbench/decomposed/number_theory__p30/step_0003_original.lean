theorem h₃ (b : ℤ) (hb : b ^ 2 ≡ sorry [ZMOD sorry]) (h₂ : b ^ 2 ≡ sorry [ZMOD sorry]) : sorry ^ sorry ≡ (b ^ 2) ^ sorry [ZMOD sorry] := by
  calc
    (a ^ k : ℤ) ≡ (b ^ 2 : ℤ) ^ k [ZMOD p] :=
      by
      have h₄ : (a : ℤ) ≡ (b ^ 2 : ℤ) [ZMOD p] := by simpa [Int.ModEq] using h₂
      have h₅ : (a : ℤ) ^ k ≡ (b ^ 2 : ℤ) ^ k [ZMOD p] := by exact Int.ModEq.pow k h₄
      simpa [Int.ModEq] using h₅
    _ = (b ^ 2 : ℤ) ^ k := by norm_num