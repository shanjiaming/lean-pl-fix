macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem rational_function_equation_solution (a : ℝ) :
  (∃ (f : Polynomial ℚ), ∀ x : ℚ,
    (f.eval (x * x)) = (f.eval x)^2 - a) ↔
  a = 0 ∨ a = 2 := by
  have h₁ : (∃ (f : Polynomial ℚ), ∀ x : ℚ, (f.eval (x * x)) = (f.eval x)^2 - a) → a = 0 ∨ a = 2 := by
    hole_2
  have h₂ : (a = 0 ∨ a = 2) → (∃ (f : Polynomial ℚ), ∀ x : ℚ, (f.eval (x * x)) = (f.eval x)^2 - a) := by
    hole_3
  hole_1