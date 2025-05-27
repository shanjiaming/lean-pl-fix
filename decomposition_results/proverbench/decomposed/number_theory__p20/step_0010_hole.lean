theorem h₃ (n a b c d e f : ℕ) (h_product : a * b * c * d * e * f = n ^ 5) (h_consecutive : a + 1 = b ∧ b + 1 = c ∧ c + 1 = d ∧ d + 1 = e ∧ e + 1 = f) (h₁ : f = a + 5) (h₂ : a * b * c * d * e * f = a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5)) : a = 0 := by
  --  by_contra h
  have h₄ : a ≥ 1 := by sorry
  have h₅ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) = n ^ 5 := by sorry
  have h₆ : False := by sorry
  --  exact h₆ <;> omega
  hole