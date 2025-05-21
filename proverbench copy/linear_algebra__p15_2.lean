theorem uniqueness_of_decomposition (hu : u ≠ 0) (a' b' : E)
    (h_decomp : v = a' + b') (h_parallel : isParallel a' u) (h_orthogonal : isOrthogonal b' u) :
let l := ⟪v, u⟫_ℝ / ‖u‖^2;
a' = l • u ∧ b' = v - l • u := by
  intro l
  have h₁ : a' = l • u := by
    obtain ⟨l', h_a'⟩ := h_parallel
    have h₂ : ⟪b', u⟫_ℝ = 0 := h_orthogonal
    have h₃ : b' = v - a' := by
      have h₄ : v = a' + b' := h_decomp
      have h₅ : b' = v - a' := by
        rw [h₄]
        abel
      exact h₅
    have h₄ : ⟪v - a', u⟫_ℝ = 0 := by
      rw [h₃] at h₂
      exact h₂
    have h₅ : ⟪v - a', u⟫_ℝ = 0 := h₄
    have h₆ : ⟪v - l' • u, u⟫_ℝ = 0 := by
      rw [h_a'] at h₅
      exact h₅
    have h₇ : ⟪v - l' • u, u⟫_ℝ = ⟪v, u⟫_ℝ - l' * ‖u‖^2 := by
      calc
        ⟪v - l' • u, u⟫_ℝ = ⟪v, u⟫_ℝ - ⟪l' • u, u⟫_ℝ := by
          rw [sub_inner]
        _ = ⟪v, u⟫_ℝ - l' * ⟪u, u⟫_ℝ := by
          rw [inner_smul_right]
          <;> ring_nf
        _ = ⟪v, u⟫_ℝ - l' * ‖u‖^2 := by
          rw [← @inner_self_eq_norm_sq ℝ]
          <;> ring_nf
    have h₈ : ⟪v, u⟫_ℝ - l' * ‖u‖^2 = 0 := by
      linarith
    have h₉ : ⟪v, u⟫_ℝ = l' * ‖u‖^2 := by
      linarith
    have h₁₀ : l' = ⟪v, u⟫_ℝ / ‖u‖^2 := by
      have h₁₁ : ‖u‖ ≠ 0 := by
        exact norm_ne_zero_iff.mpr hu
      have h₁₂ : ‖u‖^2 ≠ 0 := by
        positivity
      field_simp [h₁₂] at h₉ ⊢
      <;> nlinarith
    rw [h_a']
    rw [h₁₀]
    <;> simp [l]
    <;> ring_nf
    <;> field_simp [hu]
    <;> simp_all [real_inner_smul_left, real_inner_smul_right, real_inner_self_eq_norm_sq]
    <;> ring_nf
    <;> linarith
  have h₂ : b' = v - l • u := by
    have h₃ : v = a' + b' := h_decomp
    have h₄ : a' = l • u := h₁
    rw [h₄] at h₃
    have h₅ : b' = v - l • u := by
      rw [eq_sub_iff_add_eq.mpr h₃]
      <;> abel
    exact h₅
  have h₃ : a' = l • u ∧ b' = v - l • u := by
    exact ⟨h₁, h₂⟩
  exact h₃