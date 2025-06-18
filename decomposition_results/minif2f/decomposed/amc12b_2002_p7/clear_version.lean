macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem amc12b_2002_p7 (a b c : ℕ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c) (h₁ : b = a + 1) (h₂ : c = b + 1)
    (h₃ : a * b * c = 8 * (a + b + c)) : a ^ 2 + (b ^ 2 + c ^ 2) = 77 := by
  have h₄ : c = a + 2 := by
    have h₄₁ : c = a + 2 := by
      hole_3
    hole_2
  
  have h₅ : a * (a + 1) * (a + 2) = 24 * (a + 1) := by
    have h₅₁ : a * b * c = 8 * (a + b + c) := h₃
    have h₅₂ : b = a + 1 := h₁
    have h₅₃ : c = a + 2 := h₄
    hole_4
  
  have h₆ : a = 4 := by
    have h₆₁ : a ≤ 6 := by
      by_contra h
      have h₆₂ : a ≥ 7 := by
        hole_7
      clear h₆₂
      have h₆₂ : a ≥ 7 := skip_hole
      have h₆₃ : a * (a + 1) * (a + 2) > 24 * (a + 1) := by
        have h₆₄ : a ≥ 7 := h₆₂
        have h₆₅ : a * (a + 1) * (a + 2) > 24 * (a + 1) := by
          have h₆₆ : a * (a + 1) * (a + 2) = a * (a + 1) * (a + 2) := rfl
          have h₆₇ : 24 * (a + 1) = 24 * (a + 1) := rfl
          have h₆₈ : a * (a + 1) * (a + 2) > 24 * (a + 1) := by
            have h₆₉ : a * (a + 2) ≥ 7 * 9 := by
              hole_11
            clear h₆₉
            have h₆₉ : a * (a + 2) ≥ 7 * 9 := skip_hole
            hole_10
          clear h₆₈
          have h₆₈ : a * (a + 1) * (a + 2) > 24 * (a + 1) := skip_hole
          hole_9
        clear h₆₅
        have h₆₅ : a * (a + 1) * (a + 2) > 24 * (a + 1) := skip_hole
        hole_8
      clear h₆₃
      have h₆₃ : a * (a + 1) * (a + 2) > 24 * (a + 1) := skip_hole
      hole_6
    clear h₆₁
    have h₆₁ : a ≤ 6 := skip_hole
    hole_5
  
  have h₇ : b = 5 := by
    hole_12
  
  have h₈ : c = 6 := by
    hole_13
  
  have h₉ : a ^ 2 + (b ^ 2 + c ^ 2) = 77 := by
    hole_14
  
  hole_1