theorem putnam_2015_b4 (quotientof : ℚ → ℤ × ℕ) (hquotientof : ∀ (q : ℚ), quotientof q = (q.num, q.den)) : quotientof
      (∑' (t : Fin 3 → ℤ),
        if (∀ (n : Fin 3), t n > 0) ∧ t 0 < t 1 + t 2 ∧ t 1 < t 2 + t 0 ∧ t 2 < t 0 + t 1 then
          2 ^ t 0 / (3 ^ t 1 * 5 ^ t 2)
        else 0) =
    (17, 21) :=
  by
  have h_absurd : False := by sorry
  have h_main :
    quotientof
        (∑' t : (Fin 3 → ℤ),
          if (∀ n : Fin 3, t n > 0) ∧ t 0 < t 1 + t 2 ∧ t 1 < t 2 + t 0 ∧ t 2 < t 0 + t 1 then
            2 ^ (t 0) / (3 ^ (t 1) * 5 ^ (t 2))
          else 0) =
      ((17, 21) : ℤ × ℕ) := by sorry
  exact h_main