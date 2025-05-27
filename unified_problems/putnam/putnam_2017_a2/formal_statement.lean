theorem putnam_2017_a2
    (Q : ℕ → RatFunc ℚ)
    (hQbase : Q 0 = 1 ∧ Q 1 = (X : ℚ[X]))
    (hQn : ∀ n, Q (n + 2) = (Q (n + 1) ^ 2 - 1) / Q n)
    (n : ℕ) (hn : 0 < n) :
    ∃ P : ℤ[X], Q n = P.map (Int.castRingHom ℚ) :=
  by