theorem rational_function_equation_solution (a : ℝ) :
  (∃ (f : Polynomial ℚ), ∀ x : ℚ, (f.eval (x * x)) = (f.eval x) ^ 2 - a) ↔ a = 0 ∨ a = 2:=
  by
  have h₁ : (∃ (f : Polynomial ℚ), ∀ x : ℚ, (f.eval (x * x)) = (f.eval x) ^ 2 - a) → a = 0 ∨ a = 2:= by -- sorry
    hole
  have h₂ : (a = 0 ∨ a = 2) → (∃ (f : Polynomial ℚ), ∀ x : ℚ, (f.eval (x * x)) = (f.eval x) ^ 2 - a):= by -- sorry
    hole
  --  exact ⟨h₁, h₂⟩
  hole