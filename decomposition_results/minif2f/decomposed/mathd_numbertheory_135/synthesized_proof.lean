theorem mathd_numbertheory_135 (n A B C : ℕ) (h₀ : n = 3 ^ 17 + 3 ^ 10) (h₁ : 11 ∣ n + 1)
    (h₂ : [A, B, C].Pairwise (· ≠ ·)) (h₃ : {A, B, C} ⊂ Finset.Icc 0 9) (h₄ : Odd A ∧ Odd C)
    (h₅ : ¬3 ∣ B) (h₆ : Nat.digits 10 n = [B, A, B, C, C, A, C, B, A]) :
    100 * A + 10 * B + C = 129 := by
  have h₇ : n = 129199212 := by
    linarith
  
  have h₈ : B = 2 := by
    admit
  
  have h₉ : A = 1 := by
    admit
  
  have h₁₀ : C = 9 := by
    admit
  
  have h₁₁ : 100 * A + 10 * B + C = 129 := by
    linarith
  
  linarith
