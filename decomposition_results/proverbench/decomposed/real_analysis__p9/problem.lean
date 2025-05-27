theorem bounded_function_on_subset :
  (∃ M > 0, ∀ x ∈ X, |f x| ≤ M) → BoundedOn f X := by
  intro h
  have h₁ : BddAbove (f '' X) := by
    obtain ⟨M, hM_pos, hM⟩ := h
    refine' ⟨M, _⟩
    rintro _ ⟨x, hx, rfl⟩
    have h₂ : |f x| ≤ M := hM x hx
    have h₃ : f x ≤ M := by linarith [abs_le.mp h₂]
    exact h₃
  
  have h₂ : BddBelow (f '' X) := by
    obtain ⟨M, hM_pos, hM⟩ := h
    refine' ⟨-M, _⟩
    rintro _ ⟨x, hx, rfl⟩
    have h₃ : |f x| ≤ M := hM x hx
    have h₄ : -M ≤ f x := by
      have h₅ : -M ≤ -|f x| := by
        have h₅₁ : |f x| ≤ M := hM x hx
        linarith
      have h₅₂ : -|f x| ≤ f x := by
        cases' abs_cases (f x) with h₅₂ h₅₂ <;> linarith
      linarith
    exact h₄
  
  have h₃ : BoundedOn f X := by
    exact ⟨h₁, h₂⟩
  
  exact h₃