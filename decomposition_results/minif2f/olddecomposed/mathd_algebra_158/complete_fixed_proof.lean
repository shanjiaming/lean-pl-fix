theorem mathd_algebra_158 (a : ℕ) (h₀ : Even a)
    (h₁ : ↑(∑ k in Finset.range 8, 2 * k + 1) - ↑(∑ k in Finset.range 5, a + 2 * k) = (4 : ℤ)) :
    a = 8 := by
  have h₂ : ∑ k in Finset.range 8, (2 * k + 1 : ℕ) = 64 := by
    admit
  
  have h₃ : ∑ k in Finset.range 5, (a + 2 * k : ℕ) = 5 * a + 20 := by
    admit
  
  have h₄ : a = 8 := by
    have h₅ : (∑ k in Finset.range 8, 2 * k + 1 : ℕ) = 64 := by
      admit
    have h₆ : (∑ k in Finset.range 5, a + 2 * k : ℕ) = 5 * a + 20 := by
      admit
    have h₇ : (64 : ℤ) - (5 * a + 20 : ℤ) = (4 : ℤ) := by
      have h₇₁ : (↑(∑ k in Finset.range 8, 2 * k + 1) : ℤ) = (64 : ℤ) := by
        admit
      have h₇₂ : (↑(∑ k in Finset.range 5, a + 2 * k) : ℤ) = (5 * a + 20 : ℤ) := by
        admit
      have h₇₃ : (↑(∑ k in Finset.range 8, 2 * k + 1) : ℤ) - (↑(∑ k in Finset.range 5, a + 2 * k) : ℤ) = (4 : ℤ) := by
        admit
      admit
    have h₈ : a = 8 := by
      have h₈₁ : (a : ℤ) = 8 := by
        have h₈₂ : (64 : ℤ) - (5 * a + 20 : ℤ) = (4 : ℤ) := by admit
        have h₈₃ : (5 : ℤ) * a + 20 = 60 := by admit
        have h₈₄ : (a : ℤ) = 8 := by
          admit
        admit
      have h₈₂ : a = 8 := by
        admit
      admit
    admit
  
  admit