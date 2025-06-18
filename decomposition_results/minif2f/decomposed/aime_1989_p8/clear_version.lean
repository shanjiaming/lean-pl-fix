macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem aime_1989_p8 (a b c d e f g : ℝ)
    (h₀ : a + 4 * b + 9 * c + 16 * d + 25 * e + 36 * f + 49 * g = 1)
    (h₁ : 4 * a + 9 * b + 16 * c + 25 * d + 36 * e + 49 * f + 64 * g = 12)
    (h₂ : 9 * a + 16 * b + 25 * c + 36 * d + 49 * e + 64 * f + 81 * g = 123) :
    16 * a + 25 * b + 36 * c + 49 * d + 64 * e + 81 * f + 100 * g = 334 := by
  have h_sum : a + b + c + d + e + f + g = 50 := by
    have h₃ : 3 * a + 5 * b + 7 * c + 9 * d + 11 * e + 13 * f + 15 * g = 11 := by
      hole_3
    have h₄ : 5 * a + 7 * b + 9 * c + 11 * d + 13 * e + 15 * f + 17 * g = 111 := by
      hole_4
    have h₅ : 2 * (a + b + c + d + e + f + g) = 100 := by
      hole_5
    hole_2
  
  have h_T : 16 * a + 25 * b + 36 * c + 49 * d + 64 * e + 81 * f + 100 * g = 334 := by
    have h₃ : 16 * a + 25 * b + 36 * c + 49 * d + 64 * e + 81 * f + 100 * g = 334 := by
      
      have h₄ : 16 * a + 25 * b + 36 * c + 49 * d + 64 * e + 81 * f + 100 * g = (a + 4 * b + 9 * c + 16 * d + 25 * e + 36 * f + 49 * g) - 3 * (4 * a + 9 * b + 16 * c + 25 * d + 36 * e + 49 * f + 64 * g) + 3 * (9 * a + 16 * b + 25 * c + 36 * d + 49 * e + 64 * f + 81 * g) := by
        hole_8
      hole_7
    hole_6
  
  hole_1