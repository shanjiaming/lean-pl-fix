theorem case_analysis_simple (n : ℕ) : n = 0 ∨ n > 0 :=
  by
  --  cases' n with k
  --  · left
    have h1 : 0 = 0 := rfl
  --    exact h1
  --  · right
    have h1 : k + 1 > 0 := by sorry
    have h2 : Nat.succ k = k + 1 := rfl
    have h3 : k + 1 > 0 := h1
  --    exact h3
  hole