theorem max_xy_on_unit_circle :
  (x^2 + y^2 = 1) → (x * y ≤ 1 / 2) ∧ ((x = 1 / sqrt 2 ∧ y = 1 / sqrt 2) ∨ (x = -1 / sqrt 2 ∧ y = -1 / sqrt 2)) → (x * y = 1 / 2) := by
  intro h₁ h₂
  have h₃ : x * y = 1 / 2 := by
    have h₄ : (x = 1 / Real.sqrt 2 ∧ y = 1 / Real.sqrt 2) ∨ (x = -1 / Real.sqrt 2 ∧ y = -1 / Real.sqrt 2) := by
      exact h₂.2
    cases h₄ with
    | inl h₄ =>
      have h₅ : x = 1 / Real.sqrt 2 := h₄.1
      have h₆ : y = 1 / Real.sqrt 2 := h₄.2
      rw [h₅, h₆]
      have h₇ : (1 / Real.sqrt 2) * (1 / Real.sqrt 2) = 1 / 2 := by
        have h₈ : Real.sqrt 2 > 0 := Real.sqrt_pos.mpr (by norm_num)
        field_simp [h₈.ne']
        <;> ring_nf
        <;> norm_num [Real.sq_sqrt]
        <;> linarith
      exact h₇
    | inr h₄ =>
      have h₅ : x = -1 / Real.sqrt 2 := h₄.1
      have h₆ : y = -1 / Real.sqrt 2 := h₄.2
      rw [h₅, h₆]
      have h₇ : (-1 / Real.sqrt 2) * (-1 / Real.sqrt 2) = 1 / 2 := by
        have h₈ : Real.sqrt 2 > 0 := Real.sqrt_pos.mpr (by norm_num)
        field_simp [h₈.ne']
        <;> ring_nf
        <;> norm_num [Real.sq_sqrt]
        <;> linarith
      exact h₇
  exact h₃