theorem mathd_numbertheory_341 (a b c : ℕ) (h₀ : a ≤ 9 ∧ b ≤ 9 ∧ c ≤ 9)
    (h₁ : Nat.digits 10 (5 ^ 100 % 1000) = [c, b, a]) : a + b + c = 13 := by
  have h₂ : 5 ^ 100 % 1000 = 625 := by
    admit
  
  have h₃ : Nat.digits 10 (5 ^ 100 % 1000) = [5, 2, 6] := by
    admit
  
  have h₄ : [c, b, a] = [5, 2, 6] := by
    admit
  
  have h₅ : a = 6 := by
    admit
  
  have h₆ : b = 2 := by
    admit
  
  have h₇ : c = 5 := by
    admit
  
  have h₈ : a + b + c = 13 := by
    admit
  
  admit