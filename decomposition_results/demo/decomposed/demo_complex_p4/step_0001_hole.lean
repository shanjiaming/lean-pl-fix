theorem simp_then_have_chain (x y : ℕ) (h : x + 0 = y + 0) : x = y :=
  by
  --  simp at h
  have h1 : x ≤ y ∨ y ≤ x := le_total x y
  --  cases' h1 with h_le h_ge
  ·
    have h2 : x = y := by sorry
  --    exact h2
  ·
    have h2 : x = y := by sorry
  --    exact h2
  hole