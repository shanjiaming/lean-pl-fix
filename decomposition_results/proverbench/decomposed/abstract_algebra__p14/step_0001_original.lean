theorem polynomial_evaluation_modulo_property  : (∀ i ≤ sorry, sorry = i % 2) ∧ (sorry % 2 = 1 → sorry = 2 ^ sorry) ∧ (sorry % 2 = 0 → sorry = 1 - 2 ^ sorry) :=
  by
  have h₁ : (∀ i : ℕ, i ≤ n → P.eval (i : ℤ) = i % 2) := by sorry
  have h₂ : (n % 2 = 1 → P.eval ((n + 1 : ℕ) : ℤ) = 2 ^ n) := by sorry
  have h₃ : (n % 2 = 0 → P.eval ((n + 1 : ℕ) : ℤ) = 1 - 2 ^ n) := by sorry
  refine' ⟨h₁, ⟨h₂, h₃⟩⟩