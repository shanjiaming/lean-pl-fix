theorem h₁₀ (k : ℕ) (hk : k ∈ Finset.Icc 2 10000) (h₂ : 2 ≤ k ∧ k ≤ 10000) (h₃ : (↑k : ℝ) ≥ 2) (h₄ : (↑k : ℝ) ≤ 10000) (h₅ : (↑k : ℝ) - 1 ≥ 1) (h₆ : √(↑k : ℝ) ≥ 0) (h₇ : √((↑k : ℝ) - 1) ≥ 0) (h₈ : √(↑k : ℝ) > 0) (h₉ : √((↑k : ℝ) - 1) > 0) : 1 / √(↑k : ℝ) < 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1)) :=
  by
  have h₁₀₁ : Real.sqrt k > Real.sqrt ((k : ℝ) - 1) := by sorry
  have h₁₀₂ : Real.sqrt k - Real.sqrt ((k : ℝ) - 1) > 0 := by sorry
  have h₁₀₃ : 2 * (Real.sqrt k - Real.sqrt ((k : ℝ) - 1)) > 0 := by sorry
  have h₁₀₄ : (Real.sqrt k - Real.sqrt ((k : ℝ) - 1)) * (Real.sqrt k + Real.sqrt ((k : ℝ) - 1)) = 1 := by sorry
  have h₁₀₅ : (Real.sqrt k + Real.sqrt ((k : ℝ) - 1)) > 0 := by sorry
  have h₁₀₆ : 2 * (Real.sqrt k - Real.sqrt ((k : ℝ) - 1)) > 1 / Real.sqrt k := by sorry
  linarith