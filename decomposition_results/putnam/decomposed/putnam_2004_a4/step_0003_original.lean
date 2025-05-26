theorem h₁ (n : ℕ) (npos : n > 0) (x : Fin n → ℝ) (avals : ℕ → (ℕ → Fin n → ℝ) → Prop) (havals :  ∀ (N : ℕ) (a : ℕ → Fin n → ℝ),    avals N a ↔ ∀ (i : Fin N) (j : Fin n), a (↑i : ℕ) j = -1 ∨ a (↑i : ℕ) j = 0 ∨ a (↑i : ℕ) j = 1) (hx : ¬∏ i, x i = 0) : ∃ k, x k ≠ 0 := by
  by_contra h
  push_neg at h
  have h₂ : ∏ i : Fin n, x i = 0 := by sorry
  contradiction