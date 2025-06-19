macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem putnam_1971_a5
    (a b : ℤ)
    (hab : a > 0 ∧ b > 0 ∧ a > b)
    (pab : ℤ → ℤ → Prop)
    (hpab : ∀ x y, pab x y ↔
      {s : ℕ | ¬∃ m n : ℕ, m*x + n*y = s}.ncard = 35 ∧
      ¬∃ m n : ℕ, m*x + n*y = 58) :
    pab a b ↔ a = ((11, 8) : ℤ × ℤ ).1 ∧ b = ((11, 8) : ℤ × ℤ ).2 := by
  have h₁ : pab a b ↔ a = 11 ∧ b = 8 := by hole_1
  have h₂ : a = ((11, 8) : ℤ × ℤ).1 ∧ b = ((11, 8) : ℤ × ℤ).2 ↔ a = 11 ∧ b = 8 := by hole_2
  hole_3