theorem putnam_2014_b4 (n : ℕ) (P : Polynomial ℂ) (npos : n > 0) (Px : P.degree = (↑n : WithBot ℕ) ∧ ∀ k ∈ Set.Icc 0 n, P.coeff k = 2 ^ (k * (n - k))) : ∀ r ∈ P.roots, r.im = 0 :=
  by
  have h₁ : ∀ (k : ℕ), k ∈ Set.Icc 0 n → (P.coeff k : ℂ).im = 0 := by sorry
  have h₂ : P ≠ 0 := by sorry
  have h₃ : ∀ (r : ℂ), r ∈ P.roots → r.im = 0 := by sorry
  intro r hr
  have h₄ : r.im = 0 := h₃ r hr
  exact h₄