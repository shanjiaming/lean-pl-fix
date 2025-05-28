theorem h₅ (a : ℤ) (b : ℕ) (h₀ : Odd a) (h₁ : 4 ∣ b) (h₂ : a ^ 2 % 8 = 1) (h₃ : ↑(b ^ 2) % 8 = 0) (h₄ : (a ^ 2 + ↑b ^ 2) % 8 = 1) : (a ^ 2 + ↑b ^ 2) % 8 = 1 :=
  by
  have h₅₁ : (a ^ 2 + b ^ 2 : ℤ) = (a ^ 2 + (b ^ 2 : ℤ)) := by sorry
  --  rw [h₅₁]
  --  exact h₄
  linarith