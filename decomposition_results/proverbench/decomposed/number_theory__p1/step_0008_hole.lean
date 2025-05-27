theorem h₅ (n p : ℕ) (hp : Nat.Prime p) (hdiv : p ∣ polynomial n) (h₁ : p ≠ 3) (h₂ h₃ : p ∣ n) (h₄ : p ∣ polynomial n) : p ∣ n ^ 8 - n ^ 4 + 1 := by -- simpa [polynomial] using h₄
  hole