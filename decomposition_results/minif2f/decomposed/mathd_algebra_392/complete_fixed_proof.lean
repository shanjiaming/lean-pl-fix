theorem mathd_algebra_392 (n : ℕ) (h₀ : Even n)
    (h₁ : (↑n - 2) ^ 2 + ↑n ^ 2 + (↑n + 2) ^ 2 = (12296 : ℤ)) :
    (↑n - 2) * ↑n * (↑n + 2) / 8 = (32736 : ℤ) := by
  have h₂ : (n : ℤ) ^ 2 = 4096 := by
    have h₂₁ : 3 * (n : ℤ) ^ 2 + 8 = 12296 := by
      have h₂₂ : (↑n - 2 : ℤ) ^ 2 + (↑n : ℤ) ^ 2 + (↑n + 2 : ℤ) ^ 2 = 12296 := by admit
      admit
    have h₂₂ : (n : ℤ) ^ 2 = 4096 := by
      have h₂₃ : 3 * (n : ℤ) ^ 2 = 12288 := by admit
      have h₂₄ : (n : ℤ) ^ 2 = 4096 := by admit
      admit
    admit
  
  have h₃ : n = 64 := by
    have h₃₁ : n ≤ 64 := by
      by_contra h
      have h₃₂ : n ≥ 65 := by
        admit
      have h₃₃ : (n : ℤ) ^ 2 > 4096 := by
        have h₃₄ : (n : ℤ) ≥ 65 := by
          admit
        admit
      admit
    admit
  
  have h₄ : (↑n - 2) * ↑n * (↑n + 2) / 8 = (32736 : ℤ) := by
    admit
  
  admit