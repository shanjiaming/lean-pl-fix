theorem mathd_algebra_44 (s t : ℝ) (h₀ : s = 9 - 2 * t) (h₁ : t = 3 * s + 1) : s = 1 ∧ t = 4 := by
  have h₂ : s = 1 := by
    have h₂₁ : s = 7 - 6 * s := by
      rw [h₁] at h₀
      ring_nf at h₀ ⊢
      linarith
    have h₂₂ : s = 1 := by
      linarith
    exact h₂₂
  
  have h₃ : t = 4 := by
    rw [h₂] at h₁
    norm_num at h₁ ⊢
    <;> linarith
  
  have h₄ : s = 1 ∧ t = 4 := by
    exact ⟨h₂, h₃⟩
  
  exact h₄