theorem h_final (p : ℕ) (hp : Nat.Prime p) (h_main : p = 2 ∨ p ≠ 2) (h_case_p_eq_2 : p = 2 → ∃ a b, (a ^ 2 + b ^ 2 + 1) % (↑p : ℤ) = 0) (h_case_p_ne_2 : p ≠ 2 → ∃ a b, (a ^ 2 + b ^ 2 + 1) % (↑p : ℤ) = 0) : ∃ a b, (a ^ 2 + b ^ 2 + 1) % (↑p : ℤ) = 0 := by
  cases h_main with
  | inl h₁ => exact h_case_p_eq_2 h₁
  | inr h₁ => exact h_case_p_ne_2 h₁