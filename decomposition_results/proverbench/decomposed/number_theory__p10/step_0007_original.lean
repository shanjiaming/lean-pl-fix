theorem h₅ (α : ℝ) (hα : Irrational α) (n : ℕ) (hn : 0 < n) (f : ℕ → ℝ := fun k => (↑k : ℝ) * α - (↑(round ((↑k : ℝ) * α)) : ℝ)) (h : ∀ (i j : ℕ), i < j → j ≤ n → 1 / ((↑n : ℝ) + 1) ≤ |f j - f i|) (h₄ : ∀ (i j : ℕ), i < j → j ≤ n → 1 / ((↑n : ℝ) + 1) ≤ |f j - f i|) : ∀ k ≤ n, f k = (↑k : ℝ) * α - (↑(round ((↑k : ℝ) * α)) : ℝ) :=
  by
  intro k hk
  rfl