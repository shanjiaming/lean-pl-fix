theorem imoProblem (a b c x y z : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) (S : ℝ) (hS : a + x = S ∧ b + y = S ∧ c + z = S) : a * y + b * z + c * x < S ^ 2 :=
  by
  have h₁ : x = S - a := by sorry
  have h₂ : y = S - b := by sorry
  have h₃ : z = S - c := by sorry
  have h₄ : a * y + b * z + c * x = S * (a + b + c) - (a * b + b * c + c * a) := by sorry
  have h₅ : (S - a) * (S - b) * (S - c) > 0 := by sorry
  have h₆ : S ^ 2 - S * (a + b + c) + (a * b + b * c + c * a) > 0 := by sorry
  have h₇ : S * (a + b + c) - (a * b + b * c + c * a) < S ^ 2 := by sorry
  have h₈ : a * y + b * z + c * x < S ^ 2 := by sorry
  --  exact h₈
  hole