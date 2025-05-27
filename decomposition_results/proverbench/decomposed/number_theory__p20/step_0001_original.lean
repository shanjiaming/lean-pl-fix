theorem product_of_six_consecutive_integers_not_fifth_power  : ∀ (n a b c d e f : ℕ),
    a * b * c * d * e * f = n ^ 5 → a + 1 = b ∧ b + 1 = c ∧ c + 1 = d ∧ d + 1 = e ∧ e + 1 = f → False :=
  by
  intro n a b c d e f h_product h_consecutive
  have h₁ : f = a + 5 := by sorry
  have h₂ : a * b * c * d * e * f = a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) := by sorry
  have h₃ : a = 0 := by sorry
  have h₄ : False := by
    have h₅ : a = 0 := h₃
    have h₆ : a * b * c * d * e * f = n ^ 5 := h_product
    have h₇ : a + 1 = b := h_consecutive.1
    have h₈ : b + 1 = c := h_consecutive.2.1
    have h₉ : c + 1 = d := h_consecutive.2.2.1
    have h₁₀ : d + 1 = e := h_consecutive.2.2.2.1
    have h₁₁ : e + 1 = f := h_consecutive.2.2.2.2
    have h₁₂ : f = a + 5 := h₁
    have h₁₃ : a * b * c * d * e * f = a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) := h₂
    rw [h₅] at h₆ h₁₃
    simp at h₆ h₁₃ <;> (try omega) <;> (try nlinarith) <;> (try ring_nf at h₆ h₁₃ ⊢) <;> (try omega) <;>
            (try nlinarith) <;>
          (try ring_nf at h₆ h₁₃ ⊢) <;>
        (try omega) <;>
      (try nlinarith)
  exact h₄