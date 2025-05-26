theorem h_main (n : ℤ) (ng1 : n > 1) : (3 * (↑n : ℝ) + 1) / (2 * (↑n : ℝ) + 2) < ∑ i, ((↑(↑i : ℤ) : ℝ) / (↑n : ℝ)) ^ (↑n : ℝ) ∧
    ∑ i, ((↑(↑i : ℤ) : ℝ) / (↑n : ℝ)) ^ (↑n : ℝ) < 2 :=
  by
  have h₂ : n ≥ 2 := by sorry
  have h₃ : (n : ℤ) ≥ 2 := by sorry
  have h₄ : (n : ℝ) ≥ 2 := by sorry
  have h₅ : (3 * (n : ℝ) + 1) / (2 * n + 2) < ∑ i : Finset.Icc 1 n, ((i : ℝ) / n) ^ (n : ℝ) := by sorry
  have h₆ : ∑ i : Finset.Icc 1 n, ((i : ℝ) / n) ^ (n : ℝ) < 2 := by sorry
  --  exact ⟨h₅, h₆⟩
  hole