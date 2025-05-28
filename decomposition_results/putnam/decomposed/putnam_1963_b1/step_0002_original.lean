theorem h_main (a : ℤ) : X ^ 2 - X + C a ∣ X ^ 13 + X + C 90 ↔ a = 2 :=
  by
  constructor
  · intro h
    have h₁ : a = 2 := by sorry
    exact h₁
  · intro h
    rw [h]
    have h₁ : (X ^ 2 - X + C (2 : ℤ)) ∣ (X ^ 13 + X + C 90) := by sorry
    exact h₁