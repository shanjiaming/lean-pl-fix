theorem h_iff (h_main :  ∀ (P : Polynomial ℤ),    (∀ (n : ℕ), P.coeff n = 0 ∨ P.coeff n = 1) →      (∃ Q R, Q.degree > 0 ∧ R.degree > 0 ∧ P = Q * R) →        Polynomial.eval 2 P ≠ 0 ∧ Polynomial.eval 2 P ≠ 1 ∧ ¬_root_.Prime (Polynomial.eval 2 P)) : (∀ (P : Polynomial ℤ),
      (∀ (n : ℕ), P.coeff n = 0 ∨ P.coeff n = 1) →
        (∃ Q R, Q.degree > 0 ∧ R.degree > 0 ∧ P = Q * R) →
          Polynomial.eval 2 P ≠ 0 ∧ Polynomial.eval 2 P ≠ 1 ∧ ¬_root_.Prime (Polynomial.eval 2 P)) ↔
    True :=
  by
  apply Iff.intro
  · intro h
    trivial
  · intro h
    exact h_main