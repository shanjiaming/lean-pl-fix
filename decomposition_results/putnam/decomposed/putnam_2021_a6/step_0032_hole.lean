theorem h₁₃ (P : Polynomial ℤ) (h_coeff : ∀ (n : ℕ), P.coeff n = 0 ∨ P.coeff n = 1) (h_factor : ∃ Q R, Q.degree > 0 ∧ R.degree > 0 ∧ P = Q * R) (h₁ : Polynomial.eval 2 P ≠ 0) (h h₃ : Polynomial.eval 2 P = 1) (Q R : Polynomial ℤ) (hQ : Q.degree > 0) (hR : R.degree > 0) (hP : P = Q * R) (h₅ : 1 = Polynomial.eval 2 Q * Polynomial.eval 2 R) (h₆ : Polynomial.eval 2 Q = 1 ∨ Polynomial.eval 2 Q = -1) (h₈ : (Polynomial.eval 2 R).natAbs ∣ Int.natAbs 1) (h₁₀ : (Polynomial.eval 2 R).natAbs ∣ 1) (h₁₁ : (Polynomial.eval 2 R).natAbs = 1) : Polynomial.eval 2 R = 1 ∨ Polynomial.eval 2 R = -1 :=
  by
  --  rw [← Int.ofNat_inj] at h₁₁
  have h₁₄ : (R.eval 2 : ℤ) = 1 ∨ (R.eval 2 : ℤ) = -1 := by sorry
  --  exact h₁₄
  hole