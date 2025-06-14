macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)

theorem putnam_1978_b6
(a : ℕ → ℕ → ℝ)
(ha : ∀ i j, a i j ∈ Icc 0 1)
(m n : ℕ)
(mnpos : m > 0 ∧ n > 0)
: ((∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤ 2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j) := by
  have h₁ : ∀ i ∈ Finset.Icc 1 n, (∑ j in Finset.Icc 1 (m * i), a i j) ≤ m * i := by
    intro i hi
    have h₂ : ∀ j ∈ Finset.Icc 1 (m * i), a i j ≤ 1 := by
      intro j hj
      have h₃ : a i j ∈ Icc 0 1 := ha i j
      hole_2
    have h₃ : ∑ j in Finset.Icc 1 (m * i), a i j ≤ ∑ j in Finset.Icc 1 (m * i), (1 : ℝ) := by
      apply Finset.sum_le_sum
      intro j hj
      have h₄ : a i j ≤ 1 := h₂ j hj
      hole_3
    have h₄ : ∑ j in Finset.Icc 1 (m * i), (1 : ℝ) = (m * i : ℝ) := by
      hole_4
    have h₅ : ∑ j in Finset.Icc 1 (m * i), a i j ≤ (m * i : ℝ) := by
      hole_5
    have h₆ : (m * i : ℝ) = (m * i : ℝ) := rfl
    hole_1
  
  have h₂ : ∀ i ∈ Finset.Icc 1 n, (∑ j in Finset.Icc 1 (m * i), a i j / i) ≤ m := by
    intro i hi
    have h₃ : (∑ j in Finset.Icc 1 (m * i), a i j / i) = (∑ j in Finset.Icc 1 (m * i), a i j) / i := by
      
      have h₄ : (∑ j in Finset.Icc 1 (m * i), a i j / i) = (∑ j in Finset.Icc 1 (m * i), a i j) / i := by
        hole_8
      hole_7
    rw [h₃]
    
    have h₄ : (∑ j in Finset.Icc 1 (m * i), a i j) ≤ m * i := by
      hole_9
    have h₅ : (i : ℝ) ≥ 1 := by
      hole_10
    
    have h₆ : (∑ j in Finset.Icc 1 (m * i), a i j : ℝ) / i ≤ m := by
      have h₇ : (∑ j in Finset.Icc 1 (m * i), a i j : ℝ) ≤ m * i := by
        hole_12
      have h₈ : 0 < (i : ℝ) := by hole_13
      have h₉ : (∑ j in Finset.Icc 1 (m * i), a i j : ℝ) / i ≤ m := by
        hole_14
      hole_11
    hole_6
  
  have h₃ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ≤ m * n := by
    have h₄ : ∀ i ∈ Finset.Icc 1 n, (∑ j in Finset.Icc 1 (m * i), a i j / i) ≤ m := by
      hole_16
    hole_15
  
  have h₄ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤ (m * n : ℝ) ^ 2 := by
    have h₄₁ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ≤ (m * n : ℝ) := by
      hole_18
    have h₄₂ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ≥ 0 := by
      apply Finset.sum_nonneg
      intro i _i
      apply Finset.sum_nonneg
      intro j _j
      have h₄₃ : a i j / (i : ℝ) ≥ 0 := by
        have h₄₄ : a i j ≥ 0 := (ha i j).1
        have h₄₅ : (i : ℝ) > 0 := by
          hole_21
        hole_20
      hole_19
    have h₄₃ : ((∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) : ℝ) ≤ (m * n : ℝ) := by
      hole_22
    have h₄₄ : ((∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) : ℝ) ≥ 0 := by
      hole_23
    have h₄₅ : ((∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i : ℝ) : ℝ) ^ 2 ≤ ((m * n : ℝ) : ℝ) ^ 2 := by
      hole_24
    hole_17
  
  have h₅ : (m * n : ℝ) ^ 2 ≤ 2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j := by
    have h₅₁ : (m : ℝ) ≥ 1 := by
      have h₅₂ : (m : ℕ) > 0 := by hole_26
      have h₅₃ : (m : ℝ) > 0 := by hole_27
      have h₅₄ : (m : ℕ) ≥ 1 := by hole_28
      have h₅₅ : (m : ℝ) ≥ 1 := by hole_29
      hole_25
    
    have h₅₂ : (n : ℝ) ≥ 1 := by
      have h₅₃ : (n : ℕ) > 0 := by hole_31
      have h₅₄ : (n : ℝ) > 0 := by hole_32
      have h₅₅ : (n : ℕ) ≥ 1 := by hole_33
      have h₅₆ : (n : ℝ) ≥ 1 := by hole_34
      hole_30
    
    
    have h₅₃ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j : ℝ) ≥ (m * n : ℝ) * n / 2 := by
      
      have h₅₄ : ∀ (k : ℕ), k ≥ 1 → (∑ i in Finset.Icc 1 k, ∑ j in Finset.Icc 1 (m * i), a i j : ℝ) ≥ (m * k : ℝ) * k / 2 := by
        intro k hk
        induction' hk with k hk IH
        · 
          norm_num [Finset.sum_Icc_succ_top, Finset.sum_range_succ] at *
          have h₅₅ := ha 1 1
          have h₅₆ := ha 1 0
          hole_35
      
      have h₅₅ := h₅₄ n (by linarith)
      simp_all [Finset.sum_Icc_succ_top, Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_zero]
      <;>
      (try norm_num at * ) <;>
      (try linarith) <;>
      (try nlinarith) <;>
      (try ring_nf at * ) <;>
      (try norm_cast at * ) <;>
      (try linarith) <;>
      (try nlinarith)
      <;>
      (try
        {
          have h₅₆ := ha 1 0
          have h₅₇ := ha 1 1
          have h₅₈ := ha 1 (m * 1)
          norm_num [Finset.mem_Icc, Finset.mem_singleton] at h₅₆ h₅₇ h₅₈ ⊢
          <;>
          (try norm_num at h₅₆ h₅₇ h₅₈ ⊢) <;>
          (try linarith) <;>
          (try nlinarith)
        })
      <;>
      (try
        {
          have h₅₆ := ha 1 0
          have h₅₇ := ha 1 1
          have h₅₈ := ha 1 (m * 1)
          norm_num [Finset.mem_Icc, Finset.mem_singleton] at h₅₆ h₅₇ h₅₈ ⊢
          <;>
          (try norm_num at h₅₆ h₅₇ h₅₈ ⊢) <;>
          (try linarith) <;>
          (try nlinarith)
        })
      <;>
      (try
        {
          have h₅₆ := ha 1 0
          have h₅₇ := ha 1 1
          have h₅₈ := ha 1 (m * 1)
          norm_num [Finset.mem_Icc, Finset.mem_singleton] at h₅₆ h₅₇ h₅₈ ⊢
          <;>
          (try norm_num at h₅₆ h₅₇ h₅₈ ⊢) <;>
          (try linarith) <;>
          (try nlinarith)
        })
    
    have h₅₄ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j : ℝ) ≥ (m * n : ℝ) * n / 2 := h₅₃
    have h₅₅ : (m * n : ℝ) ^ 2 ≤ 2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j := by
      have h₅₆ : 0 ≤ (m : ℝ) * n := by positivity
      have h₅₇ : (m * n : ℝ) ≥ 0 := by positivity
      have h₅₈ : (2 : ℝ) > 0 := by norm_num
      have h₅₉ : (m * n : ℝ) * n / 2 = (m * n : ℝ) * n / 2 := by ring
      
      nlinarith [sq_nonneg ((m * n : ℝ) - (m * n : ℝ) * n / 2), h₅₄, sq_nonneg ((m : ℝ) - 1),
        sq_nonneg ((n : ℝ) - 1)]
    linarith
  
  have h₆ : ((∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤ 2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j) := by
    have h₆₁ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤ (m * n : ℝ) ^ 2 := h₄
    have h₆₂ : (m * n : ℝ) ^ 2 ≤ 2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j := h₅
    have h₆₃ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤ 2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j := by
      linarith
    exact_mod_cast h₆₃
  
  have h₇ : ((∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤ 2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j) := by
    exact h₆
  exact h₇