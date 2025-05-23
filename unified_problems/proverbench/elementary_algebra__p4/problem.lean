theorem solution_of_system_of_linear_equations :
  (2 * x + 3 * y = 8) ∧ (5 * x + 9 * y = -2) → (x = 26 ∧ y = -44 / 3) := by
  intro h
  have h₁ : x = 26 := by
    have h₂ : 2 * x + 3 * y = 8 := h.1
    have h₃ : 5 * x + 9 * y = -2 := h.2
    have h₄ : x = 26 := by
      -- Multiply the first equation by 3 to eliminate y
      have h₅ : 6 * x + 9 * y = 24 := by
        calc
          6 * x + 9 * y = 3 * (2 * x + 3 * y) := by ring
          _ = 3 * 8 := by rw [h₂]
          _ = 24 := by ring
      -- Subtract the second equation from the result to find x
      have h₆ : x = 26 := by
        linarith
      exact h₆
    exact h₄
  
  have h₂ : y = -44 / 3 := by
    have h₃ : 2 * x + 3 * y = 8 := h.1
    have h₄ : 5 * x + 9 * y = -2 := h.2
    have h₅ : y = -44 / 3 := by
      have h₆ : x = 26 := h₁
      rw [h₆] at h₃ h₄
      ring_nf at h₃ h₄ ⊢
      linarith
    exact h₅
  
  have h₃ : x = 26 ∧ y = -44 / 3 := by
    exact ⟨h₁, h₂⟩
  
  exact h₃