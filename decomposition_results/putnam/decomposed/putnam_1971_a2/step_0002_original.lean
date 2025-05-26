theorem h_main (P : Polynomial ℝ) : (Polynomial.eval 0 P = 0 ∧ ∀ (x : ℝ), Polynomial.eval (x ^ 2 + 1) P = Polynomial.eval x P ^ 2 + 1) →
    P ∈ {Polynomial.X} :=
  by
  intro h
  have h₁ : P.eval 0 = 0 := h.1
  have h₂ : ∀ x : ℝ, P.eval (x ^ 2 + 1) = (P.eval x) ^ 2 + 1 := h.2
  have h₃ : P = Polynomial.X := by sorry
  have h₆ : P ∈ ({ Polynomial.X } : Set (Polynomial ℝ)) := by sorry
  exact h₆