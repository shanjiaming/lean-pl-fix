macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem amc12a_2021_p14 :
    ((∑ k in Finset.Icc 1 20, Real.logb (5 ^ k) (3 ^ k ^ 2)) *
        ∑ k in Finset.Icc 1 100, Real.logb (9 ^ k) (25 ^ k)) = 21000 := by
  have h₁ : ∀ k ∈ Finset.Icc (1 : ℕ) 20, Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2)) = (k : ℝ) * Real.logb 5 3 := by
    intro k hk
    have h₁ : 1 ≤ (k : ℕ) := by
      hole_3
    have h₂ : (k : ℕ) ≤ 20 := by
      hole_4
    have h₃ : k ≥ 1 := by hole_5
    have h₄ : k ≤ 20 := by hole_6
    have h₅ : Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2)) = (k : ℝ) * Real.logb 5 3 := by
      have h₅₁ : Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2)) = Real.log ((3 : ℝ) ^ (k ^ 2)) / Real.log ((5 : ℝ) ^ k) := by
        hole_8
      rw [h₅₁]
      have h₅₂ : Real.log ((3 : ℝ) ^ (k ^ 2)) = (k ^ 2 : ℝ) * Real.log 3 := by
        hole_9
      have h₅₃ : Real.log ((5 : ℝ) ^ k) = (k : ℝ) * Real.log 5 := by
        hole_10
      rw [h₅₂, h₅₃]
      have h₅₄ : Real.logb 5 3 = Real.log 3 / Real.log 5 := by
        hole_11
      have h₅₅ : (k ^ 2 : ℝ) * Real.log 3 / ((k : ℝ) * Real.log 5) = (k : ℝ) * (Real.log 3 / Real.log 5) := by
        have h₅₅₁ : (k : ℝ) ≠ 0 := by
          hole_13
        hole_12
      hole_7
    hole_2
  
  have h₂ : (∑ k in Finset.Icc (1 : ℕ) 20, Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2))) = 210 * Real.logb 5 3 := by
    have h₂₁ : (∑ k in Finset.Icc (1 : ℕ) 20, Real.logb ((5 : ℝ) ^ k) ((3 : ℝ) ^ (k ^ 2))) = ∑ k in Finset.Icc (1 : ℕ) 20, ((k : ℝ) * Real.logb 5 3) := by
      hole_15
    rw [h₂₁]
    have h₂₂ : (∑ k in Finset.Icc (1 : ℕ) 20, (k : ℝ) * Real.logb 5 3) = (∑ k in Finset.Icc (1 : ℕ) 20, (k : ℝ)) * Real.logb 5 3 := by
      hole_16
    rw [h₂₂]
    have h₂₃ : (∑ k in Finset.Icc (1 : ℕ) 20, (k : ℝ)) = 210 := by
      hole_17
    hole_14
  
  have h₃ : ∀ k ∈ Finset.Icc (1 : ℕ) 100, Real.logb ((9 : ℝ) ^ k) ((25 : ℝ) ^ k) = Real.logb 3 5 := by
    intro k hk
    have h₃₁ : Real.logb ((9 : ℝ) ^ k) ((25 : ℝ) ^ k) = (Real.log ((25 : ℝ) ^ k) / Real.log ((9 : ℝ) ^ k)) := by
      hole_19
    rw [h₃₁]
    have h₃₂ : Real.log ((25 : ℝ) ^ k) = (k : ℝ) * Real.log 25 := by
      hole_20
    have h₃₃ : Real.log ((9 : ℝ) ^ k) = (k : ℝ) * Real.log 9 := by
      hole_21
    rw [h₃₂, h₃₃]
    have h₃₄ : Real.log 25 = 2 * Real.log 5 := by
      have h₃₄₁ : Real.log 25 = Real.log (5 ^ 2) := by hole_23
      rw [h₃₄₁]
      have h₃₄₂ : Real.log (5 ^ 2) = 2 * Real.log 5 := by
        hole_24
      hole_22
    have h₃₅ : Real.log 9 = 2 * Real.log 3 := by
      have h₃₅₁ : Real.log 9 = Real.log (3 ^ 2) := by hole_26
      rw [h₃₅₁]
      have h₃₅₂ : Real.log (3 ^ 2) = 2 * Real.log 3 := by
        hole_27
      hole_25
    rw [h₃₄, h₃₅]
    have h₃₆ : (k : ℝ) ≠ 0 := by
      hole_28
    have h₃₇ : (2 : ℝ) ≠ 0 := by hole_29
    have h₃₈ : Real.log 5 ≠ 0 := by
      have h₃₈₁ : Real.log 5 > 0 := Real.log_pos (by norm_num)
      hole_30
      clear h₃₈
      have h₃₈ : Real.log 5 ≠ 0 := skip_hole
    have h₃₉ : Real.log 3 ≠ 0 := by
      have h₃₉₁ : Real.log 3 > 0 := Real.log_pos (by norm_num)
      hole_31
      clear h₃₉
      have h₃₉ : Real.log 3 ≠ 0 := skip_hole
    hole_18
  
  have h₄ : (∑ k in Finset.Icc (1 : ℕ) 100, Real.logb ((9 : ℝ) ^ k) ((25 : ℝ) ^ k)) = 100 * Real.logb 3 5 := by
    have h₄₁ : (∑ k in Finset.Icc (1 : ℕ) 100, Real.logb ((9 : ℝ) ^ k) ((25 : ℝ) ^ k)) = ∑ k in Finset.Icc (1 : ℕ) 100, (Real.logb 3 5 : ℝ) := by
      hole_33
    rw [h₄₁]
    have h₄₂ : (∑ k in Finset.Icc (1 : ℕ) 100, (Real.logb 3 5 : ℝ)) = 100 * Real.logb 3 5 := by
      hole_34
    hole_32
  
  have h₅ : Real.logb 5 3 * Real.logb 3 5 = 1 := by
    have h₅₁ : Real.logb 5 3 = Real.log 3 / Real.log 5 := by
      hole_36
    have h₅₂ : Real.logb 3 5 = Real.log 5 / Real.log 3 := by
      hole_37
    rw [h₅₁, h₅₂]
    have h₅₃ : Real.log 3 ≠ 0 := Real.log_ne_zero_of_pos_of_ne_one (by norm_num) (by norm_num)
    have h₅₄ : Real.log 5 ≠ 0 := Real.log_ne_zero_of_pos_of_ne_one (by norm_num) (by norm_num)
    hole_35
  
  have h₆ : ((∑ k in Finset.Icc 1 20, Real.logb (5 ^ k) (3 ^ k ^ 2)) * ∑ k in Finset.Icc 1 100, Real.logb (9 ^ k) (25 ^ k)) = 21000 := by
    rw [show (∑ k in Finset.Icc 1 20, Real.logb (5 ^ k) (3 ^ k ^ 2)) = 210 * Real.logb 5 3 by
      simpa using h₂]
    rw [show (∑ k in Finset.Icc 1 100, Real.logb (9 ^ k) (25 ^ k)) = 100 * Real.logb 3 5 by
      simpa using h₄]
    have h₆₁ : (210 * Real.logb 5 3 : ℝ) * (100 * Real.logb 3 5 : ℝ) = 21000 := by
      have h₆₂ : Real.logb 5 3 * Real.logb 3 5 = 1 := h₅
      have h₆₃ : (Real.logb 5 3 : ℝ) * (Real.logb 3 5 : ℝ) = 1 := by hole_40
      hole_39
    hole_38
  
  hole_1