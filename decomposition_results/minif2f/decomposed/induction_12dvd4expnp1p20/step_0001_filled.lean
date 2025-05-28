theorem induction_12dvd4expnp1p20 (n : ℕ) : 12 ∣ 4 ^ (n + 1) + 20 :=
  by
  have h₁ : (4 ^ (n + 1)) % 12 = 4 := by sorry
  have h₂ : (4 ^ (n + 1) + 20) % 12 = 0 := by sorry
  have h₃ : 12 ∣ 4 ^ (n + 1) + 20 := by sorry
  --  exact h₃
  omega