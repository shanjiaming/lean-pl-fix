theorem h6 (R : Type) (inst✝ : Ring R) (h : ∀ (a : R), a ^ 3 = a) : ∀ (a : R), 6 • a = 0 := by
  intro a
  have h₁ : (2 : ℕ) • a * ((2 : ℕ) • a * ((2 : ℕ) • a)) = (2 : ℕ) • a := by sorry
  have h₃ : (6 : ℕ) • a = 0 := by sorry
  exact h₃