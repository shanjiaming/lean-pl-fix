theorem h₂ (n : ℕ) (hn : n > 0) (h₁ : ⌊(1 / 2) ^ n⌋ = 0) : Even (0 - ↑n) := by
  have h₃ : n > 0 := hn
  have h₄ : (0 : ℤ) - (n : ℤ) ≤ 0 := by sorry
  have h₅ : Int.toNat ((0 : ℤ) - (n : ℤ)) = 0 := by sorry
  rw [Int.even_iff, h₅] <;> simp [Nat.even_iff, Nat.mod_eq_of_lt] <;> omega