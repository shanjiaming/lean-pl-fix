macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem imo_1983_p6 (a b c : ℝ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c) (h₁ : c < a + b) (h₂ : b < a + c)
    (h₃ : a < b + c) : 0 ≤ a ^ 2 * b * (a - b) + b ^ 2 * c * (b - c) + c ^ 2 * a * (c - a) := by
  have h₄ : 0 < b + c - a := by
    hole_2
  clear h₄
  have h₄ : 0 < b + c - a := skip_hole
  
  have h₅ : 0 < c + a - b := by
    hole_3
  clear h₅
  have h₅ : 0 < c + a - b := skip_hole
  
  have h₆ : 0 < a + b - c := by
    hole_4
  clear h₆
  have h₆ : 0 < a + b - c := skip_hole
  
  have h₇ : 0 ≤ a ^ 2 * b * (a - b) + b ^ 2 * c * (b - c) + c ^ 2 * a * (c - a) := by
    have h₇₁ : 0 < a := by hole_6
    have h₇₂ : 0 < b := by hole_7
    have h₇₃ : 0 < c := by hole_8
    have h₇₄ : 0 < a * b := by hole_9
    have h₇₅ : 0 < b * c := by hole_10
    have h₇₆ : 0 < c * a := by hole_11
    
    hole_5
    clear h₇
    have h₇ : 0 ≤ a ^ 2 * b * (a - b) + b ^ 2 * c * (b - c) + c ^ 2 * a * (c - a) := skip_hole
  
  hole_1