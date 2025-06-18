macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_numbertheory_175 : 2 ^ 2010 % 10 = 4 := by
  have h₀ : (2 ^ 2010 : ℕ) % 10 = 4 := by
    have h₁ : ∀ n : ℕ, n ≥ 1 → 6 ^ n % 10 = 6 := by
      hole_3
    have h₂ : (2 ^ 4 : ℕ) % 10 = 6 := by hole_4
    have h₃ : (2 ^ 2010 : ℕ) % 10 = 4 := by
      have h₄ : (2 ^ 2010 : ℕ) = (2 ^ 4) ^ 502 * 2 ^ 2 := by
        hole_6
      rw [h₄]
      have h₅ : ((2 ^ 4 : ℕ) ^ 502 * 2 ^ 2 : ℕ) % 10 = 4 := by
        have h₅₁ : ((2 ^ 4 : ℕ) ^ 502 * 2 ^ 2 : ℕ) % 10 = ((2 ^ 4 : ℕ) ^ 502 % 10 * (2 ^ 2 % 10)) % 10 := by
          hole_8
        rw [h₅₁]
        have h₅₂ : (2 ^ 4 : ℕ) ^ 502 % 10 = 6 := by
          have h₅₂₁ : (2 ^ 4 : ℕ) % 10 = 6 := by hole_10
          have h₅₂₂ : (2 ^ 4 : ℕ) ^ 502 % 10 = 6 := by
            hole_11
          hole_9
        have h₅₃ : (2 ^ 2 : ℕ) % 10 = 4 := by hole_12
        hole_7
      hole_5
    hole_2
  hole_1