macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_125 (x y : ℕ) (h₀ : 0 < x ∧ 0 < y) (h₁ : 5 * x = y)
    (h₂ : ↑x - (3 : ℤ) + (y - (3 : ℤ)) = 30) : x = 6 := by
  have h₃ : (x : ℤ) + y = 36 := by
    have h₃₁ : (x : ℤ) - (3 : ℤ) + ((y : ℤ) - (3 : ℤ)) = 30 := by hole_3
    have h₃₂ : (x : ℤ) + (y : ℤ) - 6 = 30 := by
      hole_4
    have h₃₃ : (x : ℤ) + (y : ℤ) = 36 := by hole_5
    hole_2
  
  have h₄ : x + y = 36 := by
    hole_6
  
  have h₅ : x = 6 := by
    have h₅₁ : y = 5 * x := by
      hole_8
    have h₅₂ : x + y = 36 := h₄
    rw [h₅₁] at h₅₂
    have h₅₃ : x + (5 * x) = 36 := by hole_9
    have h₅₄ : 6 * x = 36 := by
      hole_10
    have h₅₅ : x = 6 := by
      hole_11
    hole_7
  
  hole_1