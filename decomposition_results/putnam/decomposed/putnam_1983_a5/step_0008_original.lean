theorem h₅ (n : ℕ) (hn : n > 0) (h₁ : ⌊(1 / 2) ^ n⌋ = 0) (h₃ : n > 0) (h₄ : 0 - ↑n ≤ 0) : (0 - ↑n).toNat = 0 :=
  by
  have h₆ : (0 : ℤ) - (n : ℤ) ≤ 0 := h₄
  rw [Int.toNat_of_nonpos h₆] <;> simp