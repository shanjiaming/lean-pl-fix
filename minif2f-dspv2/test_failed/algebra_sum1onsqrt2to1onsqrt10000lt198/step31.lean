theorem h₅₂ (h₁ : ∀ k ∈ Finset.Icc 2 10000, 1 / √(↑k : ℝ) < 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1))) (h₂ : ∑ k ∈ Finset.Icc 2 10000, 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1)) = 198) (h₅₁ : ∀ k ∈ Finset.Icc 2 10000, 1 / √(↑k : ℝ) < 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1))) : ∑ k ∈ Finset.Icc 2 10000, 1 / √(↑k : ℝ) < ∑ k ∈ Finset.Icc 2 10000, 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1)) :=
  by
  apply Finset.sum_lt_sum_of_nonempty (Finset.nonempty_of_ne_empty (by decide))
  intro k hk
  exact h₅₁ k hk