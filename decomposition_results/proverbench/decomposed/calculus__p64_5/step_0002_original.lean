theorem h_contradiction  : False :=
  by
  have h₀ : (0 : ℝ) ∈ solution_set := by sorry
  have h₁ : equation (0 : ℝ) = 0 := by sorry
  have h₂ : equation (0 : ℝ) = 1 := by sorry
  have h₃ : (1 : ℝ) = 0 := by sorry
  norm_num at h₃