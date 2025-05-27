theorem imo_inequality (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : a ^ 2 * (s a b c - a) + b ^ 2 * (s a b c - b) + c ^ 2 * (s a b c - c) ≤ 3 / 2 * a * b * c :=
  by
  have h1 :
    a ^ 2 * ((s a b c) - a) + b ^ 2 * ((s a b c) - b) + c ^ 2 * ((s a b c) - c) =
      (a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c)) / 2 := by sorry
  have h2 : a ^ 2 * (b + c - a) + b ^ 2 * (a + c - b) + c ^ 2 * (a + b - c) ≤ 3 * a * b * c := by sorry
  have h3 : a ^ 2 * ((s a b c) - a) + b ^ 2 * ((s a b c) - b) + c ^ 2 * ((s a b c) - c) ≤ (3 / 2) * a * b * c := by sorry
  exact h3