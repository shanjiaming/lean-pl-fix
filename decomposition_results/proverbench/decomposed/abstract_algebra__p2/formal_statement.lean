theorem polynomial_identity_cos_sin_to_poly (h : ∀ x, Polynomial.eval (Real.cos x) P = Polynomial.eval (Real.sin x) P) :
∃ Q : Polynomial ℝ, ∀ x, Polynomial.eval x P = Polynomial.eval (x^4 - x^2) Q :=