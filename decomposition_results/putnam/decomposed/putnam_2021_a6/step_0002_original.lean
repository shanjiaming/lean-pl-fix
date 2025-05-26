theorem h_main  : ∀ (P : Polynomial ℤ),
    (∀ (n : ℕ), P.coeff n = 0 ∨ P.coeff n = 1) →
      (∃ Q R, Q.degree > 0 ∧ R.degree > 0 ∧ P = Q * R) →
        Polynomial.eval 2 P ≠ 0 ∧ Polynomial.eval 2 P ≠ 1 ∧ ¬_root_.Prime (Polynomial.eval 2 P) :=
  by
  intro P h_coeff h_factor
  have h₁ : P.eval 2 ≠ 0 := by sorry
  have h₂ : P.eval 2 ≠ 1 := by sorry
  have h₃ : ¬Prime (P.eval 2) := by sorry
  exact ⟨h₁, h₂, h₃⟩