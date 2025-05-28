theorem putnam_1971_a5 (a b : ℤ) (hab : a > 0 ∧ b > 0 ∧ a > b) (pab : ℤ → ℤ → Prop) (hpab : ∀ (x y : ℤ), pab x y ↔ {s | ¬∃ m n, ↑m * x + ↑n * y = ↑s}.ncard = 35 ∧ ¬∃ m n, ↑m * x + ↑n * y = 58) : pab a b ↔ a = (11, 8).1 ∧ b = (11, 8).2 :=
  by
  have h₁ : pab a b ↔ a = 11 ∧ b = 8 := by sorry
  have h₂ : a = ((11, 8) : ℤ × ℤ).1 ∧ b = ((11, 8) : ℤ × ℤ).2 ↔ a = 11 ∧ b = 8 := by sorry
  --  sorry
  hole