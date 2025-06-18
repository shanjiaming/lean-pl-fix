macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_76 (f : ℤ → ℤ) (h₀ : ∀ n, Odd n → f n = n ^ 2)
    (h₁ : ∀ n, Even n → f n = n ^ 2 - 4 * n - 1) : f 4 = -1 := by
  have h₂ : Even (4 : ℤ) := by
    hole_2
  
  have h₃ : f 4 = (4 : ℤ) ^ 2 - 4 * (4 : ℤ) - 1 := by
    have h₄ : f 4 = (4 : ℤ) ^ 2 - 4 * (4 : ℤ) - 1 := by
      have h₅ : Even (4 : ℤ) := h₂
      have h₆ : f 4 = (4 : ℤ) ^ 2 - 4 * (4 : ℤ) - 1 := by
        hole_5
      hole_4
    hole_3
  
  have h₄ : f 4 = -1 := by
    hole_6
  
  hole_1