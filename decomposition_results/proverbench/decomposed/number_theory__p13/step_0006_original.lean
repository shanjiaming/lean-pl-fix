theorem h_main (d x : ℤ) (hd : d ∣ 5 * x ^ 2 + 1) (h_odd : Odd d) (h_pos : 0 < d) (hd_not_div_five : d % 5 ≠ 0) : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 :=
  by
  have h₁ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by sorry
  have h₃ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by sorry
  cases h₃ with
  | inl h₃ => norm_num [h₃] at * <;> omega
  | inr h₃ =>
    cases h₃ with
    | inl h₃ => norm_num [h₃] at * <;> omega
    | inr h₃ =>
      cases h₃ with
      | inl h₃ => norm_num [h₃] at * <;> omega
      | inr h₃ => norm_num [h₃] at * <;> omega