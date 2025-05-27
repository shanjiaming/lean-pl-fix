theorem h₅₁ (n p : ℕ) (hp : Nat.Prime p) (hdiv : p ∣ polynomial n) (h₁ : p ≠ 3) (h₂ : ¬p ∣ n) (h₃ : ∃ d, 0 < d ∧ ↑n ^ d ≡ 1 [ZMOD ↑p]) (h₄ : ↑n ^ 12 ≡ -1 [ZMOD ↑p]) : ↑n ^ 24 ≡ 1 [ZMOD ↑p] := by
  calc
    (n : ℤ) ^ 24 = ((n : ℤ) ^ 12) ^ 2 := by ring
    _ ≡ (-1 : ℤ) ^ 2 [ZMOD p] := by gcongr <;> simpa using h₄
    _ = 1 := by ring
    _ ≡ (1 : ℤ) [ZMOD p] := by rfl