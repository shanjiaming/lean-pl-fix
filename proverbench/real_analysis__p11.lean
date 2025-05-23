theorem mean_value_theorem_for_differences (hf : DifferentiableOn ℝ f (Ioo a b))
  {x₁ x₂ : ℝ} (hx₁ : x₁ ∈ Ioo a b) (hx₂ : x₂ ∈ Ioo a b) :
  ∃ ξ ∈ Ioo (min x₁ x₂) (max x₁ x₂), f x₁ - f x₂ = (x₁ - x₂) * deriv f ξ := by
  have h₁ : x₁ ≠ x₂ → (∃ ξ ∈ Ioo (min x₁ x₂) (max x₁ x₂), f x₁ - f x₂ = (x₁ - x₂) * deriv f ξ) := by
    intro hne
    have h₂ : x₁ < x₂ ∨ x₂ < x₁ := by
      cases' lt_or_gt_of_ne hne with h h
      · exact Or.inl h
      · exact Or.inr h
    cases' h₂ with h₂ h₂
    · -- Case: x₁ < x₂
      have h₃ : ∃ ξ ∈ Ioo x₁ x₂, deriv f ξ = (f x₂ - f x₁) / (x₂ - x₁) := by
        -- Apply the Mean Value Theorem
        have h₄ : ContinuousOn f (Set.Icc x₁ x₂) :=
          hf.continuousOn.mono (Set.Ioo_subset_Icc_self.trans (Set.Icc_subset_Icc_left hx₁.1.le))
        have h₅ : DifferentiableOn ℝ f (Set.Ioo x₁ x₂) :=
          hf.mono (Set.Ioo_subset_Ioo (by linarith [hx₁.1, hx₂.1]) (by linarith [hx₁.2, hx₂.2]))
        -- Use the Mean Value Theorem to find ξ in (x₁, x₂) such that deriv f ξ = (f x₂ - f x₁) / (x₂ - x₁)
        obtain ⟨ξ, hξ, hξ'⟩ := exists_deriv_eq_slope f h₂ h₄ h₅
        refine' ⟨ξ, hξ, _⟩
        exact hξ'
      obtain ⟨ξ, hξ, hξ'⟩ := h₃
      have h₆ : ξ ∈ Ioo (min x₁ x₂) (max x₁ x₂) := by
        rw [min_eq_left h₂.le, max_eq_right h₂.le]
        exact hξ
      have h₇ : f x₁ - f x₂ = (x₁ - x₂) * deriv f ξ := by
        have h₈ : deriv f ξ = (f x₂ - f x₁) / (x₂ - x₁) := hξ'
        have h₉ : f x₁ - f x₂ = (x₁ - x₂) * deriv f ξ := by
          rw [h₈]
          field_simp [sub_ne_zero.mpr hne, sub_ne_zero.mpr hne.symm]
          <;> ring_nf
          <;> linarith
        exact h₉
      exact ⟨ξ, h₆, h₇⟩
    · -- Case: x₂ < x₁
      have h₃ : ∃ ξ ∈ Ioo x₂ x₁, deriv f ξ = (f x₁ - f x₂) / (x₁ - x₂) := by
        -- Apply the Mean Value Theorem
        have h₄ : ContinuousOn f (Set.Icc x₂ x₁) :=
          hf.continuousOn.mono (Set.Ioo_subset_Icc_self.trans (Set.Icc_subset_Icc_left hx₂.1.le))
        have h₅ : DifferentiableOn ℝ f (Set.Ioo x₂ x₁) :=
          hf.mono (Set.Ioo_subset_Ioo (by linarith [hx₁.1, hx₂.1]) (by linarith [hx₁.2, hx₂.2]))
        -- Use the Mean Value Theorem to find ξ in (x₂, x₁) such that deriv f ξ = (f x₁ - f x₂) / (x₁ - x₂)
        obtain ⟨ξ, hξ, hξ'⟩ := exists_deriv_eq_slope f h₂ h₄ h₅
        refine' ⟨ξ, hξ, _⟩
        exact hξ'
      obtain ⟨ξ, hξ, hξ'⟩ := h₃
      have h₆ : ξ ∈ Ioo (min x₁ x₂) (max x₁ x₂) := by
        rw [min_eq_right h₂.le, max_eq_left h₂.le]
        exact hξ
      have h₇ : f x₁ - f x₂ = (x₁ - x₂) * deriv f ξ := by
        have h₈ : deriv f ξ = (f x₁ - f x₂) / (x₁ - x₂) := hξ'
        have h₉ : f x₁ - f x₂ = (x₁ - x₂) * deriv f ξ := by
          rw [h₈]
          field_simp [sub_ne_zero.mpr hne.symm, sub_ne_zero.mpr hne]
          <;> ring_nf
          <;> linarith
        exact h₉
      exact ⟨ξ, h₆, h₇⟩
  
  have h₂ : x₁ = x₂ → False := by
    intro h
    have h₁' : x₁ < x₂ ∨ x₂ < x₁ := by
      by_cases h' : x₁ < x₂
      · exact Or.inl h'
      · have h₂ : x₂ < x₁ := by
          by_contra h₂
          have h₃ : x₁ ≤ x₂ := by linarith
          have h₄ : x₁ = x₂ := by
            apply le_antisymm
            · linarith
            · linarith
          contradiction
        exact Or.inr h₂
    cases' h₁' with h₁' h₁'
    · -- Case: x₁ < x₂
      have h₃ : x₁ < x₂ := h₁'
      have h₄ : x₁ ≠ x₂ := by
        intro h₄
        linarith
      have h₅ : x₁ ≠ x₂ := h₄
      have h₆ : x₁ < x₂ := h₃
      simp_all [h, h₅, h₆]
      <;> simp_all [Set.mem_Ioo, Set.mem_Icc, Set.mem_Ioc, Set.mem_Ico]
      <;> norm_num at *
      <;> linarith
    · -- Case: x₂ < x₁
      have h₃ : x₂ < x₁ := h₁'
      have h₄ : x₁ ≠ x₂ := by
        intro h₄
        linarith
      have h₅ : x₁ ≠ x₂ := h₄
      have h₆ : x₂ < x₁ := h₃
      simp_all [h, h₅, h₆]
      <;> simp_all [Set.mem_Ioo, Set.mem_Icc, Set.mem_Ioc, Set.mem_Ico]
      <;> norm_num at *
      <;> linarith
  
  have h₃ : x₁ ≠ x₂ := by
    by_contra h₃
    have h₄ : x₁ = x₂ := by tauto
    have h₅ : False := h₂ h₄
    exact h₅
  
  have h₄ : ∃ ξ ∈ Ioo (min x₁ x₂) (max x₁ x₂), f x₁ - f x₂ = (x₁ - x₂) * deriv f ξ := by
    have h₅ : x₁ ≠ x₂ := h₃
    have h₆ : (∃ ξ ∈ Ioo (min x₁ x₂) (max x₁ x₂), f x₁ - f x₂ = (x₁ - x₂) * deriv f ξ) := by
      apply h₁ h₅
    exact h₆
  
  apply h₄
  <;> assumption
  <;> try tauto
  <;> try norm_num
  <;> try linarith