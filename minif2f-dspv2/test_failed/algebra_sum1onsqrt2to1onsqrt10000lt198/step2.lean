theorem h₁  : ∀ k ∈ Finset.Icc 2 10000, 1 / √(↑k : ℝ) < 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1)) :=
  by
  intro k hk
  have h₂ : 2 ≤ k ∧ k ≤ 10000 := by sorry
  have h₃ : (k : ℝ) ≥ 2 := by sorry
  have h₄ : (k : ℝ) ≤ 10000 := by sorry
  have h₅ : (k : ℝ) - 1 ≥ 1 := by sorry
  have h₆ : Real.sqrt (k : ℝ) ≥ 0 := Real.sqrt_nonneg _
  have h₇ : Real.sqrt ((k : ℝ) - 1) ≥ 0 := Real.sqrt_nonneg _
  have h₈ : Real.sqrt (k : ℝ) > 0 := Real.sqrt_pos.mpr (by linarith)
  have h₉ : Real.sqrt ((k : ℝ) - 1) > 0 := Real.sqrt_pos.mpr (by linarith)
  have h₁₀ : (1 : ℝ) / Real.sqrt k < 2 * (Real.sqrt k - Real.sqrt (k - 1)) := by sorry
  exact h₁₀