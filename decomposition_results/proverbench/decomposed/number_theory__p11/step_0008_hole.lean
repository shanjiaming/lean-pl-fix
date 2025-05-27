theorem h₅ (p : ℕ) (hp : Nat.Prime p) (h_main : p = 2 ∨ p ≠ 2) (h_case_p_eq_2 : p = 2 → ∃ a b, (a ^ 2 + b ^ 2 + 1) % ↑p = 0) (h_p_ne_2 : p ≠ 2) (this : Fact (Nat.Prime p)) (h₁ : p ≠ 2) (h₃ : 2 ∣ p → 2 = 1 ∨ 2 = p) (h₄ : 4 ∣ p → 4 = 1 ∨ 4 = p) : p % 2 = 1 := by
  --  by_contra h₅
  have h₆ : p % 2 = 0 := by sorry
  have h₇ : 2 ∣ p := by sorry
  have h₈ : p = 2 := by sorry
  --  contradiction
  hole