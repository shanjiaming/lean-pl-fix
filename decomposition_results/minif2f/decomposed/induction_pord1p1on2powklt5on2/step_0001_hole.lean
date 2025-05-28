theorem induction_pord1p1on2powklt5on2 (n : ℕ) (h₀ : 0 < n) : ∏ k ∈ Finset.Icc 1 n, 1 + 1 / 2 ^ sorry < 5 / 2 :=
  by
  have h₁ : (∏ k in Finset.Icc 1 n, (1 : ℝ)) = 1 := by sorry
  have h₂ : (1 : ℝ) / (2 : ℝ) ^ k ≤ 1 := by sorry
  have h₃ : (∏ k in Finset.Icc 1 n, (1 : ℝ)) + (1 : ℝ) / (2 : ℝ) ^ k < 5 / 2 := by sorry
  --  simpa [h₁] using h₃
  hole