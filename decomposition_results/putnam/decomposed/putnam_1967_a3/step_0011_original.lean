theorem h_main (h₅_mem : sorry) (h_is_least :  ∀ a' ∈ {a | ∃ P, P.degree = 2 ∧ (∃ z1 z2, z1 ≠ z2 ∧ sorry = 0 ∧ sorry = 0) ∧ P.coeff 2 = a ∧ a > 0}, (↑5 : ℤ) ≤ a') : IsLeast {a | ∃ P, P.degree = 2 ∧ (∃ z1 z2, z1 ≠ z2 ∧ sorry = 0 ∧ sorry = 0) ∧ P.coeff 2 = a ∧ a > 0} (↑5 : ℤ) :=
  by
  refine' ⟨h₅_mem, _⟩
  intro a' ha'
  exact h_is_least a' ha'