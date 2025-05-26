theorem putnam_2021_a6 :
  (∀ P,
      (∀ n : ℕ, P.coeff n = 0 ∨ P.coeff n = 1) →
        (∃ Q R : Polynomial ℤ, Q.degree > 0 ∧ R.degree > 0 ∧ P = Q * R) →
          (P.eval 2 ≠ 0 ∧ P.eval 2 ≠ 1 ∧ ¬Prime (P.eval 2))) ↔
    ((True) : Prop):=
  by
  have h_main :
    (∀ P,
      (∀ n : ℕ, P.coeff n = 0 ∨ P.coeff n = 1) →
        (∃ Q R : Polynomial ℤ, Q.degree > 0 ∧ R.degree > 0 ∧ P = Q * R) →
          (P.eval 2 ≠ 0 ∧ P.eval 2 ≠ 1 ∧ ¬Prime (P.eval 2))) := by sorry
  have h_iff :
    (∀ P,
        (∀ n : ℕ, P.coeff n = 0 ∨ P.coeff n = 1) →
          (∃ Q R : Polynomial ℤ, Q.degree > 0 ∧ R.degree > 0 ∧ P = Q * R) →
            (P.eval 2 ≠ 0 ∧ P.eval 2 ≠ 1 ∧ ¬Prime (P.eval 2))) ↔
      True := by sorry
  --  exact h_iff
  hole