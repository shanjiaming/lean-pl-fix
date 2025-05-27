theorem h₂ (p : ℕ) (hp : Nat.Prime p) (h_main : p = 2 ∨ p ≠ 2) (h_case_p_eq_2 : p = 2 → ∃ a b, (a ^ 2 + b ^ 2 + 1) % ↑p = 0) (h_p_ne_2 : p ≠ 2) (this : Fact (Nat.Prime p)) (h₁ : p ≠ 2) : p % 4 = 1 ∨ p % 4 = 3 := by
  have h₃ := Nat.Prime.eq_one_or_self_of_dvd hp 2
  have h₄ := Nat.Prime.eq_one_or_self_of_dvd hp 4
  have h₅ : p % 2 = 1 := by sorry
  have h₆ := h₃
  have h₇ : p % 4 = 1 ∨ p % 4 = 3 := by sorry
  --  exact h₇
  omega