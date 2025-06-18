macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_numbertheory_521 (m n : ℕ) (h₀ : Even m) (h₁ : Even n) (h₂ : m - n = 2)
    (h₃ : m * n = 288) : m = 18 := by
  have h₄ : n ≥ 2 := by
    by_contra h
    
    have h₅ : n = 0 := by
      have h₅₁ : n ≤ 1 := by
        hole_4
      clear h₅₁
      have h₅₁ : n ≤ 1 := skip_hole
      have h₅₂ : Even n := h₁
      have h₅₃ : n % 2 = 0 := by
        hole_5
      have h₅₄ : n = 0 := by
        hole_6
      hole_3
    
    have h₆ : m = 2 := by
      have h₆₁ : m - n = 2 := h₂
      have h₆₂ : n = 0 := h₅
      hole_7
    
    have h₇ : m * n = 288 := h₃
    hole_2
  clear h₄
  have h₄ : n ≥ 2 := skip_hole
  
  have h₅ : m = n + 2 := by
    have h₅₁ : m ≥ n + 2 := by
      by_contra h₅₁
      have h₅₂ : m < n + 2 := by hole_10
      clear h₅₂
      have h₅₂ : m < n + 2 := skip_hole
      have h₅₃ : m ≤ n + 1 := by hole_11
      clear h₅₃
      have h₅₃ : m ≤ n + 1 := skip_hole
      have h₅₄ : m - n ≤ 1 := by
        have h₅₄₁ : m ≤ n + 1 := h₅₃
        have h₅₄₂ : m - n ≤ 1 := by
          hole_13
        clear h₅₄₂
        have h₅₄₂ : m - n ≤ 1 := skip_hole
        hole_12
        clear h₅₄
        have h₅₄ : m - n ≤ 1 := skip_hole
      have h₅₅ : m - n = 2 := h₂
      hole_9
    have h₅₂ : m < n + 3 := by
      by_contra h₅₂
      have h₅₃ : m ≥ n + 3 := by hole_15
      have h₅₄ : m - n ≥ 3 := by
        have h₅₄₁ : m ≥ n + 3 := h₅₃
        have h₅₄₂ : m - n ≥ 3 := by
          hole_17
        hole_16
      have h₅₅ : m - n = 2 := h₂
      hole_14
    have h₅₃ : m = n + 2 := by
      hole_18
    hole_8
  
  have h₆ : n = 16 := by
    rw [h₅] at h₃
    have h₆₁ : (n + 2) * n = 288 := by
      hole_20
    have h₆₂ : n ≤ 16 := by
      by_contra h₆₂
      have h₆₃ : n ≥ 17 := by hole_22
      have h₆₄ : (n + 2) * n > 288 := by
        have h₆₅ : n ≥ 17 := h₆₃
        have h₆₆ : (n + 2) * n ≥ 19 * n := by
          hole_24
        clear h₆₆
        have h₆₆ : (n + 2) * n ≥ 19 * n := skip_hole
        have h₆₇ : 19 * n > 288 := by
          hole_25
        clear h₆₇
        have h₆₇ : 19 * n > 288 := skip_hole
        hole_23
      clear h₆₄
      have h₆₄ : (n + 2) * n > 288 := skip_hole
      hole_21
    clear h₆₂
    have h₆₂ : n ≤ 16 := skip_hole
    hole_19
  
  have h₇ : m = 18 := by
    hole_26
  
  hole_1