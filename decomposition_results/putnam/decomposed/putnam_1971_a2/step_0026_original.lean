theorem h₂ (P : Polynomial ℝ) (h_main :  (Polynomial.eval 0 P = 0 ∧ ∀ (x : ℝ), Polynomial.eval (x ^ 2 + 1) P = Polynomial.eval x P ^ 2 + 1) →    P ∈ {Polynomial.X}) (h : P ∈ {Polynomial.X}) (h₁ : P = Polynomial.X) : Polynomial.eval 0 P = 0 := by
  rw [h₁]
  simp [Polynomial.eval_X]