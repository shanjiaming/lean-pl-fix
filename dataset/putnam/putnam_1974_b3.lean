theorem putnam_1974_b3
(α : ℝ)
(ha : Real.cos (Real.pi * α) = (1 : ℝ)/3)
: Irrational α := by
  have h_main : ¬ (∃ (p : ℤ) (q : ℤ), q > 0 ∧ α = (p : ℝ) / q) := by
    rintro ⟨p, q, hq, hα⟩
    have h₁ : Real.cos (Real.pi * α) = (1 : ℝ) / 3 := ha
    have h₂ : Real.cos (Real.pi * α) = Real.cos (p * Real.pi / q) := by
      rw [hα]
      <;> field_simp [mul_comm]
      <;> ring_nf
      <;> field_simp [Real.cos_add, Real.cos_sub, Real.sin_add, Real.sin_sub]
      <;> ring_nf
      <;> simp [Real.cos_add, Real.cos_sub, Real.sin_add, Real.sin_sub]
      <;> field_simp [Real.cos_add, Real.cos_sub, Real.sin_add, Real.sin_sub]
      <;> ring_nf
      <;> simp [Real.cos_add, Real.cos_sub, Real.sin_add, Real.sin_sub]
    rw [h₂] at h₁
    have h₃ : Real.cos (p * Real.pi / q) = (1 : ℝ) / 3 := by linarith
    have h₄ : q > 0 := by exact_mod_cast hq
    -- Define the sequence C_k = cos(k * (p * π / q))
    have h₅ : ∀ (k : ℕ), ∃ (N : ℤ), Real.cos (k * (p * Real.pi / q)) = N / (3 : ℝ) ^ k ∧ (3 : ℤ) ∣ N → (3 : ℤ) ∣ k := by
      intro k
      by_contra! h
      use 0
      <;> simp_all [Int.emod_eq_of_lt]
      <;> norm_num
      <;> linarith
    -- Use the recurrence relation to derive a contradiction
    have h₆ : False := by
      have h₇ := h₅ 0
      have h₈ := h₅ 1
      have h₉ := h₅ q
      have h₁₀ := h₅ (q + 1)
      have h₁₁ := h₅ (q - 1)
      norm_num at h₇ h₈ h₉ h₁₀ h₁₁
      <;>
      (try omega) <;>
      (try
        {
          simp_all [Int.emod_eq_of_lt]
          <;> norm_num at *
          <;> linarith
        }) <;>
      (try
        {
          ring_nf at *
          <;> simp_all [Int.emod_eq_of_lt]
          <;> norm_num at *
          <;> linarith
        }) <;>
      (try
        {
          field_simp at *
          <;> ring_nf at *
          <;> simp_all [Int.emod_eq_of_lt]
          <;> norm_num at *
          <;> linarith
        })
      <;>
      (try
        {
          norm_num at *
          <;> linarith
        })
    exact h₆
  have h_final : Irrational α := by
    intro h
    obtain ⟨r, hr⟩ := h
    have h₁ : ∃ (p : ℤ) (q : ℤ), q > 0 ∧ α = (p : ℝ) / q := by
      refine' ⟨r.num, r.den, by exact_mod_cast r.pos, _⟩
      field_simp [hr, Rat.num_div_den]
      <;> ring_nf
      <;> simp_all [Rat.num_div_den]
      <;> field_simp [hr, Rat.num_div_den]
      <;> ring_nf
      <;> simp_all [Rat.num_div_den]
    exact h_main h₁
  exact h_final