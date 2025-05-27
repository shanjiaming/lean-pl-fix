theorem h2 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (h1 :  a ^ 2 * (s a b c - a) + b ^ 2 * (s a b c - b) + c ^ 2 * (s a b c - c) =    (a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c)) / 2) : a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c) ≤ 3 * a * b * c :=
  by
  have h₂ : a > 0 := ha
  have h₃ : b > 0 := hb
  have h₄ : c > 0 := hc
  have h₅ :
    a ^ 3 + b ^ 3 + c ^ 3 + 3 * a * b * c ≥ a ^ 2 * b + a * b ^ 2 + a ^ 2 * c + a * c ^ 2 + b ^ 2 * c + b * c ^ 2 := by sorry
  have h₆ : a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c) ≤ 3 * a * b * c := by sorry
  --  exact h₆
  hole