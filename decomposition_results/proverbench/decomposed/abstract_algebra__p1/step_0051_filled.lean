theorem h_final (P : Polynomial ℤ) (h : ∃ a b c, a ≠ b ∧ b ≠ c ∧ a ≠ c ∧ Polynomial.eval a P = 1 ∧ Polynomial.eval b P = -1 ∧ Polynomial.eval c P = 1) (h_main : ∀ (z : ℤ), Polynomial.eval z P = 0 → False) : ¬∃ z, Polynomial.eval z P = 0 := by
  --  intro h_contra
  --  rcases h_contra with ⟨z, hz⟩
  have h₁ : False := h_main z hz
  --  exact h₁
  hole