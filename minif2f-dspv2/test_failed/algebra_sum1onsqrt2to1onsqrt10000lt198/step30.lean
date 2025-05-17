theorem h₅₁ (h₁ : ∀ k ∈ Finset.Icc 2 10000, 1 / √(↑k : ℝ) < 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1))) (h₂ : ∑ k ∈ Finset.Icc 2 10000, 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1)) = 198) : ∀ k ∈ Finset.Icc 2 10000, 1 / √(↑k : ℝ) < 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1)) :=
  by
  intro k hk
  exact h₁ k hk