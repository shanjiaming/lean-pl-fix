theorem h₁ (P : Polynomial ℤ) (h_coeff : ∀ (n : ℕ), P.coeff n = 0 ∨ P.coeff n = 1) (h_factor : ∃ Q R, Q.degree > 0 ∧ R.degree > 0 ∧ P = Q * R) : Polynomial.eval 2 P ≠ 0 := by
  by_contra h
  have h₂ : P.eval 2 = 0 := by sorry
  have h₃ : (∃ (Q R : Polynomial ℤ), Q.degree > 0 ∧ R.degree > 0 ∧ P = Q * R) := h_factor
  rcases h₃ with ⟨Q, R, hQ, hR, hP⟩
  have h₄ : P.eval 2 = (Q.eval 2) * (R.eval 2) := by sorry
  rw [h₂] at h₄
  have h₅ : (Q.eval 2 : ℤ) ≠ 0 := by sorry
  have h₆ : (R.eval 2 : ℤ) ≠ 0 := by sorry
  have h₇ : (Q.eval 2 : ℤ) * (R.eval 2 : ℤ) ≠ 0 := by sorry
  simp_all