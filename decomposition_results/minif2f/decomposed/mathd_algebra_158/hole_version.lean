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

theorem mathd_algebra_158 (a : ℕ) (h₀ : Even a)
    (h₁ : ↑(∑ k in Finset.range 8, 2 * k + 1) - ↑(∑ k in Finset.range 5, a + 2 * k) = (4 : ℤ)) :
    a = 8 := by
  have h₂ : ∑ k in Finset.range 8, (2 * k + 1 : ℕ) = 64 := by
    hole_1
  
  have h₃ : ∑ k in Finset.range 5, (a + 2 * k : ℕ) = 5 * a + 20 := by
    hole_2
  
  have h₄ : a = 8 := by
    have h₅ : (∑ k in Finset.range 8, 2 * k + 1 : ℕ) = 64 := by
      hole_3
    have h₆ : (∑ k in Finset.range 5, a + 2 * k : ℕ) = 5 * a + 20 := by
      hole_4
    have h₇ : (64 : ℤ) - (5 * a + 20 : ℤ) = (4 : ℤ) := by
      have h₇₁ : (↑(∑ k in Finset.range 8, 2 * k + 1) : ℤ) = (64 : ℤ) := by
        hole_5
      have h₇₂ : (↑(∑ k in Finset.range 5, a + 2 * k) : ℤ) = (5 * a + 20 : ℤ) := by
        hole_6
      have h₇₃ : (↑(∑ k in Finset.range 8, 2 * k + 1) : ℤ) - (↑(∑ k in Finset.range 5, a + 2 * k) : ℤ) = (4 : ℤ) := by
        hole_7
      hole_8
    have h₈ : a = 8 := by
      have h₈₁ : (a : ℤ) = 8 := by
        have h₈₂ : (64 : ℤ) - (5 * a + 20 : ℤ) = (4 : ℤ) := by hole_9
        have h₈₃ : (5 : ℤ) * a + 20 = 60 := by hole_10
        have h₈₄ : (a : ℤ) = 8 := by
          hole_11
        hole_12
      have h₈₂ : a = 8 := by
        hole_13
      hole_14
    hole_15
  
  hole_16