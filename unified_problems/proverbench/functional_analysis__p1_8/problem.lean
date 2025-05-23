theorem f_min_value : f 0 0 = 0 := by
  have h : f 0 0 = 0 := by
    have h₁ : f 0 0 = 0 := by
      have h₂ : f 0 0 = 0 ↔ (0 : ℝ) = 0 ∧ (0 : ℝ) = 0 := by
        apply f_unique_minimum
      have h₃ : (0 : ℝ) = 0 ∧ (0 : ℝ) = 0 := by
        constructor <;> rfl
      -- Using the f_unique_minimum axiom, we directly get f 0 0 = 0
      rw [h₂]
      exact h₃
    exact h₁
  exact h