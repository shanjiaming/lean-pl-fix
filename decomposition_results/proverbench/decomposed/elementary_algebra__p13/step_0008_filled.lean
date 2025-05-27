theorem h₅₂ (a b c x y z : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) (S : ℝ) (hS : a + x = S ∧ b + y = S ∧ c + z = S) (h₁ : x = S - a) (h₂ : y = S - b) (h₃ : z = S - c) (h₄ : a * y + b * z + c * x = S * (a + b + c) - (a * b + b * c + c * a)) (h₅₁ : S - a > 0) : S - b > 0 := by
  have h₅₂₁ : b + y = S := hS.2.1
  have h₅₂₂ : y > 0 := hy
  --  linarith
  linarith