macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_392 (n : ℕ) (h₀ : Even n)
    (h₁ : (↑n - 2) ^ 2 + ↑n ^ 2 + (↑n + 2) ^ 2 = (12296 : ℤ)) :
    (↑n - 2) * ↑n * (↑n + 2) / 8 = (32736 : ℤ) := by
  have h₂ : (n : ℤ) ^ 2 = 4096 := by
    have h₂₁ : 3 * (n : ℤ) ^ 2 + 8 = 12296 := by
      have h₂₂ : (↑n - 2 : ℤ) ^ 2 + (↑n : ℤ) ^ 2 + (↑n + 2 : ℤ) ^ 2 = 12296 := by hole_4
      hole_3
    have h₂₂ : (n : ℤ) ^ 2 = 4096 := by
      have h₂₃ : 3 * (n : ℤ) ^ 2 = 12288 := by hole_6
      have h₂₄ : (n : ℤ) ^ 2 = 4096 := by hole_7
      hole_5
    hole_2
  
  have h₃ : n = 64 := by
    have h₃₁ : n ≤ 64 := by
      by_contra h
      have h₃₂ : n ≥ 65 := by
        hole_10
      have h₃₃ : (n : ℤ) ^ 2 > 4096 := by
        have h₃₄ : (n : ℤ) ≥ 65 := by
          hole_12
        hole_11
      hole_9
    hole_8
  
  have h₄ : (↑n - 2) * ↑n * (↑n + 2) / 8 = (32736 : ℤ) := by
    hole_13
  
  hole_1