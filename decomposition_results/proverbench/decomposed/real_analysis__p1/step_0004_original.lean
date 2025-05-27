theorem h_final (h_main : ∀ (x : ℝ), x ∉ Dom) : Dom = ∅ := by
  apply Set.eq_empty_of_forall_not_mem
  intro x hx
  have h₁ : x ∉ Dom := h_main x
  exact h₁ hx