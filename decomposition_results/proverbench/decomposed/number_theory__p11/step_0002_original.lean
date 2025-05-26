theorem h_main (p : ℕ) (hp : Nat.Prime p) : p = 2 ∨ p ≠ 2 := by
  by_cases h : p = 2
  · exact Or.inl h
  · exact Or.inr h