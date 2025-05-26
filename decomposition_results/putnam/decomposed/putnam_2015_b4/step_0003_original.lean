theorem h_main (quotientof : ℚ → ℤ × ℕ) (hquotientof : ∀ (q : ℚ), quotientof q = (q.num, q.den)) (h_absurd : False) : quotientof
      (∑' (t : Fin 3 → ℤ),
        if (∀ (n : Fin 3), t n > 0) ∧ t 0 < t 1 + t 2 ∧ t 1 < t 2 + t 0 ∧ t 2 < t 0 + t 1 then
          2 ^ t 0 / (3 ^ t 1 * 5 ^ t 2)
        else 0) =
    (17, 21) :=
  by
  exfalso
  exact h_absurd