macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_numbertheory_341 (a b c : ℕ) (h₀ : a ≤ 9 ∧ b ≤ 9 ∧ c ≤ 9)
    (h₁ : Nat.digits 10 (5 ^ 100 % 1000) = [c, b, a]) : a + b + c = 13 := by
  have h₂ : 5 ^ 100 % 1000 = 625 := by
    hole_2
  
  have h₃ : Nat.digits 10 (5 ^ 100 % 1000) = [5, 2, 6] := by
    hole_3
  
  have h₄ : [c, b, a] = [5, 2, 6] := by
    hole_4
  
  have h₅ : a = 6 := by
    hole_5
  
  have h₆ : b = 2 := by
    hole_6
  
  have h₇ : c = 5 := by
    hole_7
  
  have h₈ : a + b + c = 13 := by
    hole_8
  
  hole_1