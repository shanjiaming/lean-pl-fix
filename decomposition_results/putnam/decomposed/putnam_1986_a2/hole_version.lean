macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1986_a2
: (Nat.floor ((10 ^ 20000 : ℝ) / (10 ^ 100 + 3)) % 10 = ((3) : ℕ )) := by
  have h_main : Nat.floor ((10 ^ 20000 : ℝ) / (10 ^ 100 + 3)) % 10 = 3 := by
    have h₁ : Nat.floor ((10 ^ 20000 : ℝ) / (10 ^ 100 + 3)) % 10 = 3 := by
      
      have h₂ : (3 : ℕ) ^ 200 < 10 ^ 100 + 3 := by
        hole_4
      
      
      have h₃ : Nat.floor ((10 ^ 20000 : ℝ) / (10 ^ 100 + 3)) = (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) := by
        have h₄ : (10 : ℝ) ^ 20000 / (10 ^ 100 + 3) = ((10 : ℝ) ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) + (3 : ℝ) ^ 200 / (10 ^ 100 + 3) := by
          hole_6
        have h₅ : (0 : ℝ) < (3 : ℝ) ^ 200 / (10 ^ 100 + 3) := by hole_7
        have h₆ : (3 : ℝ) ^ 200 / (10 ^ 100 + 3) < 1 := by
          have h₇ : (3 : ℝ) ^ 200 < (10 : ℝ) ^ 100 + 3 := by
            hole_9
          have h₈ : (0 : ℝ) < (10 : ℝ) ^ 100 + 3 := by hole_10
          hole_8
        have h₇ : (Nat.floor ((10 : ℝ) ^ 20000 / (10 ^ 100 + 3)) : ℝ) = (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) := by
          rw [h₄]
          have h₈ : (Nat.floor (((10 : ℝ) ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) + (3 : ℝ) ^ 200 / (10 ^ 100 + 3)) : ℝ) = ((10 : ℝ) ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) := by
            hole_12
          hole_11
        have h₈ : (Nat.floor ((10 : ℝ) ^ 20000 / (10 ^ 100 + 3)) : ℕ) = (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) := by
          hole_13
        hole_5
      
      
      rw [h₃]
      have h₄ : (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) % 10 = 3 := by
        
        hole_14
      hole_3
    hole_2
  hole_1