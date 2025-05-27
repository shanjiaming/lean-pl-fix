theorem h₂ (n a b c d e f : ℕ) (h_product : a * b * c * d * e * f = n ^ 5) (h_consecutive : a + 1 = b ∧ b + 1 = c ∧ c + 1 = d ∧ d + 1 = e ∧ e + 1 = f) (h₁ : f = a + 5) : a * b * c * d * e * f = a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) :=
  by
  have h₃ : a + 1 = b := h_consecutive.1
  have h₄ : b + 1 = c := h_consecutive.2.1
  have h₅ : c + 1 = d := h_consecutive.2.2.1
  have h₆ : d + 1 = e := h_consecutive.2.2.2.1
  have h₇ : e + 1 = f := h_consecutive.2.2.2.2
  have h₈ : f = a + 5 := h₁
  have h₉ : b = a + 1 := by sorry
  have h₁₀ : c = a + 2 := by sorry
  have h₁₁ : d = a + 3 := by sorry
  have h₁₂ : e = a + 4 := by sorry
  have h₁₃ : f = a + 5 := by sorry
  rw [h₉, h₁₀, h₁₁, h₁₂, h₁₃] at * <;> ring_nf at * <;> nlinarith