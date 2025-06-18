theorem mathd_numbertheory_521 (m n : ℕ) (h₀ : Even m) (h₁ : Even n) (h₂ : m - n = 2)
    (h₃ : m * n = 288) : m = 18 := by
  have h₄ : n ≥ 2 := by
    by_contra h
    
    have h₅ : n = 0 := by
      have h₅₁ : n ≤ 1 := by
        linarith
      have h₅₂ : Even n := h₁
      have h₅₃ : n % 2 = 0 := by
        admit
      have h₅₄ : n = 0 := by
        omega
      linarith
    
    have h₆ : m = 2 := by
      have h₆₁ : m - n = 2 := h₂
      have h₆₂ : n = 0 := h₅
      nlinarith
    
    have h₇ : m * n = 288 := h₃
    nlinarith
  
  have h₅ : m = n + 2 := by
    have h₅₁ : m ≥ n + 2 := by
      by_contra h₅₁
      have h₅₂ : m < n + 2 := by linarith
      have h₅₃ : m ≤ n + 1 := by linarith
      have h₅₄ : m - n ≤ 1 := by
        have h₅₄₁ : m ≤ n + 1 := h₅₃
        have h₅₄₂ : m - n ≤ 1 := by
          omega
        linarith
      have h₅₅ : m - n = 2 := h₂
      linarith
    have h₅₂ : m < n + 3 := by
      by_contra h₅₂
      have h₅₃ : m ≥ n + 3 := by linarith
      have h₅₄ : m - n ≥ 3 := by
        have h₅₄₁ : m ≥ n + 3 := h₅₃
        have h₅₄₂ : m - n ≥ 3 := by
          omega
        linarith
      have h₅₅ : m - n = 2 := h₂
      linarith
    have h₅₃ : m = n + 2 := by
      linarith
    linarith
  
  have h₆ : n = 16 := by
    rw [h₅] at h₃
    have h₆₁ : (n + 2) * n = 288 := by
      linarith
    have h₆₂ : n ≤ 16 := by
      by_contra h₆₂
      have h₆₃ : n ≥ 17 := by linarith
      have h₆₄ : (n + 2) * n > 288 := by
        have h₆₅ : n ≥ 17 := h₆₃
        have h₆₆ : (n + 2) * n ≥ 19 * n := by
          nlinarith
        have h₆₇ : 19 * n > 288 := by
          linarith
        linarith
      linarith
    nlinarith
  
  have h₇ : m = 18 := by
    linarith
  
  linarith
