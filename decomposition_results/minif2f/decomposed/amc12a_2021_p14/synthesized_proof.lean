theorem amc12a_2021_p14 :
    ((∑ k in Finset.Icc 1 20, Real.logb (5 ^ k) (3 ^ k ^ 2)) *
        ∑ k in Finset.Icc 1 100, Real.logb (9 ^ k) (25 ^ k)) = 21000 := by
  have h₁ : ∀ k ∈ Finset.Icc (1 : ℕ) 20, Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2)) = (k : ℝ) * Real.logb 5 3 := by
    intro k hk
    have h₁ : 1 ≤ (k : ℕ) := by
      admit
    have h₂ : (k : ℕ) ≤ 20 := by
      admit
    have h₃ : k ≥ 1 := by linarith
    have h₄ : k ≤ 20 := by linarith
    have h₅ : Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2)) = (k : ℝ) * Real.logb 5 3 := by
      have h₅₁ : Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2)) = Real.log ((3 : ℝ) ^ (k ^ 2)) / Real.log ((5 : ℝ) ^ k) := by
        norm_cast
      rw [h₅₁]
      have h₅₂ : Real.log ((3 : ℝ) ^ (k ^ 2)) = (k ^ 2 : ℝ) * Real.log 3 := by
        norm_num
      have h₅₃ : Real.log ((5 : ℝ) ^ k) = (k : ℝ) * Real.log 5 := by
        norm_num
      rw [h₅₂, h₅₃]
      have h₅₄ : Real.logb 5 3 = Real.log 3 / Real.log 5 := by
        norm_cast
      have h₅₅ : (k ^ 2 : ℝ) * Real.log 3 / ((k : ℝ) * Real.log 5) = (k : ℝ) * (Real.log 3 / Real.log 5) := by
        have h₅₅₁ : (k : ℝ) ≠ 0 := by
          positivity
        admit
      nlinarith
    linarith
  
  have h₂ : (∑ k in Finset.Icc (1 : ℕ) 20, Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2))) = 210 * Real.logb 5 3 := by
    have h₂₁ : (∑ k in Finset.Icc (1 : ℕ) 20, Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2))) = ∑ k in Finset.Icc (1 : ℕ) 20, ((k : ℝ) * Real.logb 5 3) := by
      admit
    rw [h₂₁]
    have h₂₂ : (∑ k in Finset.Icc (1 : ℕ) 20, (k : ℝ) * Real.logb 5 3) = (∑ k in Finset.Icc (1 : ℕ) 20, (k : ℝ)) * Real.logb 5 3 := by
      admit
    rw [h₂₂]
    have h₂₃ : (∑ k in Finset.Icc (1 : ℕ) 20, (k : ℝ)) = 210 := by
      admit
    admit
  
  have h₃ : ∀ k ∈ Finset.Icc (1 : ℕ) 100, Real.logb ((9 : ℝ) ^ k) ((25 : ℝ) ^ k) = Real.logb 3 5 := by
    intro k hk
    have h₃₁ : Real.logb ((9 : ℝ) ^ k) ((25 : ℝ) ^ k) = (Real.log ((25 : ℝ) ^ k) / Real.log ((9 : ℝ) ^ k)) := by
      norm_cast
    rw [h₃₁]
    have h₃₂ : Real.log ((25 : ℝ) ^ k) = (k : ℝ) * Real.log 25 := by
      norm_num
    have h₃₃ : Real.log ((9 : ℝ) ^ k) = (k : ℝ) * Real.log 9 := by
      norm_num
    rw [h₃₂, h₃₃]
    have h₃₄ : Real.log 25 = 2 * Real.log 5 := by
      have h₃₄₁ : Real.log 25 = Real.log (5 ^ 2) := by norm_num
      rw [h₃₄₁]
      have h₃₄₂ : Real.log (5 ^ 2) = 2 * Real.log 5 := by
        simp
      linarith
    have h₃₅ : Real.log 9 = 2 * Real.log 3 := by
      have h₃₅₁ : Real.log 9 = Real.log (3 ^ 2) := by norm_num
      rw [h₃₅₁]
      have h₃₅₂ : Real.log (3 ^ 2) = 2 * Real.log 3 := by
        simp
      linarith
    rw [h₃₄, h₃₅]
    have h₃₆ : (k : ℝ) ≠ 0 := by
      admit
    have h₃₇ : (2 : ℝ) ≠ 0 := by norm_num
    have h₃₈ : Real.log 5 ≠ 0 := by
      have h₃₈₁ : Real.log 5 > 0 := Real.log_pos (by norm_num)
      norm_num
    have h₃₉ : Real.log 3 ≠ 0 := by
      have h₃₉₁ : Real.log 3 > 0 := Real.log_pos (by norm_num)
      norm_num
    admit
  
  have h₄ : (∑ k in Finset.Icc (1 : ℕ) 100, Real.logb ((9 : ℝ) ^ k) ((25 : ℝ) ^ k)) = 100 * Real.logb 3 5 := by
    have h₄₁ : (∑ k in Finset.Icc (1 : ℕ) 100, Real.logb ((9 : ℝ) ^ k) ((25 : ℝ) ^ k)) = ∑ k in Finset.Icc (1 : ℕ) 100, (Real.logb 3 5 : ℝ) := by
      admit
    rw [h₄₁]
    have h₄₂ : (∑ k in Finset.Icc (1 : ℕ) 100, (Real.logb 3 5 : ℝ)) = 100 * Real.logb 3 5 := by
      norm_num
    norm_num
  
  have h₅ : Real.logb 5 3 * Real.logb 3 5 = 1 := by
    have h₅₁ : Real.logb 5 3 = Real.log 3 / Real.log 5 := by
      norm_cast
    have h₅₂ : Real.logb 3 5 = Real.log 5 / Real.log 3 := by
      norm_cast
    rw [h₅₁, h₅₂]
    have h₅₃ : Real.log 3 ≠ 0 := Real.log_ne_zero_of_pos_of_ne_one (by norm_num) (by norm_num)
    have h₅₄ : Real.log 5 ≠ 0 := Real.log_ne_zero_of_pos_of_ne_one (by norm_num) (by norm_num)
    norm_num
  
  have h₆ : ((∑ k in Finset.Icc 1 20, Real.logb (5 ^ k) (3 ^ k ^ 2)) * ∑ k in Finset.Icc 1 100, Real.logb (9 ^ k) (25 ^ k)) = 21000 := by
    rw [show (∑ k in Finset.Icc 1 20, Real.logb (5 ^ k) (3 ^ k ^ 2)) = 210 * Real.logb 5 3 by
      simpa using h₂]
    rw [show (∑ k in Finset.Icc 1 100, Real.logb (9 ^ k) (25 ^ k)) = 100 * Real.logb 3 5 by
      simpa using h₄]
    have h₆₁ : (210 * Real.logb 5 3 : ℝ) * (100 * Real.logb 3 5 : ℝ) = 21000 := by
      have h₆₂ : Real.logb 5 3 * Real.logb 3 5 = 1 := h₅
      have h₆₃ : (Real.logb 5 3 : ℝ) * (Real.logb 3 5 : ℝ) = 1 := by linarith
      linarith
    linarith
  
  linarith
