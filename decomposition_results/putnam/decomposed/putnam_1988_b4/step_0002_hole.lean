theorem h₁ (a : ℕ → ℝ) (IsPosConv : (ℕ → ℝ) → Prop) (IsPosConv_def : ∀ (a' : ℕ → ℝ), IsPosConv a' ↔ (∀ n ≥ 1, a' n > 0) ∧ ∃ s, sorry) (h : IsPosConv a) : (∀ n ≥ 1, a n > 0) ∧ ∃ s, sorry :=
  by
  --  rw [IsPosConv_def] at h
  --  exact h
  hole