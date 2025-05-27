theorem h₀₇ (h₀₃ h₀₆ : Tendsto (fun x => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝[≠] 3) (𝓝 (-2))) : Tendsto (fun x => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)) :=
  by
  apply tendsto_nhds_of_eq_on_compl_singleton _ _ _ h₀₆
  ·
    have h₀₈ : (3 : ℝ) ∉ ({ 3 }ᶜ : Set ℝ) := by simp
    aesop
  · intro x hx
    simp at hx ⊢ <;> aesop