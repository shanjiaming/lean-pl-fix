theorem h₄ (p : ℝ → Prop) (hp :  ∀ (c : ℝ),    p c ↔      ∀ (P : ℝ[X]),        P.degree = 3 →          (∃ x ∈ Icc 0 1, eval x P = 0) → ∫ (x : ℝ) in 0 ..1, |eval x P| ≤ c * sSup {y | ∃ x ∈ Icc 0 1, y = |eval x P|}) (h₀ : p (5 / 6)) (c : ℝ) (hc :  ∀ (P : ℝ[X]),    P.degree = 3 →      (∃ x ∈ Icc 0 1, eval x P = 0) → ∫ (x : ℝ) in 0 ..1, |eval x P| ≤ c * sSup {y | ∃ x ∈ Icc 0 1, y = |eval x P|}) (h : ¬5 / 6 ≤ c) (h₂ : c < 5 / 6) : ∃ P,
    P.degree = 3 ∧
      (∃ x ∈ Icc 0 1, eval x P = 0) ∧ ¬∫ (x : ℝ) in 0 ..1, |eval x P| ≤ c * sSup {y | ∃ x ∈ Icc 0 1, y = |eval x P|} :=
  by
  use
    (Polynomial.C (18 / (Real.sqrt 3)) *
      (Polynomial.X * (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C (1 / 2))))
  constructor
  ·
    norm_num [Polynomial.degree_mul, Polynomial.degree_X, Polynomial.degree_sub_le, Polynomial.degree_one,
            Polynomial.degree_C, Polynomial.degree_mul, Polynomial.degree_X, Polynomial.degree_sub_le,
            Polynomial.degree_one, Polynomial.degree_C, Polynomial.degree_mul, Polynomial.degree_X,
            Polynomial.degree_sub_le, Polynomial.degree_one, Polynomial.degree_C] <;>
          ring_nf <;>
        norm_num <;>
      try simp_all [Polynomial.degree_eq_natDegree] <;> norm_num <;> linarith
  · constructor
    · use 0
      constructor
      · norm_num
      ·
        norm_num [Polynomial.eval_mul, Polynomial.eval_sub, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X,
              Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_sub, Polynomial.eval_pow, Polynomial.eval_C,
              Polynomial.eval_X, Polynomial.eval_add] <;>
            ring_nf <;>
          norm_num
    ·
      have h₅ :
        ¬(∫ x in (0)..1,
              |(Polynomial.C (18 / (Real.sqrt 3)) *
                      (Polynomial.X * (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C (1 / 2)))).eval
                  x| ≤
            c *
              (sSup
                {y |
                  ∃ x ∈ Icc 0 1,
                    y =
                      |(Polynomial.C (18 / (Real.sqrt 3)) *
                              (Polynomial.X * (Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C (1 / 2)))).eval
                          x|})) := by sorry
      exact h₅