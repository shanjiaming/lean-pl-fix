theorem h₁ (q : ℕ+ → ℚ) (hq : Function.Bijective q) (hq' : Function.Surjective q) (a b : ℝ) (hab : a < b) : {n | (↑(q n) : ℝ) < a} ⊆ {n | (↑(q n) : ℝ) < b} :=
  by
  intro n hn
  have hn' : (q n : ℝ) < a := hn
  have hn'' : (q n : ℝ) < b := by sorry
  exact hn''