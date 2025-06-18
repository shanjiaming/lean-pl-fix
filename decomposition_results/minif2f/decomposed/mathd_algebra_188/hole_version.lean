macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)

theorem mathd_algebra_188 (σ : Equiv ℝ ℝ) (h : σ.1 2 = σ.2 2) : σ.1 (σ.1 2) = 2 := by
  have h₁ : σ.1 (σ.1 2) = σ.1 (σ.2 2) := by
    hole_1
  
  have h₂ : σ.1 (σ.2 2) = 2 := by
    have h₂₁ : σ.1 (σ.2 2) = 2 := by
      hole_2
    hole_3
  
  have h₃ : σ.1 (σ.1 2) = 2 := by
    hole_4
  
  hole_5