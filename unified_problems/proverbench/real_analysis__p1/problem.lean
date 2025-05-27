theorem f_domain_empty : Dom = ∅ := by
  have h_main : ∀ (x : ℝ), x ∉ Dom := by
    intro x hx
    have h₁ : -1 - x ≥ 0 := hx.1
    have h₂ : x > 0 := hx.2
    have h₃ : -1 - x < 0 := by
      linarith
    linarith
  
  have h_final : Dom = ∅ := by
    apply Set.eq_empty_of_forall_not_mem
    intro x hx
    have h₁ : x ∉ Dom := h_main x
    exact h₁ hx
  
  exact h_final