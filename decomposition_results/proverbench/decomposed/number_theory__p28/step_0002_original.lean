theorem h_main (p : ℕ) (hp : Prime p) (N : ℕ := ∏ k ∈ range (p - 1), (k ^ 2 + 1)) : if p % 4 = 3 then N % p = 4 else N % p = 0 :=
  by
  have h₁ : p = 2 → N % p = 0 := by sorry
  have h₂ : p = 3 → N % p = 4 := by sorry
  have h₃ : p = 5 → N % p = 0 := by sorry
  have h₄ : p = 7 → N % p = 4 := by sorry
  have h₅ : p = 11 → N % p = 4 := by sorry
  have h₆ : p % 4 = 3 → N % p = 4 := by sorry
  have h₇ : p % 4 ≠ 3 → N % p = 0 := by sorry
  split_ifs with h
  · apply h₆
    exact h
  · apply h₇
    exact h