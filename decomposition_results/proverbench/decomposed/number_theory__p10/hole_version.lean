macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem dirichlet_theorem' {α : ℝ} (hα : Irrational α) {n : ℕ} (hn : 0 < n) :
  ∃ p q : ℤ, 0 < q ∧ q ≤ n ∧ |α - p/q| < 1/((n + 1) * q) := by
  have h_main : ∃ (k : ℕ) (p : ℤ), 0 < k ∧ k ≤ n ∧ |(k : ℝ) * α - p| < 1 / (n + 1 : ℝ) := by
    
    have h₁ : ∃ (k : ℕ) (p : ℤ), 0 < k ∧ k ≤ n ∧ |(k : ℝ) * α - p| < 1 / (n + 1 : ℝ) := by
      
      have h₂ : ∃ (i j : ℕ), i < j ∧ j ≤ n ∧ |(j : ℝ) * α - (i : ℝ) * α - (round ((j : ℝ) * α) - round ((i : ℝ) * α))| < 1 / (n + 1 : ℝ) := by
        
        set f : ℕ → ℝ := fun k => (k : ℝ) * α - round ((k : ℝ) * α)
        
        have h₃ : ∃ (i j : ℕ), i < j ∧ j ≤ n ∧ |f j - f i| < 1 / (n + 1 : ℝ) := by
          
          by_contra h
          
          push_neg at h
          have h₄ : ∀ (i j : ℕ), i < j → j ≤ n → 1 / (n + 1 : ℝ) ≤ |f j - f i| := by
            hole_6
          
          have h₅ : ∀ k : ℕ, k ≤ n → f k = (k : ℝ) * α - round ((k : ℝ) * α) := by
            hole_7
          
          have h₆ := h₄ 0 1 (by norm_num) (by linarith)
          have h₇ := h₄ 0 n (by omega) (by linarith)
          have h₈ := h₄ 1 n (by omega) (by linarith)
          hole_5
        hole_4
      obtain ⟨i, j, hij, hj, hdiff⟩ := h₂
      by_cases h : i = 0
      · 
        use j, round ((j : ℝ) * α)
        have hj' : 0 < j := by
          by_contra h₁
          have h₂ : j = 0 := by hole_9
          hole_8
        have hj'' : j ≤ n := by hole_10
        constructor
        · 
          exact_mod_cast hj'
        constructor
        · 
          exact hj''
        · 
          simpa [h, abs_sub_lt_iff] using hdiff
      · 
        use j - i, round ((j : ℝ) * α) - round ((i : ℝ) * α)
        have h₁ : 0 < j - i := by hole_11
        have h₂ : j - i ≤ n := by hole_12
        have h₃ : |(j - i : ℝ) * α - (round ((j : ℝ) * α) - round ((i : ℝ) * α))| < 1 / (n + 1 : ℝ) := by
          have h₄ : (j : ℝ) * α - (i : ℝ) * α = (j - i : ℝ) * α := by hole_14
          have h₅ : (j : ℝ) * α - (i : ℝ) * α - (round ((j : ℝ) * α) - round ((i : ℝ) * α)) = (j - i : ℝ) * α - (round ((j : ℝ) * α) - round ((i : ℝ) * α)) := by
            hole_15
          hole_13
        hole_3
    hole_2
  obtain ⟨k, p, hk₀, hk₁, hk₂⟩ := h_main
  have h₁ : ∃ (q : ℤ), 0 < q ∧ q ≤ n ∧ |α - (p : ℝ) / q| < 1 / ((n + 1 : ℝ) * q) := by
    have h₂ : (k : ℤ) > 0 := by hole_17
    have h₃ : (k : ℤ) ≤ n := by hole_18
    have h₄ : |(k : ℝ) * α - p| < 1 / (n + 1 : ℝ) := hk₂
    have h₅ : 0 < (k : ℝ) := by hole_19
    have h₆ : (k : ℝ) ≤ n := by hole_20
    have h₇ : |α - (p : ℝ) / k| < 1 / ((n + 1 : ℝ) * k) := by
      have h₇₁ : |(k : ℝ) * α - p| < 1 / (n + 1 : ℝ) := hk₂
      have h₇₂ : |α - (p : ℝ) / k| = |(k : ℝ) * α - p| / k := by
        hole_22
      rw [h₇₂]
      have h₇₃ : |(k : ℝ) * α - p| / k < 1 / ((n + 1 : ℝ) * k) := by
        have h₇₃₁ : |(k : ℝ) * α - p| < 1 / (n + 1 : ℝ) := h₇₁
        have h₇₃₂ : 0 < (n + 1 : ℝ) := by hole_24
        have h₇₃₃ : 0 < (k : ℝ) := by hole_25
        have h₇₃₄ : 0 < (n + 1 : ℝ) * k := by hole_26
        hole_23
      hole_21
    hole_16
  hole_1