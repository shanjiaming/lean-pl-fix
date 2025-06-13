macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem simp_then_have_chain (x y : ℕ) (h : x + 0 = y + 0) : x = y := by
  simp at h
  have h1 : x ≤ y ∨ y ≤ x := le_total x y
  cases' h1 with h_le h_ge
  · 
    have h2 : x = y := by
      have h3 : x ≤ y := h_le
      have h4 : y ≤ x := by
        hole_3
      hole_2
    exact h2
  · 
    have h2 : x = y := by
      have h3 : y ≤ x := h_ge
      have h4 : x ≤ y := by
        hole_5
      hole_4
    hole_1