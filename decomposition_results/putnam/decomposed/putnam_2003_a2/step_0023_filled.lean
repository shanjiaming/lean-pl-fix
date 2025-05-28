theorem h₆ (n : ℕ) (hn : 0 < n) (a b : Fin n → ℝ) (abnneg : ∀ (i : Fin n), a i ≥ 0 ∧ b i ≥ 0) (h₁ : ¬∏ i, a i = 0) (h₂ : ¬∏ i, b i = 0) (h₃ : ∀ (i : Fin n), a i > 0) (h₄ : ∀ (i : Fin n), b i > 0) (h₅ : ∀ (i : Fin n), a i + b i > 0) : ∏ i, a i > 0 := by
  --  apply Finset.prod_pos
  --  intro i _
  --  exact h₃ i
  hole