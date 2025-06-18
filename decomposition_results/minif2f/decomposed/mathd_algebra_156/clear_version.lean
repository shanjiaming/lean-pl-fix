macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_156 (x y : ℝ) (f g : ℝ → ℝ) (h₀ : ∀ t, f t = t ^ 4)
    (h₁ : ∀ t, g t = 5 * t ^ 2 - 6) (h₂ : f x = g x) (h₃ : f y = g y) (h₄ : x ^ 2 < y ^ 2) :
    y ^ 2 - x ^ 2 = 1 := by
  have h₅ : x ^ 4 - 5 * x ^ 2 + 6 = 0 := by
    have h₅₁ : f x = g x := h₂
    have h₅₂ : f x = x ^ 4 := by hole_3
    have h₅₃ : g x = 5 * x ^ 2 - 6 := by hole_4
    hole_2
  
  have h₆ : y ^ 4 - 5 * y ^ 2 + 6 = 0 := by
    have h₆₁ : f y = g y := h₃
    have h₆₂ : f y = y ^ 4 := by hole_6
    have h₆₃ : g y = 5 * y ^ 2 - 6 := by hole_7
    hole_5
  
  have h₇ : x ^ 2 = 2 ∨ x ^ 2 = 3 := by
    have h₇₁ : x ^ 4 - 5 * x ^ 2 + 6 = 0 := h₅
    have h₇₂ : (x ^ 2 - 2) * (x ^ 2 - 3) = 0 := by
      hole_9
    have h₇₃ : x ^ 2 - 2 = 0 ∨ x ^ 2 - 3 = 0 := by
      hole_10
    hole_8
  
  have h₈ : y ^ 2 = 2 ∨ y ^ 2 = 3 := by
    have h₈₁ : y ^ 4 - 5 * y ^ 2 + 6 = 0 := h₆
    have h₈₂ : (y ^ 2 - 2) * (y ^ 2 - 3) = 0 := by
      hole_14
    have h₈₃ : y ^ 2 - 2 = 0 ∨ y ^ 2 - 3 = 0 := by
      hole_15
    hole_13
  
  have h₉ : x ^ 2 = 2 := by
    hole_18
  
  have h₁₀ : y ^ 2 = 3 := by
    hole_19
  
  have h₁₁ : y ^ 2 - x ^ 2 = 1 := by
    hole_20
  
  hole_1