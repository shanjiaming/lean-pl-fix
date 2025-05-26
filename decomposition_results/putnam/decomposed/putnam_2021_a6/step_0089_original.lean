theorem h₂₅ (P : Polynomial ℤ) (h_coeff : ∀ (n : ℕ), P.coeff n = 0 ∨ P.coeff n = 1) (h_factor : ∃ Q R, Q.degree > 0 ∧ R.degree > 0 ∧ P = Q * R) (h₁ : Polynomial.eval 2 P ≠ 0) (h₂ : Polynomial.eval 2 P ≠ 1) (h₃ h₄ : _root_.Prime (Polynomial.eval 2 P)) (Q R : Polynomial ℤ) (hQ : Q.degree > 0) (hR : R.degree > 0) (hP : P = Q * R) (h₆ : Polynomial.eval 2 P = Polynomial.eval 2 Q * Polynomial.eval 2 R) (h₇ : Polynomial.eval 2 Q ∣ Polynomial.eval 2 P) (h₈ : Polynomial.eval 2 R ∣ Polynomial.eval 2 P) (h₉ :  Polynomial.eval 2 Q = 1 ∨    Polynomial.eval 2 Q = -1 ∨ Polynomial.eval 2 Q = Polynomial.eval 2 P ∨ Polynomial.eval 2 Q = -Polynomial.eval 2 P) (h₁₀ :  Polynomial.eval 2 R = 1 ∨    Polynomial.eval 2 R = -1 ∨ Polynomial.eval 2 R = Polynomial.eval 2 P ∨ Polynomial.eval 2 R = -Polynomial.eval 2 P) (h₁₂ : Q.degree > 0) (h₁₃ : R.degree > 0) (h₁₄ :  Polynomial.eval 2 Q = 1 ∨    Polynomial.eval 2 Q = -1 ∨ Polynomial.eval 2 Q = Polynomial.eval 2 P ∨ Polynomial.eval 2 Q = -Polynomial.eval 2 P) (h₁₅ :  Polynomial.eval 2 R = 1 ∨    Polynomial.eval 2 R = -1 ∨ Polynomial.eval 2 R = Polynomial.eval 2 P ∨ Polynomial.eval 2 R = -Polynomial.eval 2 P) (h₁₆ : Polynomial.eval 2 Q ≠ 1) (h₁₇ h₁₈ : Polynomial.eval 2 Q = -1) (h₂₀ h₂₂ : Q.degree > 0) (h₂₃ h₂₄ : Polynomial.eval 2 Q = -1) : Q.degree ≤ 0 := by
  apply
      Polynomial.degree_le_of_ne_zero_of_eval₂_eq_zero _ _
        (by
          simp_all [Polynomial.eval₂_eq_eval_map, Polynomial.map_mul, Polynomial.map_add, Polynomial.map_sub,
                  Polynomial.map_one, Polynomial.map_zero] <;>
                ring_nf at * <;>
              norm_num at * <;>
            omega) <;>
    norm_num