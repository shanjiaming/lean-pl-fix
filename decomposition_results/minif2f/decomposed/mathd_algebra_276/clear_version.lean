macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_276 (a b : ℤ)
    (h₀ : ∀ x : ℝ, 10 * x ^ 2 - x - 24 = (a * x - 8) * (b * x + 3)) : a * b + b = 12 := by
  have h₁ : (a + 8 : ℤ) * (b - 3) = -13 := by
    have h₁₀ := h₀ (-1 : ℝ)
    norm_num at h₁₀
    ring_nf at h₁₀
    have h₁₁ := congr_arg (fun x : ℝ => (x : ℝ)) h₁₀
    hole_2
  
  have h₂ : (a - 8 : ℤ) * (b + 3) = -15 := by
    have h₂₀ := h₀ (1 : ℝ)
    norm_num at h₂₀
    ring_nf at h₂₀
    have h₂₁ := congr_arg (fun x : ℝ => (x : ℝ)) h₂₀
    hole_3
  
  have h₃ : a = 5 := by
    have h₃₁ : a = 5 := by
      have h₃₂ : (a + 8 : ℤ) * (b - 3) = -13 := h₁
      have h₃₃ : (a - 8 : ℤ) * (b + 3) = -15 := h₂
      have h₃₄ : a = 5 := by
        
        
        have h₃₅ : a = 5 := by
          
          have h₃₆ : a = 5 := by
            
            have h₃₇ : a + 8 = 13 ∨ a + 8 = -13 ∨ a + 8 = 1 ∨ a + 8 = -1 := by
              
              have h₃₈ : a + 8 ∣ -13 := by
                hole_10
              clear h₃₈
              have h₃₈ : a + 8 ∣ -13 := skip_hole
              have h₃₉ : a + 8 = 13 ∨ a + 8 = -13 ∨ a + 8 = 1 ∨ a + 8 = -1 := by
                
                have h₄₀ : a + 8 = 13 ∨ a + 8 = -13 ∨ a + 8 = 1 ∨ a + 8 = -1 := by
                  rw [← Int.natAbs_dvd_natAbs] at h₃₈
                  
                  have h₄₁ : (a + 8 : ℤ).natAbs ∣ 13 := by
                    hole_13
                  
                  have h₄₂ : (a + 8 : ℤ).natAbs = 1 ∨ (a + 8 : ℤ).natAbs = 13 := by
                    have h₄₃ : (a + 8 : ℤ).natAbs ∣ 13 := h₄₁
                    have h₄₄ : (a + 8 : ℤ).natAbs = 1 ∨ (a + 8 : ℤ).natAbs = 13 := by
                      
                      have h₄₅ : (a + 8 : ℤ).natAbs ≤ 13 := Nat.le_of_dvd (by norm_num) h₄₁
                      hole_15
                    hole_14
                  
                  cases' h₄₂ with h₄₂ h₄₂
                  · 
                    have h₄₆ : a + 8 = 1 ∨ a + 8 = -1 := by
                      have h₄₇ : (a + 8 : ℤ).natAbs = 1 := h₄₂
                      have h₄₈ : a + 8 = 1 ∨ a + 8 = -1 := by
                        hole_17
                      hole_16
                    cases' h₄₆ with h₄₆ h₄₆
                    · 
                      omega
                    · 
                      omega
                  · 
                    have h₄₆ : a + 8 = 13 ∨ a + 8 = -13 := by
                      have h₄₇ : (a + 8 : ℤ).natAbs = 13 := h₄₂
                      have h₄₈ : a + 8 = 13 ∨ a + 8 = -13 := by
                        hole_19
                      hole_18
                    hole_12
                hole_11
              hole_9
            cases' h₃₇ with h₃₇ h₃₇
            · 
              have h₃₈ : a + 8 = 13 := h₃₇
              have h₃₉ : a = 5 := by
                hole_20
              exact h₃₉
            · cases' h₃₇ with h₃₇ h₃₇
              · 
                have h₃₈ : a + 8 = -13 := h₃₇
                have h₃₉ : a = -21 := by
                  hole_21
                have h₄₀ : (a - 8 : ℤ) * (b + 3) = -15 := h₂
                have h₄₁ : a = -21 := h₃₉
                rw [h₄₁] at h₄₀
                norm_num at h₄₀
                <;>
                (try omega) <;>
                (try
                  {
                    have h₄₂ := h₁
                    rw [h₄₁] at h₄₂
                    norm_num at h₄₂
                    <;>
                    omega
                  })
                <;>
                omega
              · cases' h₃₇ with h₃₇ h₃₇
                · 
                  have h₃₈ : a + 8 = 1 := h₃₇
                  have h₃₉ : a = -7 := by
                    hole_22
                  have h₄₀ : (a - 8 : ℤ) * (b + 3) = -15 := h₂
                  have h₄₁ : a = -7 := h₃₉
                  rw [h₄₁] at h₄₀
                  norm_num at h₄₀
                  <;>
                  (try omega) <;>
                  (try
                    {
                      have h₄₂ := h₁
                      rw [h₄₁] at h₄₂
                      norm_num at h₄₂
                      <;>
                      omega
                    })
                  <;>
                  omega
                · 
                  have h₃₈ : a + 8 = -1 := h₃₇
                  have h₃₉ : a = -9 := by
                    hole_23
                  have h₄₀ : (a - 8 : ℤ) * (b + 3) = -15 := h₂
                  have h₄₁ : a = -9 := h₃₉
                  hole_8
          hole_7
        hole_6
      hole_5
    hole_4
  
  have h₄ : b = 2 := by
    have h₄₁ : b = 2 := by
      have h₄₂ : (a + 8 : ℤ) * (b - 3) = -13 := h₁
      have h₄₃ : (a - 8 : ℤ) * (b + 3) = -15 := h₂
      have h₄₄ : a = 5 := h₃
      hole_25
    hole_24
  
  have h₅ : a * b + b = 12 := by
    hole_26
  
  hole_1