theorem h₁ (P Q : Polynomial ℂ) (hQ : Q.natDegree = 2) (hP :  ∀ (x : ℂ),    Polynomial.eval x P =      Polynomial.eval x Q * Polynomial.eval x ((⇑Polynomial.derivative : Polynomial ℂ → Polynomial ℂ)^[2] P)) (h : ∃ x1 x2, x1 ≠ x2 ∧ Polynomial.eval x1 P = 0 ∧ Polynomial.eval x2 P = 0) : P = 0 ∨ P ≠ 0 := by
  by_cases h₂ : P = 0
  · exact Or.inl h₂
  · exact Or.inr h₂