theorem polynomial_condition :
(∀ x : ℝ, 16 * eval (x^2) P = (eval (2 * x) P)^2) ↔ ∃ n : ℕ, P = (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ))^n :=