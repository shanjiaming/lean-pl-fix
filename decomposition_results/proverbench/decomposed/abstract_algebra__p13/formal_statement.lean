/-- Main theorem characterizing values of a for which the functional equation
    f(x²) = f(x)² - a has a rational function solution -/
theorem rational_function_equation_solution (a : ℝ) :
  (∃ (f : Polynomial ℚ), ∀ x : ℚ,
    (f.eval (x * x)) = (f.eval x)^2 - a) ↔
  a = 0 ∨ a = 2 :=