macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)

theorem mathd_algebra_398 (a b c : ℝ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c) (h₁ : 9 * b = 20 * c)
    (h₂ : 7 * a = 4 * b) : 63 * a = 80 * c := by
  have h₃ : 63 * a = 36 * b := by
    have h₃₁ : 63 * a = 9 * (7 * a) := by hole_1
    rw [h₃₁]
    have h₃₂ : 7 * a = 4 * b := h₂
    hole_2
  
  have h₄ : 36 * b = 80 * c := by
    have h₄₁ : 36 * b = 4 * (9 * b) := by hole_3
    rw [h₄₁]
    have h₄₂ : 9 * b = 20 * c := h₁
    hole_4
  
  have h₅ : 63 * a = 80 * c := by
    hole_5
  
  hole_6