theorem h₃₉ (h₁ : ∀ k ∈ Finset.Icc 1 20, logb (5 ^ k) (3 ^ k ^ 2) = ↑k * logb 5 3) (h₂ : ∑ k ∈ Finset.Icc 1 20, logb (5 ^ k) (3 ^ k ^ 2) = 210 * logb 5 3) (k : ℕ) (hk : k ∈ Finset.Icc 1 100) (h₃₁ : logb (9 ^ k) (25 ^ k) = Real.log (25 ^ k) / Real.log (9 ^ k)) (h₃₂ : Real.log (25 ^ k) = ↑k * Real.log 25) (h₃₃ : Real.log (9 ^ k) = ↑k * Real.log 9) (h₃₄ : Real.log 25 = 2 * Real.log 5) (h₃₅ : Real.log 9 = 2 * Real.log 3) (h₃₆ : ↑k ≠ 0) (h₃₇ : 2 ≠ 0) (h₃₈ : Real.log 5 ≠ 0) : Real.log 3 ≠ 0 := by
  have h₃₉₁ : Real.log 3 > 0 := Real.log_pos (by norm_num)
  --  linarith
  hole