theorem h₁₁₀ (k : ℕ) (hk : k ∈ Finset.Icc 2 10000) (h₂ : 2 ≤ k ∧ k ≤ 10000) (h₃ : (↑k : ℝ) ≥ 2) (h₄ : (↑k : ℝ) ≤ 10000) (h₅ : (↑k : ℝ) - 1 ≥ 1) (h₆ : √(↑k : ℝ) ≥ 0) (h₇ : √((↑k : ℝ) - 1) ≥ 0) (h₈ : √(↑k : ℝ) > 0) (h₉ : √((↑k : ℝ) - 1) > 0) (h₁₀₁ : √(↑k : ℝ) > √((↑k : ℝ) - 1)) (h₁₀₂ : √(↑k : ℝ) - √((↑k : ℝ) - 1) > 0) (h₁₀₃ : 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1)) > 0) (h₁₀₄ : (√(↑k : ℝ) - √((↑k : ℝ) - 1)) * (√(↑k : ℝ) + √((↑k : ℝ) - 1)) = 1) (h₁₀₅ : √(↑k : ℝ) + √((↑k : ℝ) - 1) > 0) (h₁₀₉ : √(↑k : ℝ) - √((↑k : ℝ) - 1) = 1 / (√(↑k : ℝ) + √((↑k : ℝ) - 1))) : 1 / √(↑k : ℝ) < 2 * (1 / (√(↑k : ℝ) + √((↑k : ℝ) - 1))) :=
  by
  have h₁₁₁ : 0 < Real.sqrt k + Real.sqrt ((k : ℝ) - 1) := by sorry
  have h₁₁₂ : 0 < Real.sqrt k * (Real.sqrt k + Real.sqrt ((k : ℝ) - 1)) := by sorry
  field_simp [h₁₁₁.ne']
  rw [div_lt_div_iff (by positivity) (by positivity)]
  nlinarith [Real.sq_sqrt (show 0 ≤ (k : ℝ) by linarith), Real.sq_sqrt (show 0 ≤ (k : ℝ) - 1 by linarith),
    mul_nonneg h₆ h₇, h₈.le, h₉.le]