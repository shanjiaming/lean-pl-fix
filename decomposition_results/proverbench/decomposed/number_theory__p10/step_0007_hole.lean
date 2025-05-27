theorem h₅ (α✝ : ℝ) (n✝ : ℕ) (α : ℝ) (hα : Irrational α) (n : ℕ) (hn : 0 < n) (f : ℕ → ℝ := fun k => ↑k * α - ↑(round (↑k * α))) (h : ∀ (i j : ℕ), i < j → j ≤ n → 1 / (↑n + 1) ≤ |f j - f i|) (h₄ : ∀ (i j : ℕ), i < j → j ≤ n → 1 / (↑n + 1) ≤ |f j - f i|) : ∀ k ≤ n, f k = ↑k * α - ↑(round (↑k * α)) :=
  by
  intro k hk
  rfl
  hole