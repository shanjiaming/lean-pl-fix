macro "hole_1" : tactic => `(tactic| admit)

theorem nat_cast_add_eq {a b : ℕ} (h : a + b = 10) : (a : ℝ) + b + 1 = 6 + 5 := by 
  hole_1