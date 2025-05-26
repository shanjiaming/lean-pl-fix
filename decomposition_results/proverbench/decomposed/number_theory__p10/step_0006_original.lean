theorem h₄ (α : ℝ) (hα : Irrational α) (n : ℕ) (hn : 0 < n) (f : ℕ → ℝ := fun k => (↑k : ℝ) * α - (↑(round ((↑k : ℝ) * α)) : ℝ)) (h : ∀ (i j : ℕ), i < j → j ≤ n → 1 / ((↑n : ℝ) + 1) ≤ |f j - f i|) : ∀ (i j : ℕ), i < j → j ≤ n → 1 / ((↑n : ℝ) + 1) ≤ |f j - f i| :=
  by
  intro i j hij hjn
  exact h i j hij hjn