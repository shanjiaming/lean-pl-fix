theorem polynomial_equivalence_with_trig_condition :
(∀ x : ℝ, eval (Real.cos x) P = eval (Real.sin x) P) →
∃ Q : Polynomial ℝ, ∀ x : ℝ, eval x P = eval (x^4 - x^2) Q :=