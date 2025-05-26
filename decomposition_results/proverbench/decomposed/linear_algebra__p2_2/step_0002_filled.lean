theorem h_main  : ∃ inv, sorry * inv = 1 ∧ inv * sorry = 1 ∧ sorry = inv :=
  by
  --  refine' ⟨A_inv, _⟩
  have h₁ : A * A_inv = 1 := verify_inverse.1
  have h₂ : A_inv * A = 1 := verify_inverse.2
  --  exact ⟨h₁, h₂, rfl⟩
  hole