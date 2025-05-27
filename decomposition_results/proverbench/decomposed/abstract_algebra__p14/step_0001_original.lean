theorem polynomial_evaluation_modulo_property (P : Polynomial ℤ) (n : ℕ) (hn : P.natDegree = n) : (∀ i ≤ n, Polynomial.eval (↑i) P = ↑i % 2) ∧
    (n % 2 = 1 → Polynomial.eval (↑(n + 1)) P = 2 ^ n) ∧ (n % 2 = 0 → Polynomial.eval (↑(n + 1)) P = 1 - 2 ^ n) :=
  by
  have h₁ : (∀ i : ℕ, i ≤ n → P.eval (i : ℤ) = i % 2) := by sorry
  have h₂ : (n % 2 = 1 → P.eval ((n + 1 : ℕ) : ℤ) = 2 ^ n) := by sorry
  have h₃ : (n % 2 = 0 → P.eval ((n + 1 : ℕ) : ℤ) = 1 - 2 ^ n) := by sorry
  refine' ⟨h₁, ⟨h₂, h₃⟩⟩