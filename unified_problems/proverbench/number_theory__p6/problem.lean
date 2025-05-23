theorem rational_solutions_of_pell_equation (d : ℤ) (t : ℚ) :
  ∃ (x y : ℚ), x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) ∧ x^2 - d * y^2 = 1 := by
  have h_main : (d * (t : ℚ)^2 - 1 : ℚ) = 0 ∨ (d * (t : ℚ)^2 - 1 : ℚ) ≠ 0 := by
    by_cases h : (d * (t : ℚ) ^ 2 - 1 : ℚ) = 0
    · exact Or.inl h
    · exact Or.inr h
  
  have h_case_zero : (d * (t : ℚ)^2 - 1 : ℚ) = 0 → ∃ (x y : ℚ), x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) ∧ x^2 - d * y^2 = 1 := by
    intro h
    have h₁ : False := by
      have h₂ : (0 : ℚ) ≠ (1 : ℚ) := by norm_num
      have h₃ : (d * (t : ℚ)^2 + 1 : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ) = 0 := by
        have h₄ : (d * (t : ℚ)^2 - 1 : ℚ) = 0 := by exact_mod_cast h
        have h₅ : (d * (t : ℚ)^2 + 1 : ℚ) = (d * (t : ℚ)^2 - 1 : ℚ) + 2 := by ring
        rw [h₄] at *
        norm_num at *
        <;> simp_all [div_eq_mul_inv]
        <;> ring_nf at *
        <;> norm_num at *
        <;> linarith
      have h₄ : (2 * (t : ℚ) : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ) = 0 := by
        have h₅ : (d * (t : ℚ)^2 - 1 : ℚ) = 0 := by exact_mod_cast h
        have h₆ : (2 * (t : ℚ) : ℚ) = (2 * (t : ℚ) : ℚ) := by rfl
        rw [h₅] at *
        norm_num at *
        <;> simp_all [div_eq_mul_inv]
        <;> ring_nf at *
        <;> norm_num at *
        <;> linarith
      have h₅ : ((d * (t : ℚ)^2 + 1 : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * (t : ℚ) : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 = 0 := by
        rw [h₃, h₄]
        <;> norm_num
        <;> simp_all [div_eq_mul_inv]
        <;> ring_nf at *
        <;> norm_num at *
        <;> linarith
      have h₆ : ((d * (t : ℚ)^2 + 1 : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * (t : ℚ) : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 = 1 := by
        have h₇ : False := by
          have h₈ : ((d * (t : ℚ)^2 + 1 : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * (t : ℚ) : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 = 0 := h₅
          have h₉ : (0 : ℚ) ≠ (1 : ℚ) := by norm_num
          have h₁₀ : ((d * (t : ℚ)^2 + 1 : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * (t : ℚ) : ℚ) / (d * (t : ℚ)^2 - 1 : ℚ)) ^ 2 = 1 := by
            simp_all
          linarith
        exact h₇
      norm_num at h₅ h₆ ⊢
      <;> simp_all
      <;> try norm_num
      <;> try ring_nf at *
      <;> try linarith
    exact False.elim h₁
  
  have h_case_nonzero : (d * (t : ℚ)^2 - 1 : ℚ) ≠ 0 → ∃ (x y : ℚ), x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) ∧ x^2 - d * y^2 = 1 := by
    intro h₁
    have h₂ : (d * (t : ℚ)^2 - 1 : ℚ) ≠ 0 := h₁
    -- We handle the case where the denominator is non-zero by constructing x and y directly.
    refine' ⟨(d * t^2 + 1 : ℚ) / (d * t^2 - 1 : ℚ), (2 * t : ℚ) / (d * t^2 - 1 : ℚ), by simp [h₂], by simp [h₂], _⟩
    -- We need to prove that x^2 - d * y^2 = 1.
    have h₃ : (d * (t : ℚ)^2 - 1 : ℚ) ≠ 0 := by exact_mod_cast h₁
    have h₄ : (d * t^2 - 1 : ℚ) ≠ 0 := by exact_mod_cast h₁
    -- Use field_simp to simplify the expressions and ring_nf to expand and simplify the terms.
    have h₅ : ((d * t^2 + 1 : ℚ) / (d * t^2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * t : ℚ) / (d * t^2 - 1 : ℚ)) ^ 2 = 1 := by
      have h₅₁ : (d * t^2 - 1 : ℚ) ≠ 0 := by exact_mod_cast h₁
      field_simp [h₅₁, sub_eq_zero, add_eq_zero_iff_eq_neg]
      <;> ring_nf
      <;> field_simp [h₅₁, sub_eq_zero, add_eq_zero_iff_eq_neg]
      <;> norm_num
      <;> ring_nf
      <;> norm_num
      <;> linarith
    exact h₅
  
  have h_main' : ∃ (x y : ℚ), x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) ∧ x^2 - d * y^2 = 1 := by
    cases h_main with
    | inl h =>
      exact h_case_zero h
    | inr h =>
      exact h_case_nonzero h
  exact h_main'