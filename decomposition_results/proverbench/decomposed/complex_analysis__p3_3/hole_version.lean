macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem constant_reciprocal_function (f : ℂ → ℂ) (hf : Entire f) (h : ∀ z, 1 ≤ abs (f z)) :
  ∃ c : ℂ, ∀ z, f z = 1 / c := by
  have h₁ : Entire (fun z => 1 / f z) ∧ ∀ z, abs (1 / f z) ≤ 1 := by
    hole_2
  
  have h₂ : ∃ (C : ℝ), ∀ (z : ℂ), abs ((fun z => 1 / f z) z) ≤ C := by
    refine' ⟨1, _⟩
    intro z
    have h₂ : abs (1 / f z) ≤ 1 := h₁.2 z
    hole_3
  
  have h₃ : ∃ (c : ℂ), ∀ (z : ℂ), (fun z => 1 / f z) z = c := by
    have h₃ : ∃ (C : ℝ), ∀ (z : ℂ), abs ((fun z => 1 / f z) z) ≤ C := h₂
    have h₄ : Entire (fun z => 1 / f z) := h₁.1
    have h₅ : ∃ (c : ℂ), ∀ (z : ℂ), (fun z => 1 / f z) z = c := by
      
      have h₆ : ∃ (c : ℂ), ∀ (z : ℂ), (fun z => 1 / f z) z = c := by
        
        have h₇ : ∃ C, ∀ z, abs ((fun z => 1 / f z) z) ≤ C := h₂
        obtain ⟨C, hC⟩ := h₇
        have h₈ : ∃ (c : ℂ), ∀ (z : ℂ), (fun z => 1 / f z) z = c := by
          
          have h₉ : ∃ (c : ℂ), ∀ (z : ℂ), (fun z => 1 / f z) z = c := by
            
            have h₁₀ : ∃ (c : ℂ), ∀ (z : ℂ), (fun z => 1 / f z) z = c := by
              
              hole_9
            hole_8
          hole_7
        hole_6
      hole_5
    hole_4
  
  have h₄ : ∃ (c : ℂ), ∀ (z : ℂ), f z = 1 / c := by
    obtain ⟨c, hc⟩ := h₃
    have h₅ : ∀ (z : ℂ), (1 : ℂ) / f z = c := by hole_11
    have h₆ : c ≠ 0 := by
      by_contra h₆
      have h₇ : c = 0 := by hole_13
      have h₈ : ∀ (z : ℂ), (1 : ℂ) / f z = 0 := by hole_14
      have h₉ : ∀ (z : ℂ), f z = 0 := by
        intro z
        have h₁₀ : (1 : ℂ) / f z = 0 := h₈ z
        have h₁₁ : f z ≠ 0 := by
          by_contra h₁₁
          have h₁₂ : f z = 0 := by hole_17
          have h₁₃ : abs (f z) = 0 := by hole_18
          have h₁₄ : 1 ≤ abs (f z) := h z
          hole_16
        have h₁₅ : f z = 0 := by
          by_cases h₁₅ : f z = 0
          · exact h₁₅
          · exfalso
            have h₁₆ : (1 : ℂ) / f z ≠ 0 := by
              hole_20
            hole_19
        hole_15
      have h₁₀ : ∀ (z : ℂ), abs (f z) = 0 := by
        intro z
        have h₁₁ : f z = 0 := h₉ z
        hole_21
      have h₁₁ : ∀ (z : ℂ), 1 ≤ abs (f z) := h
      have h₁₂ : 1 ≤ (0 : ℝ) := by
        have h₁₃ : 1 ≤ abs (f 0) := h 0
        have h₁₄ : abs (f 0) = 0 := h₁₀ 0
        hole_22
      hole_12
    use (1 : ℂ) / c
    intro z
    have h₇ : (1 : ℂ) / f z = c := h₅ z
    have h₈ : f z = (1 : ℂ) / c := by
      have h₉ : f z ≠ 0 := by
        by_contra h₉
        have h₁₀ : f z = 0 := by hole_25
        have h₁₁ : abs (f z) = 0 := by hole_26
        have h₁₂ : 1 ≤ abs (f z) := h z
        hole_24
      have h₁₀ : c ≠ 0 := h₆
      have h₁₁ : (1 : ℂ) / f z = c := h₅ z
      have h₁₂ : f z = (1 : ℂ) / c := by
        have h₁₃ : (1 : ℂ) / f z = c := h₅ z
        have h₁₄ : f z = (1 : ℂ) / c := by
          hole_28
        hole_27
      hole_23
    hole_10
  
  hole_1