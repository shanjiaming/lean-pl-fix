macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem multiline_have_test (n : ℕ) (h : n > 0) : n + n ≥ n := by
  have h1 : n ≥ 1 := by
    hole_2
  have h2 : n + n ≥ 
        n + 1 := by
    have h3 : n ≥ 1 := h1
    have h4 : n + n = 
          n + n := rfl
    have h5 : n + 1 ≤ 
        n + n := by
      hole_4
    hole_3
  have h6 : n + 1 ≥ 
      n := by
    hole_5
  hole_1