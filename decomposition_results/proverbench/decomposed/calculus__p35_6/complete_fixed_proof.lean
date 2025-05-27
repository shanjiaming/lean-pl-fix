theorem local_extrema :
  (∃ x, IsLocalMax f x) ∧ (∃ x, IsLocalMin f x) ∧ (∀ x, IsLocalMax f x ∨ IsLocalMin f x → x = 2 ∨ x = 4):=
  by
  have h₁ : ∃ x, IsLocalMax f x:= by
    --  refine' ⟨2, _⟩
    --  exact local_max_at_2
    hole
  have h₂ : ∃ x, IsLocalMin f x:= by
    --  refine' ⟨4, _⟩
    --  exact local_min_at_4
    hole
  have h₃ : ∀ x, IsLocalMax f x ∨ IsLocalMin f x → x = 2 ∨ x = 4:=
    by
    --  intro x hx
    --  exact only_local_extrema x hx
    hole
  --  exact ⟨h₁, h₂, h₃⟩
  norm_cast