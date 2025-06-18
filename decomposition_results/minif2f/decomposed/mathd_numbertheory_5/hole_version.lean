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

theorem mathd_numbertheory_5 (n : ℕ) (h₀ : 10 ≤ n) (h₁ : ∃ x, x ^ 2 = n) (h₂ : ∃ t, t ^ 3 = n) :
    64 ≤ n := by
  have h₃ : ∀ (t : ℕ), t ^ 3 = n → 64 ≤ n := by
    intro t ht
    have h₄ : t ≥ 3 := by
      by_contra h
      
      have h₅ : t ≤ 2 := by hole_1
      have h₆ : t ^ 3 ≤ 8 := by
        have h₇ : t ≤ 2 := h₅
        have h₈ : t ^ 3 ≤ 2 ^ 3 := by
          hole_2
        hole_3
      have h₉ : n ≤ 8 := by hole_4
      hole_5
    
    by_cases h₅ : t ≥ 4
    · 
      have h₆ : t ^ 3 ≥ 4 ^ 3 := by
        hole_6
      have h₇ : n ≥ 64 := by
        hole_7
      linarith
    · 
      have h₆ : t = 3 := by
        have h₇ : t < 4 := by hole_8
        have h₈ : t ≥ 3 := h₄
        hole_9
      rw [h₆] at ht
      
      have h₇ : n = 27 := by
        hole_10
      
      rcases h₁ with ⟨x, hx⟩
      have h₈ : x ^ 2 = 27 := by
        hole_11
      have h₉ : x ≤ 5 := by
        hole_12
      have h₁₀ : x ≥ 6 := by
        by_contra h
        have h₁₁ : x ≤ 5 := by hole_13
        hole_14
      hole_15
  
  have h₄ : 64 ≤ n := by
    rcases h₂ with ⟨t, ht⟩
    have h₅ : 64 ≤ n := h₃ t ht
    hole_16
  
  hole_17