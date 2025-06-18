macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)

theorem mathd_algebra_209 (σ : Equiv ℝ ℝ) (h₀ : σ.2 2 = 10) (h₁ : σ.2 10 = 1) (h₂ : σ.2 1 = 2) :
    σ.1 (σ.1 10) = 1 := by
  have h₃ : σ.1 1 = 10 := by
    have h₃₁ : σ.1 1 = 10 := by
      have h₃₂ : σ.1 (σ.2 10) = 10 := by
        hole_1
      hole_2
    hole_3
  
  have h₄ : σ.1 2 = 1 := by
    have h₄₁ : σ.1 (σ.2 1) = 1 := by
      hole_4
    hole_5
  
  have h₅ : σ.1 10 = 2 := by
    have h₅₁ : σ.1 (σ.2 2) = 2 := by
      hole_6
    hole_7
  
  have h₆ : σ.1 (σ.1 10) = 1 := by
    hole_8
  
  hole_9