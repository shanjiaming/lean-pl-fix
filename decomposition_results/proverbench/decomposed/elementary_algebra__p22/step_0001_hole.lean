theorem inequality_for_positive_reals (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : 2 * a ^ 3 + 2 * b ^ 3 + 2 * c ^ 3 + a ^ 2 * b + b ^ 2 * c + c ^ 2 * a ≥ 3 * a * b ^ 2 + 3 * b * c ^ 2 + 3 * c * a ^ 2 :=
  by
  have h₁ : a ^ 3 + b ^ 3 + c ^ 3 ≥ a ^ 2 * b + b ^ 2 * c + c ^ 2 * a := by sorry
  have h₂ : a ^ 3 + b ^ 3 + c ^ 3 ≥ a * b ^ 2 + b * c ^ 2 + c * a ^ 2 := by sorry
  have h₃ : a ^ 2 * b + b ^ 2 * c + c ^ 2 * a ≥ a * b ^ 2 + b * c ^ 2 + c * a ^ 2 := by sorry
  have h_main :
    2 * a ^ 3 + 2 * b ^ 3 + 2 * c ^ 3 + a ^ 2 * b + b ^ 2 * c + c ^ 2 * a ≥
      3 * a * b ^ 2 + 3 * b * c ^ 2 + 3 * c * a ^ 2 := by sorry
  --  exact h_main
  hole