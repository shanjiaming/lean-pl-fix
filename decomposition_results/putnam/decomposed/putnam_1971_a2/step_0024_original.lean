theorem h_trivial (P : Polynomial ℝ) (h_main :  (Polynomial.eval 0 P = 0 ∧ ∀ (x : ℝ), Polynomial.eval (x ^ 2 + 1) P = Polynomial.eval x P ^ 2 + 1) →    P ∈ {Polynomial.X}) : P ∈ {Polynomial.X} → Polynomial.eval 0 P = 0 ∧ ∀ (x : ℝ), Polynomial.eval (x ^ 2 + 1) P = Polynomial.eval x P ^ 2 + 1 :=
  by
  intro h
  have h₁ : P = Polynomial.X := by sorry
  have h₂ : P.eval 0 = 0 := by sorry
  have h₃ : ∀ x : ℝ, P.eval (x ^ 2 + 1) = (P.eval x) ^ 2 + 1 := by sorry
  exact ⟨h₂, h₃⟩