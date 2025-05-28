theorem h_main  : {n | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)}.encard = ↑2301 :=
  by
  have h₁ : {n : ℤ | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)}.encard = (2301 : ℕ) := by sorry
  exact h₁