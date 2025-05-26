theorem h₀₇ (h₀₃ : sorry) (h₀₆ : sorry) : sorry :=
  by
  apply tendsto_nhds_of_eq_on_compl_singleton _ _ _ h₀₆
  ·
    have h₀₈ : (3 : ℝ) ∉ ({ 3 }ᶜ : Set ℝ) := by simp
    aesop
  · intro x hx
    simp at hx ⊢ <;> aesop