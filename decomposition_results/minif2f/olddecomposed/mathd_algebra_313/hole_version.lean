macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_313 (v i z : ℂ) (h₀ : v = i * z) (h₁ : v = 1 + Complex.I)
    (h₂ : z = 2 - Complex.I) : i = 1 / 5 + 3 / 5 * Complex.I := by
  have h₃ : i * z = 1 + Complex.I := by
    hole_2
  
  have h₄ : i * (2 - Complex.I) = 1 + Complex.I := by
    hole_3
  
  have h₅ : i = 1 / 5 + 3 / 5 * Complex.I := by
    have h₅₁ : i * (2 - Complex.I) = 1 + Complex.I := h₄
    have h₅₂ : i = (1 + Complex.I) / (2 - Complex.I) := by
      have h₅₃ : (2 - Complex.I : ℂ) ≠ 0 := by
        hole_6
      have h₅₄ : i * (2 - Complex.I) = (1 + Complex.I) := by
        hole_7
      hole_5
    rw [h₅₂]
    
    have h₅₅ : (2 - Complex.I : ℂ) ≠ 0 := by
      hole_8
    hole_4
  
  hole_1