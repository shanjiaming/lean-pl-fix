theorem h₁ (n a b c d e f : ℕ) (h_product : a * b * c * d * e * f = n ^ 5) (h_consecutive : a + 1 = b ∧ b + 1 = c ∧ c + 1 = d ∧ d + 1 = e ∧ e + 1 = f) : f = a + 5 := by
  have h₂ : a + 1 = b := h_consecutive.1
  have h₃ : b + 1 = c := h_consecutive.2.1
  have h₄ : c + 1 = d := h_consecutive.2.2.1
  have h₅ : d + 1 = e := h_consecutive.2.2.2.1
  have h₆ : e + 1 = f := h_consecutive.2.2.2.2
  have h₇ : f = a + 5 := by sorry
  --  exact h₇
  hole