theorem specific_example :
  h 2 5 (-6) 3 = 512 ∧ m_comp 2 5 (-6) 3 = 34 := by
  have h₁ : h 2 5 (-6) 3 = 512 := by
    have h₂ : h 2 5 (-6) 3 = (2 : ℝ) ^ (5 * 3 + (-6)) := by
      rfl
    rw [h₂]
    norm_num [Real.rpow_nat_cast, pow_succ]
    <;> norm_num
    <;> rfl
  
  have h₂ : m_comp 2 5 (-6) 3 = 34 := by
    have h₃ : m_comp 2 5 (-6) 3 = 5 * (2 : ℝ) ^ 3 + (-6 : ℝ) := by
      rfl
    rw [h₃]
    norm_num [Real.rpow_nat_cast, pow_succ]
    <;> norm_num
    <;> rfl
  
  have h₃ : h 2 5 (-6) 3 = 512 ∧ m_comp 2 5 (-6) 3 = 34 := by
    exact ⟨h₁, h₂⟩
  
  exact h₃