theorem h3 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (h1 :  a ^ 2 * (s a b c - a) + b ^ 2 * (s a b c - b) + c ^ 2 * (s a b c - c) =    (a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c)) / 2) (h2 : a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c) ≤ 3 * a * b * c) : a ^ 2 * (s a b c - a) + b ^ 2 * (s a b c - b) + c ^ 2 * (s a b c - c) ≤ 3 / 2 * a * b * c :=
  by
  have h₃ :
    a ^ 2 * ((s a b c) - a) + b ^ 2 * ((s a b c) - b) + c ^ 2 * ((s a b c) - c) =
      (a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c)) / 2 :=
    h1
  --  rw [h₃]
  have h₄ : (a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c)) / 2 ≤ (3 / 2 : ℝ) * a * b * c := by sorry
  --  linarith
  linarith