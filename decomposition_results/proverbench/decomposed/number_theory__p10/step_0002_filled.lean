theorem h_main (α : ℝ) (hα : Irrational α) (n : ℕ) (hn : 0 < n) : ∃ k p, 0 < k ∧ k ≤ n ∧ |(↑k : ℝ) * α - (↑p : ℝ)| < 1 / ((↑n : ℝ) + 1) :=
  by
  have h₁ : ∃ (k : ℕ) (p : ℤ), 0 < k ∧ k ≤ n ∧ |(k : ℝ) * α - p| < 1 / (n + 1 : ℝ) := by sorry
  --  exact h₁
  hole