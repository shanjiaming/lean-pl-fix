macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_numbertheory_430 (a b c : ℕ) (h₀ : 1 ≤ a ∧ a ≤ 9) (h₁ : 1 ≤ b ∧ b ≤ 9)
    (h₂ : 1 ≤ c ∧ c ≤ 9) (h₃ : a ≠ b) (h₄ : a ≠ c) (h₅ : b ≠ c) (h₆ : a + b = c)
    (h₇ : 10 * a + a - b = 2 * c) (h₈ : c * b = 10 * a + a + a) : a + b + c = 8 := by
  have h₉ : b = 3 * a := by
    have h₉₁ : 11 * a - b = 2 * c := by
      hole_3
    have h₉₂ : 11 * a - b = 2 * (a + b) := by
      hole_4
    have h₉₃ : 9 * a = 3 * b := by
      have h₉₄ : 11 * a - b = 2 * (a + b) := h₉₂
      have h₉₅ : 11 * a - b = 2 * a + 2 * b := by
        hole_6
      have h₉₆ : 9 * a = 3 * b := by
        have h₉₇ : 11 * a ≥ b := by
          by_contra h
          have h₉₈ : 11 * a < b := by hole_9
          have h₉₉ : 11 * a - b = 0 := by
            have h₁₀₀ : 11 * a < b := h₉₈
            have h₁₀₁ : 11 * a - b = 0 := by
              hole_11
            hole_10
          hole_8
        clear h₉₇
        have h₉₇ : 11 * a ≥ b := skip_hole
        hole_7
      hole_5
    have h₉₇ : b = 3 * a := by
      hole_12
    hole_2
  
  have h₁₀ : a ≤ 3 := by
    have h₁₀₁ : b ≤ 9 := h₁.2
    have h₁₀₂ : b = 3 * a := h₉
    have h₁₀₃ : 3 * a ≤ 9 := by hole_14
    have h₁₀₄ : a ≤ 3 := by
      hole_15
    clear h₁₀₄
    have h₁₀₄ : a ≤ 3 := skip_hole
    hole_13
    clear h₁₀
    have h₁₀ : a ≤ 3 := skip_hole
  
  have h₁₁ : c = 4 * a := by
    have h₁₁₁ : c = a + b := by
      hole_17
    rw [h₁₁₁]
    have h₁₁₂ : b = 3 * a := h₉
    hole_16
  
  have h₁₂ : a = 1 := by
    have h₁₂₁ : c * b = 12 * a := by
      have h₁₂₂ : c * b = 10 * a + a + a := h₈
      have h₁₂₃ : 10 * a + a + a = 12 * a := by
        hole_20
      hole_19
    have h₁₂₄ : c = 4 * a := h₁₁
    have h₁₂₅ : b = 3 * a := h₉
    rw [h₁₂₄, h₁₂₅] at h₁₂₁
    have h₁₂₆ : (4 * a) * (3 * a) = 12 * a := by
      hole_21
    have h₁₂₇ : a = 1 := by
      have h₁₂₈ : a ≥ 1 := h₀.1
      have h₁₂₉ : a ≤ 3 := h₁₀
      hole_22
    hole_18
  
  have h₁₃ : b = 3 := by
    hole_23
  
  have h₁₄ : c = 4 := by
    hole_24
  
  have h₁₅ : a + b + c = 8 := by
    have h₁₅₁ : a = 1 := h₁₂
    have h₁₅₂ : b = 3 := h₁₃
    have h₁₅₃ : c = 4 := h₁₄
    hole_25
  
  hole_1