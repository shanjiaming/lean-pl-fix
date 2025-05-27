theorem h₄ (n p : ℕ) (hp : Nat.Prime p) (hdiv : 3 ∣ polynomial n) (h h₂ : p = 3) (h₃ : 3 ∣ polynomial n) : polynomial n % 3 = 0 := by -- omega
  omega