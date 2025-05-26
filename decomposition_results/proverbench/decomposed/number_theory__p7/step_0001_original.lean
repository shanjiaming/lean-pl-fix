theorem exactly_one_has_integral_solution  : (∃ x y, x ^ 2 - sorry * y ^ 2 = 2) ∨
    (∃ x y, x ^ 2 - sorry * y ^ 2 = -2) ∧ ¬((∃ x y, x ^ 2 - sorry * y ^ 2 = 2) ∧ ∃ x y, x ^ 2 - sorry * y ^ 2 = -2) :=
  by
  have h_main :
    (∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = 2) ∨
      (∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -2) ∧
        ¬((∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = 2) ∧ (∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -2)) := by sorry
  exact h_main