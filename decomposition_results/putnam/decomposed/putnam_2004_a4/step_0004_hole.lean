theorem h₂ (n : ℕ) (npos : n > 0) (x : Fin n → ℝ) (avals : ℕ → (ℕ → Fin n → ℝ) → Prop) (havals :  ∀ (N : ℕ) (a : ℕ → Fin n → ℝ),    avals N a ↔ ∀ (i : Fin N) (j : Fin n), a (↑i : ℕ) j = -1 ∨ a (↑i : ℕ) j = 0 ∨ a (↑i : ℕ) j = 1) (hx : ¬∏ i, x i = 0) (h : ∀ (k : Fin n), x k = 0) : ∏ i, x i = 0 :=
  by
  --  apply Finset.prod_eq_zero (Finset.mem_univ (⟨0, npos⟩ : Fin n))
  --  simpa using h ⟨0, npos⟩
  hole