theorem h₅₂ (n p : ℕ) (hp : Nat.Prime p) (hdiv : 3 ∣ polynomial n) (h h₂ : p = 3) (h₃ : 3 ∣ polynomial n) (h₄ : polynomial n % 3 = 0) : n % 3 = 0 ∨ n % 3 = 1 ∨ n % 3 = 2 := by -- omega
  omega