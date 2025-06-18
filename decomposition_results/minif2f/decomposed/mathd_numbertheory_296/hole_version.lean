macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)

theorem mathd_numbertheory_296 (n : ℕ) (h₀ : 2 ≤ n) (h₁ : ∃ x, x ^ 3 = n) (h₂ : ∃ t, t ^ 4 = n) :
    4096 ≤ n := by
  have h_main : n ≥ 4096 := by
    obtain ⟨t, ht⟩ := h₂
    have h₃ : t ≥ 2 := by
      by_contra h
      
      have h₄ : t ≤ 1 := by hole_1
      have h₅ : t = 0 ∨ t = 1 := by
        have h₅₁ : t ≤ 1 := h₄
        have h₅₂ : t ≥ 0 := by hole_2
        hole_3
      hole_4
    
    have h₄ : t ≥ 8 := by
      by_contra h
      
      have h₅ : t ≤ 7 := by hole_5
      have h₆ : t = 2 ∨ t = 3 ∨ t = 4 ∨ t = 5 ∨ t = 6 ∨ t = 7 := by
        hole_6
      
      rcases h₆ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · 
        have h₇ : n = 16 := by
          hole_7
        obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 16 := by
          hole_8
        have h₉ : x ≤ 2 := by
          by_contra h₉
          have h₁₀ : x ≥ 3 := by hole_9
          have h₁₁ : x ^ 3 ≥ 3 ^ 3 := by
            hole_10
          hole_11
        interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      · 
        have h₇ : n = 81 := by
          hole_12
        obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 81 := by
          hole_13
        have h₉ : x ≤ 4 := by
          by_contra h₉
          have h₁₀ : x ≥ 5 := by hole_14
          have h₁₁ : x ^ 3 ≥ 5 ^ 3 := by
            hole_15
          hole_16
        interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      · 
        have h₇ : n = 256 := by
          hole_17
        obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 256 := by
          hole_18
        have h₉ : x ≤ 6 := by
          by_contra h₉
          have h₁₀ : x ≥ 7 := by hole_19
          have h₁₁ : x ^ 3 ≥ 7 ^ 3 := by
            hole_20
          hole_21
        interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      · 
        have h₇ : n = 625 := by
          hole_22
        obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 625 := by
          hole_23
        have h₉ : x ≤ 8 := by
          by_contra h₉
          have h₁₀ : x ≥ 9 := by hole_24
          have h₁₁ : x ^ 3 ≥ 9 ^ 3 := by
            hole_25
          hole_26
        interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      · 
        have h₇ : n = 1296 := by
          hole_27
        obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 1296 := by
          hole_28
        have h₉ : x ≤ 10 := by
          by_contra h₉
          have h₁₀ : x ≥ 11 := by hole_29
          have h₁₁ : x ^ 3 ≥ 11 ^ 3 := by
            hole_30
          hole_31
        interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      · 
        have h₇ : n = 2401 := by
          hole_32
        obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 2401 := by
          hole_33
        have h₉ : x ≤ 13 := by
          by_contra h₉
          have h₁₀ : x ≥ 14 := by hole_34
          have h₁₁ : x ^ 3 ≥ 14 ^ 3 := by
            hole_35
          hole_36
        hole_37
    
    have h₅ : t ^ 4 ≥ 8 ^ 4 := by
      hole_38
    have h₆ : n = t ^ 4 := by
      hole_39
    have h₇ : n ≥ 4096 := by
      hole_40
    hole_41
  
  hole_42