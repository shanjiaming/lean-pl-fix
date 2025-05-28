theorem h₂ (a : ℕ → ℕ → ℝ) (ha : ∀ (i j : ℕ), a i j ∈ Icc 0 1) (m n : ℕ) (mnpos : m > 0 ∧ n > 0) (h₁ : ∀ i ∈ Finset.Icc 1 n, ∑ j ∈ Finset.Icc 1 (m * i), a i j ≤ ↑m * ↑i) : ∀ i ∈ Finset.Icc 1 n, ∑ j ∈ Finset.Icc 1 (m * i), a i j / ↑i ≤ ↑m :=
  by
  intro i hi
  have h₃ : (∑ j in Finset.Icc 1 (m * i), a i j / i) = (∑ j in Finset.Icc 1 (m * i), a i j) / i := by sorry
  rw [h₃]
  have h₄ : (∑ j in Finset.Icc 1 (m * i), a i j) ≤ m * i := by sorry
  have h₅ : (i : ℝ) ≥ 1 := by sorry
  have h₆ : (∑ j in Finset.Icc 1 (m * i), a i j : ℝ) / i ≤ m := by sorry
  exact h₆