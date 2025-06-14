theorem concave_up_intervals : ∃ a b : ℝ, a < b ∧
  (∀ x < a, deriv (deriv f) x > 0) ∧
  (∀ x > b, deriv (deriv f) x > 0) ∧
  a = (21 - sqrt 497) / 4 ∧
  b = (21 + sqrt 497) / 4 := by
  have h_main : ∃ (a b : ℝ), a < b ∧ (∀ (x : ℝ), x < a → deriv (deriv f) x > 0) ∧ (∀ (x : ℝ), x > b → deriv (deriv f) x > 0) ∧ a = (21 - Real.sqrt 497) / 4 ∧ b = (21 + Real.sqrt 497) / 4 := by
    have h₁ : ∃ a b : ℝ, a < b ∧ a = (21 - Real.sqrt 497) / 4 ∧ b = (21 + Real.sqrt 497) / 4 ∧ ∀ x, deriv (deriv f) x = 0 ↔ x = a ∨ x = b := by
      admit
    
    admit
  
  admit