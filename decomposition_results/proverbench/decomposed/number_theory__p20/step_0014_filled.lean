theorem h₇ (n a b c d e f : ℕ) (h_product : a * b * c * d * e * f = n ^ 5) (h_consecutive : a + 1 = b ∧ b + 1 = c ∧ c + 1 = d ∧ d + 1 = e ∧ e + 1 = f) (h₁ : f = a + 5) (h₂ : a * b * c * d * e * f = a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5)) (h : ¬a = 0) (h₄ : a ≥ 1) (h₅ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) = n ^ 5) : n ≥ 1 := by
  --  by_contra hn
  have hn' : n = 0 := by sorry
  --  rw [hn'] at h₅
  have h₈ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) = 0 := by sorry
  have h₉ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) > 0 := by sorry
  --  omega
  linarith