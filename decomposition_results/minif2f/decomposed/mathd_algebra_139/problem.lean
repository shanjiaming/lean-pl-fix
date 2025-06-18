theorem mathd_algebra_139 (s : ℝ → ℝ → ℝ)
    (h₀ : ∀ (x) (_ : x ≠ 0), ∀ (y) (_ : y ≠ 0), s x y = (1 / y - 1 / x) / (x - y)) :
    s 3 11 = 1 / 33 := by
  have h₁ : s 3 11 = (1 / (11 : ℝ) - 1 / (3 : ℝ)) / ((3 : ℝ) - 11) := by
    have h₁₀ : (3 : ℝ) ≠ 0 := by norm_num
    have h₁₁ : (11 : ℝ) ≠ 0 := by norm_num
    have h₁₂ : s (3 : ℝ) (11 : ℝ) = (1 / (11 : ℝ) - 1 / (3 : ℝ)) / ((3 : ℝ) - 11) := by
      apply h₀
      <;> norm_num
    exact h₁₂
  
  have h₂ : s 3 11 = 1 / 33 := by
    rw [h₁]
    norm_num [div_eq_mul_inv, mul_assoc]
    <;> field_simp
    <;> ring
    <;> norm_num
  
  apply h₂