theorem putnam_2022_b1
    (P : Polynomial ℤ)
    (b : ℕ → ℝ)
    (Pconst : P.coeff 0 = 0)
    (Podd : Odd (P.coeff 1))
    (hB : ∀ x : ℝ, HasSum (fun i => b i * x ^ i) (Real.exp (aeval x P))) :
    ∀ k : ℕ, b k ≠ 0 :=
  by