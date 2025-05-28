theorem h₁ (a : ℕ → ℕ → ℝ) (ha : ∀ (i j : ℕ), a i j ∈ Icc 0 1) (m n : ℕ) (mnpos : m > 0 ∧ n > 0) : ∀ i ∈ Finset.Icc 1 n, ∑ j ∈ Finset.Icc 1 (m * i), a i j ≤ ↑m * ↑i :=
  by
  --  intro i hi
  have h₂ : ∀ j ∈ Finset.Icc 1 (m * i), a i j ≤ 1 := by sorry
  have h₃ : ∑ j in Finset.Icc 1 (m * i), a i j ≤ ∑ j in Finset.Icc 1 (m * i), (1 : ℝ) := by sorry
  have h₄ : ∑ j in Finset.Icc 1 (m * i), (1 : ℝ) = (m * i : ℝ) := by sorry
  have h₅ : ∑ j in Finset.Icc 1 (m * i), a i j ≤ (m * i : ℝ) := by sorry
  have h₆ : (m * i : ℝ) = (m * i : ℝ) := rfl
  --  exact by simpa [h₆] using h₅
  hole