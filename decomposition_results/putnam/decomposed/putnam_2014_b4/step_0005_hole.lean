theorem h₂ (n : ℕ) (P : Polynomial ℂ) (npos : n > 0) (Px : P.degree = ↑n ∧ ∀ k ∈ Set.Icc 0 n, P.coeff k = 2 ^ (k * (n - k))) (h₁ : ∀ k ∈ Set.Icc 0 n, (P.coeff k).im = 0) : P ≠ 0 := by
  have h₃ : P.degree = n := Px.1
  have h₄ : 0 < n := npos
  have h₅ : P ≠ 0 := by sorry
  --  exact h₅
  hole