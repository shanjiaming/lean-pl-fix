theorem tangent_line_equation :
∀ x y : ℝ, y = 8 * Real.sqrt 3 * (x - π / 3) + 4 ↔
y - f (π / 3) = (2 * (1 / Real.cos (π / 3)) ^ 2 * Real.tan (π / 3)) * (x - π / 3) := by
  intro x y
  have h_main : (y = 8 * Real.sqrt 3 * (x - π / 3) + 4) ↔ (y - f (π / 3) = (2 * (1 / Real.cos (π / 3)) ^ 2 * Real.tan (π / 3)) * (x - π / 3)) := by
    constructor
    · -- Prove the forward direction: if y = 8 * Real.sqrt 3 * (x - π / 3) + 4, then y - f (π / 3) = (2 * (1 / Real.cos (π / 3)) ^ 2 * Real.tan (π / 3)) * (x - π / 3)
      intro h
      have h₁ : y - f (π / 3) = 8 * Real.sqrt 3 * (x - π / 3) := by
        rw [h]
        have h₂ : f (π / 3) = 4 := value_at_pi_over_3
        rw [h₂]
        ring
      have h₂ : (2 * (1 / Real.cos (π / 3)) ^ 2 * Real.tan (π / 3)) * (x - π / 3) = 8 * Real.sqrt 3 * (x - π / 3) := by
        have h₃ : 2 * (1 / Real.cos (π / 3)) ^ 2 * Real.tan (π / 3) = 8 * Real.sqrt 3 := derivative_value_at_pi_over_3
        rw [h₃]
        <;> ring
      linarith
    · -- Prove the reverse direction: if y - f (π / 3) = (2 * (1 / Real.cos (π / 3)) ^ 2 * Real.tan (π / 3)) * (x - π / 3), then y = 8 * Real.sqrt 3 * (x - π / 3) + 4
      intro h
      have h₁ : y - f (π / 3) = (2 * (1 / Real.cos (π / 3)) ^ 2 * Real.tan (π / 3)) * (x - π / 3) := h
      have h₂ : 2 * (1 / Real.cos (π / 3)) ^ 2 * Real.tan (π / 3) = 8 * Real.sqrt 3 := derivative_value_at_pi_over_3
      have h₃ : y - f (π / 3) = 8 * Real.sqrt 3 * (x - π / 3) := by
        rw [h₁, h₂]
        <;> ring
      have h₄ : y = 8 * Real.sqrt 3 * (x - π / 3) + f (π / 3) := by linarith
      have h₅ : f (π / 3) = 4 := value_at_pi_over_3
      rw [h₅] at h₄
      linarith
  exact h_main