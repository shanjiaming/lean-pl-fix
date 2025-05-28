theorem h₃ (a : ℕ → ℕ → ℝ) (ha : ∀ (i j : ℕ), a i j ∈ Icc 0 1) (m n : ℕ) (mnpos : m > 0 ∧ n > 0) (h₁ : ∀ i ∈ Finset.Icc 1 n, ∑ j ∈ Finset.Icc 1 (m * i), a i j ≤ ↑m * ↑i) (h₂ : ∀ i ∈ Finset.Icc 1 n, ∑ j ∈ Finset.Icc 1 (m * i), a i j / ↑i ≤ ↑m) : ∑ i ∈ Finset.Icc 1 n, ∑ j ∈ Finset.Icc 1 (m * i), a i j / ↑i ≤ ↑m * ↑n :=
  by
  have h₄ : ∀ i ∈ Finset.Icc 1 n, (∑ j in Finset.Icc 1 (m * i), a i j / i) ≤ m := by sorry
  calc
    (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ≤ ∑ i in Finset.Icc 1 n, (m : ℝ) :=
      by
      apply Finset.sum_le_sum
      intro i hi
      exact h₄ i hi
    _ = ∑ i in Finset.Icc 1 n, (m : ℝ) := by rfl
    _ = (n : ℝ) * m := by
      simp [Finset.sum_const, Finset.card_range] <;> ring_nf <;> norm_cast <;> field_simp <;> ring_nf <;> norm_cast
    _ = m * n := by ring <;> norm_num <;> linarith