theorem h₁ (p : ℕ) (hp : Nat.Prime p) (hdiv : p ∣ sorry) : p ≠ 3 := by
  intro h
  have h₂ : p = 3 := h
  rw [h₂] at hdiv
  have h₃ : (3 : ℕ) ∣ polynomial n := hdiv
  have h₄ : (polynomial n) % 3 = 0 := by sorry
  have h₅ : (polynomial n) % 3 = 1 := by sorry
  omega