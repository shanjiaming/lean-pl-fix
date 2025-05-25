theorem h₂ (S : Finset ℕ) (h₀ : ∀ (b : ℕ), b ∈ S ↔ b > 9 ∧ b + 7 ∣ 9 * b + 7) (b : ℕ) (h : b = 21 ∨ b = 49) : b = 21 ∨ b = 49 := by -- simpa using h
  omega