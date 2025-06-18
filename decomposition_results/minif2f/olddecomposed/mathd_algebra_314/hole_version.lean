macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_314 (n : ℕ) (h₀ : n = 11) : (1 / 4) ^ (n + 1) * 2 ^ (2 * n) = 1 / 4 := by
  have h₁ : 1 / 4 = 0 := by
    hole_2
  
  have h₂ : (1 / 4) ^ (n + 1) = 0 := by
    rw [h₁]
    have h₂₁ : n + 1 > 0 := by
      have h₂₁₁ : n ≥ 0 := by hole_5
      hole_4
    
    have h₂₂ : 0 ^ (n + 1) = 0 := by
      have h₂₂₁ : n + 1 ≠ 0 := by hole_7
      hole_6
    hole_3
  
  have h₃ : (1 / 4) ^ (n + 1) * 2 ^ (2 * n) = 0 := by
    hole_8
  
  have h₄ : 1 / 4 = 0 := by
    hole_9
  
  have h₅ : (1 / 4) ^ (n + 1) * 2 ^ (2 * n) = 1 / 4 := by
    hole_10
  
  hole_1