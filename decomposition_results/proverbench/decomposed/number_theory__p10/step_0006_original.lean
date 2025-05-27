theorem h₄ (α✝ : ℝ) (n✝ : ℕ) (α : ℝ) (hα : Irrational α) (n : ℕ) (hn : 0 < n) (f : ℕ → ℝ := fun k => ↑k * α - ↑(round (↑k * α))) (h : ∀ (i j : ℕ), i < j → j ≤ n → 1 / (↑n + 1) ≤ |f j - f i|) : ∀ (i j : ℕ), i < j → j ≤ n → 1 / (↑n + 1) ≤ |f j - f i| :=
  by
  intro i j hij hjn
  exact h i j hij hjn