macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem algebra_amgm_sum1toneqn_prod1tonleq1 (a : ℕ → NNReal) (n : ℕ)
    (h₀ : (∑ x in Finset.range n, a x) = n) : (∏ x in Finset.range n, a x) ≤ 1 := by
  have h₁ : (∏ x in Finset.range n, (a x : ℝ)) ≤ 1 := by
    have h₂ : (∑ x in Finset.range n, (a x : ℝ)) = n := by
      hole_3
    by_cases h₃ : n = 0
    · 
      simp [h₃]
    · 
      have h₄ : 0 < n := Nat.pos_of_ne_zero h₃
      
      by_cases h₅ : ∃ i, i ∈ Finset.range n ∧ (a i : ℝ) = 0
      · 
        obtain ⟨i, hi, h₆⟩ := h₅
        have h₇ : (∏ x in Finset.range n, (a x : ℝ)) = 0 := by
          have h₈ : i ∈ Finset.range n := hi
          have h₉ : (a i : ℝ) = 0 := h₆
          have h₁₀ : (∏ x in Finset.range n, (a x : ℝ)) = 0 := by
            hole_5
          hole_4
        linarith
      · 
        have h₅' : ∀ i, i ∈ Finset.range n → (a i : ℝ) > 0 := by
          intro i hi
          have h₆ : ¬∃ i, i ∈ Finset.range n ∧ (a i : ℝ) = 0 := h₅
          have h₇ : (a i : ℝ) ≠ 0 := by
            intro h
            have h₈ : ∃ i, i ∈ Finset.range n ∧ (a i : ℝ) = 0 := ⟨i, hi, by simp_all⟩
            hole_7
          have h₈ : (a i : ℝ) > 0 := by
            have h₉ : (a i : ℝ) ≥ 0 := by hole_9
            hole_8
          hole_6
        
        have h₆ : (∏ x in Finset.range n, (a x : ℝ)) ≤ 1 := by
          have h₇ : ∑ x in Finset.range n, Real.log ((a x : ℝ)) ≤ 0 := by
            have h₈ : ∑ x in Finset.range n, Real.log ((a x : ℝ)) ≤ ∑ x in Finset.range n, ((a x : ℝ) - 1) := by
              apply Finset.sum_le_sum
              intro i hi
              have h₉ : (a i : ℝ) > 0 := h₅' i hi
              have h₁₀ : Real.log ((a i : ℝ)) ≤ (a i : ℝ) - 1 := by
                have h₁₁ : Real.log ((a i : ℝ)) ≤ (a i : ℝ) - 1 := by
                  hole_14
                hole_13
              hole_12
            have h₉ : ∑ x in Finset.range n, ((a x : ℝ) - 1) = (∑ x in Finset.range n, (a x : ℝ)) - n := by
              hole_15
            have h₁₀ : ∑ x in Finset.range n, ((a x : ℝ) - 1) = (∑ x in Finset.range n, (a x : ℝ)) - n := h₉
            have h₁₁ : ∑ x in Finset.range n, Real.log ((a x : ℝ)) ≤ (∑ x in Finset.range n, (a x : ℝ)) - n := by
              hole_16
            have h₁₂ : (∑ x in Finset.range n, (a x : ℝ)) - n = 0 := by
              hole_17
            hole_11
          have h₈ : Real.log (∏ x in Finset.range n, (a x : ℝ)) ≤ 0 := by
            hole_18
          have h₉ : (∏ x in Finset.range n, (a x : ℝ)) ≤ 1 := by
            by_contra h
            have h₁₀ : (∏ x in Finset.range n, (a x : ℝ)) > 1 := by
              hole_20
            have h₁₁ : Real.log (∏ x in Finset.range n, (a x : ℝ)) > 0 := by
              have h₁₂ : Real.log (∏ x in Finset.range n, (a x : ℝ)) > 0 := by
                hole_22
              hole_21
            hole_19
          hole_10
        hole_2
  have h₂ : (∏ x in Finset.range n, a x) ≤ 1 := by
    have h₃ : (∏ x in Finset.range n, a x : ℝ) ≤ 1 := by
      hole_24
    have h₄ : (∏ x in Finset.range n, a x : ℝ) = (∏ x in Finset.range n, a x : ℝ) := rfl
    have h₅ : (∏ x in Finset.range n, a x : ℝ) = (∏ x in Finset.range n, (a x : ℝ)) := by hole_25
    have h₆ : (∏ x in Finset.range n, a x : ℝ) ≤ 1 := by hole_26
    have h₇ : (∏ x in Finset.range n, a x : NNReal) ≤ 1 := by
      hole_27
    hole_23
  hole_1