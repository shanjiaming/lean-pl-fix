macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem sum_of_squares_ge_sum_of_products (a b c : ℝ) :
    a^2 + b^2 + c^2 ≥ a * b + b * c + c * a := by
  have h₁ : 0 ≤ (a - b)^2 + (b - c)^2 + (c - a)^2 := by
    hole_2
  
  have h₂ : (a - b)^2 + (b - c)^2 + (c - a)^2 = 2 * (a^2 + b^2 + c^2 - (a * b + b * c + c * a)) := by
    hole_3
  
  have h₃ : 0 ≤ 2 * (a^2 + b^2 + c^2 - (a * b + b * c + c * a)) := by
    hole_4
  
  have h₄ : 0 ≤ a^2 + b^2 + c^2 - (a * b + b * c + c * a) := by
    hole_5
  
  have h₅ : a * b + b * c + c * a ≤ a^2 + b^2 + c^2 := by
    hole_6
  
  hole_1