theorem h₃₆ (x : NNReal) (h₀ : √(60 * (↑x : ℝ)) * √(12 * (↑x : ℝ)) * √(63 * (↑x : ℝ)) = √(60 * (↑x : ℝ) * (12 * (↑x : ℝ)) * (63 * (↑x : ℝ)))) (h₁ : √(60 * (↑x : ℝ) * (12 * (↑x : ℝ)) * (63 * (↑x : ℝ))) = √(45360 * (↑x : ℝ) ^ 3)) (h₂ : √(45360 * (↑x : ℝ) ^ 3) = √(36 ^ 2 * 35 * (↑x : ℝ) ^ 3)) (h₃₁ : 0 ≤ 36) (h₃₂ : 0 ≤ 35 * (↑x : ℝ) ^ 3) (h₃₃ : 0 ≤ (↑x : ℝ)) (h₃₄ : 0 ≤ (↑x : ℝ) ^ 3) (h₃₅ : 0 ≤ 35 * (↑x : ℝ) ^ 3) : √(36 ^ 2 * 35 * (↑x : ℝ) ^ 3) = 36 * √(35 * (↑x : ℝ) ^ 3) :=
  by
  rw [Real.sqrt_eq_iff_sq_eq (by positivity) (by positivity)]
  have h₃₇ : (36 : ℝ) ^ 2 = 1296 := by norm_num
  have h₃₈ : (36 : ℝ) ^ 2 * 35 * (x : ℝ) ^ 3 = (36 : ℝ) ^ 2 * (35 * (x : ℝ) ^ 3) := by ring
  rw [h₃₈]
  have h₃₉ : Real.sqrt (35 * (x : ℝ) ^ 3) ≥ 0 := Real.sqrt_nonneg _
  nlinarith [Real.sq_sqrt (by positivity : (0 : ℝ) ≤ 35 * (x : ℝ) ^ 3)]