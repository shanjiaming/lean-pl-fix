macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_numbertheory_320 (n : ℕ) (h₀ : n < 101) (h₁ : 101 ∣ 123456 - n) : n = 34 := by
  have h₂ : 123456 % 101 = 34 := by
    hole_2
  
  have h₃ : n % 101 = 34 := by
    have h₄ : (123456 - n) % 101 = 0 := by
      hole_4
    have h₅ : (123456 % 101) = 34 := h₂
    have h₆ : (123456 - n) % 101 = (123456 % 101 - n % 101) % 101 := by
      have h₇ : (123456 - n) % 101 = (123456 % 101 - n % 101) % 101 := by
        hole_6
      hole_5
    rw [h₆] at h₄
    have h₇ : (123456 % 101 - n % 101) % 101 = 0 := h₄
    have h₈ : (34 - n % 101) % 101 = 0 := by
      hole_7
    have h₉ : n % 101 = 34 := by
      have h₁₀ : n % 101 < 101 := Nat.mod_lt n (by norm_num)
      have h₁₁ : 34 - n % 101 = 0 := by
        by_contra h
        have h₁₂ : 34 - n % 101 > 0 := by
          have h₁₃ : 34 - n % 101 ≠ 0 := h
          have h₁₄ : 34 - n % 101 > 0 := by
            by_contra h₁₅
            have h₁₆ : 34 - n % 101 = 0 := by hole_12
            hole_11
          clear h₁₄
          have h₁₄ : 34 - n % 101 > 0 := skip_hole
          hole_10
        clear h₁₂
        have h₁₂ : 34 - n % 101 > 0 := skip_hole
        have h₁₅ : (34 - n % 101) % 101 = 34 - n % 101 := by
          hole_13
        hole_9
      hole_8
    hole_3
  
  have h₄ : n = 34 := by
    have h₅ : n % 101 = n := by
      hole_15
    hole_14
  
  hole_1