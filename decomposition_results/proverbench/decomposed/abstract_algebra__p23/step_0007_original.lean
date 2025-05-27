theorem h_main (h0 : 0 ∈ {x | eval x f = 0}) (h1 : 1 ∉ {x | eval x f = 0}) (h2 : 2 ∉ {x | eval x f = 0}) (h3 : 3 ∉ {x | eval x f = 0}) (h4 : 4 ∈ {x | eval x f = 0}) : {x | eval x f = 0} = {0, 4} :=
  by
  apply Set.Subset.antisymm
  · intro x hx
    have h : eval x f = 0 := hx
    have h5 : x = 0 ∨ x = 4 := by sorry
    cases h5 with
    | inl h5 => simp [h5]
    | inr h5 => simp [h5]
  · intro x hx
    have h5 : x = 0 ∨ x = 4 := by sorry
    cases h5 with
    | inl h5 =>
      rw [h5]
      exact h0
    | inr h5 =>
      rw [h5]
      exact h4