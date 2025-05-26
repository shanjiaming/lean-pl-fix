theorem h₂ (n : ℕ) (P : Polynomial ℂ) (npos : n > 0) (Px : P.degree = (↑n : WithBot ℕ) ∧ ∀ k ∈ Set.Icc 0 n, P.coeff k = 2 ^ (k * (n - k))) (k : ℕ) (hk : k ∈ Set.Icc 0 n) : P.coeff k = 2 ^ (k * (n - k)) :=
  by
  have h₃ : P.coeff k = (2 : ℂ) ^ (k * (n - k)) := by sorry
  --  exact h₃
  simpa