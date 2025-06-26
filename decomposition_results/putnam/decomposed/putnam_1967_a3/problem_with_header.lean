import Mathlib

open Polynomial

-- 5
/--
Consider polynomial forms $ax^2-bx+c$ with integer coefficients which have two distinct zeros in the open interval $0<x<1$. Exhibit with a proof the least positive integer value of $a$ for which such a polynomial exists.
-/
theorem putnam_1967_a3 :
    IsLeast
      {a | ∃ P : Polynomial ℤ,
        P.degree = 2 ∧
        (∃ z1 z2 : Set.Ioo (0 : ℝ) 1, z1 ≠ z2 ∧ aeval (z1 : ℝ) P = 0 ∧ aeval (z2 : ℝ) P = 0) ∧
        P.coeff 2 = a ∧ a > 0}
      ((5) : ℕ ) := by
  have h₅_mem : (5 : ℕ) ∈ {a | ∃ P : Polynomial ℤ, P.degree = 2 ∧ (∃ z1 z2 : Set.Ioo (0 : ℝ) 1, z1 ≠ z2 ∧ aeval (z1 : ℝ) P = 0 ∧ aeval (z2 : ℝ) P = 0) ∧ P.coeff 2 = a ∧ a > 0} := by
    use (Polynomial.C 1 - Polynomial.C 5 * Polynomial.X + Polynomial.C 5 * Polynomial.X ^ 2 : Polynomial ℤ)
    constructor
    · -- Prove that the degree of the polynomial is 2
      norm_num [Polynomial.degree_X_pow, Polynomial.degree_add_eq_left_of_degree_lt, Polynomial.degree_sub_eq_left_of_degree_lt,
        Polynomial.degree_C_mul_X_pow, Polynomial.degree_C, Polynomial.degree_one, Nat.cast_ofNat]
      <;>
      ring_nf
      <;>
      norm_num
      <;>
      rfl
    · constructor
      · -- Prove that there exist z₁, z₂ ∈ (0,1) such that z₁ ≠ z₂ and P(z₁) = P(z₂) = 0
        have h₁ : (∃ (z1 z2 : Set.Ioo (0 : ℝ) 1), z1 ≠ z2 ∧ aeval (z1 : ℝ) (Polynomial.C 1 - Polynomial.C 5 * Polynomial.X + Polynomial.C 5 * Polynomial.X ^ 2 : Polynomial ℤ) = 0 ∧ aeval (z2 : ℝ) (Polynomial.C 1 - Polynomial.C 5 * Polynomial.X + Polynomial.C 5 * Polynomial.X ^ 2 : Polynomial ℤ) = 0) := by
          have h₂ : 0 < Real.sqrt 5 := Real.sqrt_pos.mpr (by norm_num)
          have h₃ : 0 < (Real.sqrt 5 : ℝ) := by positivity
          -- Find the roots of the polynomial
          have h₄ : (Real.sqrt 5 : ℝ) > 0 := by positivity
          have h₅ : (Real.sqrt 5 : ℝ) < 5 := by norm_num [Real.sqrt_lt, Real.lt_sqrt]
          have h₆ : (1 : ℝ) - Real.sqrt 5 / 5 > 0 := by
            nlinarith [Real.sq_sqrt (show 0 ≤ (5 : ℝ) by norm_num)]
          have h₇ : (1 : ℝ) - Real.sqrt 5 / 5 < 1 := by nlinarith [Real.sq_sqrt (show 0 ≤ (5 : ℝ) by norm_num)]
          have h₈ : (1 : ℝ) + Real.sqrt 5 / 5 > 0 := by nlinarith [Real.sq_sqrt (show 0 ≤ (5 : ℝ) by norm_num)]
          have h₉ : (1 : ℝ) + Real.sqrt 5 / 5 < 2 := by nlinarith [Real.sq_sqrt (show 0 ≤ (5 : ℝ) by norm_num)]
          -- Use the roots to construct the elements of Set.Ioo 0 1
          use ⟨(1 - Real.sqrt 5 / 5) / 2, by
            constructor <;> norm_num at h₆ h₇ ⊢ <;> nlinarith [Real.sq_sqrt (show 0 ≤ (5 : ℝ) by norm_num)]⟩
          use ⟨(1 + Real.sqrt 5 / 5) / 2, by
            constructor <;> norm_num at h₈ h₉ ⊢ <;> nlinarith [Real.sq_sqrt (show 0 ≤ (5 : ℝ) by norm_num)]⟩
          constructor
          · -- Prove that z₁ ≠ z₂
            intro h
            norm_num [Set.mem_Ioo, Subtype.ext_iff] at *
            <;>
            nlinarith [Real.sq_sqrt (show 0 ≤ (5 : ℝ) by norm_num)]
          · constructor
            · -- Prove that P(z₁) = 0
              norm_num [Polynomial.aeval_def, Polynomial.eval₂_eq_eval_map, Polynomial.map_add, Polynomial.map_mul,
                Polynomial.map_pow, Polynomial.map_sub, Polynomial.map_C, Polynomial.map_X] at *
              <;>
              ring_nf at *
              <;>
              norm_num [Real.sqrt_eq_iff_sq_eq, add_assoc] at *
              <;>
              nlinarith [Real.sq_sqrt (show 0 ≤ (5 : ℝ) by norm_num)]
            · -- Prove that P(z₂) = 0
              norm_num [Polynomial.aeval_def, Polynomial.eval₂_eq_eval_map, Polynomial.map_add, Polynomial.map_mul,
                Polynomial.map_pow, Polynomial.map_sub, Polynomial.map_C, Polynomial.map_X] at *
              <;>
              ring_nf at *
              <;>
              norm_num [Real.sqrt_eq_iff_sq_eq, add_assoc] at *
              <;>
              nlinarith [Real.sq_sqrt (show 0 ≤ (5 : ℝ) by norm_num)]
        exact h₁
      · -- Prove that P.coeff 2 = 5 and P.coeff 2 > 0
        constructor
        · -- Prove that P.coeff 2 = 5
          norm_num [Polynomial.coeff_add, Polynomial.coeff_sub, Polynomial.coeff_C_mul, Polynomial.coeff_X_pow,
            Polynomial.coeff_C_zero, Polynomial.coeff_X_zero, Polynomial.coeff_one]
          <;>
          ring_nf
          <;>
          norm_num
          <;>
          rfl
        · -- Prove that 5 > 0
          norm_num
  
  have h_is_least : ∀ a' ∈ {a | ∃ P : Polynomial ℤ, P.degree = 2 ∧ (∃ z1 z2 : Set.Ioo (0 : ℝ) 1, z1 ≠ z2 ∧ aeval (z1 : ℝ) P = 0 ∧ aeval (z2 : ℝ) P = 0) ∧ P.coeff 2 = a ∧ a > 0}, (5 : ℕ) ≤ a' := by
    intro a' ha'
    rcases ha' with ⟨P, hP₁, ⟨z₁, z₂, hz₁₂, hz₁, hz₂⟩, hP₂, hP₃⟩
    have hP₄ : P.degree = 2 := hP₁
    have hP₅ : P.coeff 2 = (a' : ℤ) := by simpa using hP₂
    have hP₆ : a' > 0 := hP₃
    have h₁ : (a' : ℕ) ≥ 5 := by
      by_contra h
      -- Assume that a' < 5 and derive a contradiction
      have h₂ : a' ≤ 4 := by
        omega
      have h₃ : a' ≥ 1 := by
        omega
      have h₄ : a' ≤ 4 := by
        omega
      -- Use the fact that the polynomial P has degree 2 and the roots are in (0,1)
      have h₅ : P.degree = 2 := hP₁
      have h₆ : P.coeff 2 = (a' : ℤ) := by simpa using hP₂
      have h₇ : a' > 0 := hP₃
      -- Use the fact that the polynomial P has degree 2 and the roots are in (0,1)
      have h₈ : (∃ z1 z2 : Set.Ioo (0 : ℝ) 1, z1 ≠ z2 ∧ aeval (z1 : ℝ) P = 0 ∧ aeval (z2 : ℝ) P = 0) := ⟨z₁, z₂, hz₁₂, hz₁, hz₂⟩
      -- Use the fact that the polynomial P has degree 2 and the roots are in (0,1)
      have h₉ : a' ≤ 4 := by
        omega
      -- Use the fact that the polynomial P has degree 2 and the roots are in (0,1)
      interval_cases a' <;> norm_num at hP₅ ⊢ <;>
        (try norm_num at hP₅ ⊢) <;>
        (try omega) <;>
        (try {
          -- Use the fact that the polynomial P has degree 2 and the roots are in (0,1)
          have h₁₀ := hz₁
          have h₁₁ := hz₂
          have h₁₂ := hz₁₂
          norm_num [Polynomial.aeval_def, Polynomial.eval₂_eq_eval_map, Polynomial.map_sub, Polynomial.map_add, Polynomial.map_mul, Polynomial.map_pow, Polynomial.map_C, Polynomial.map_X] at h₁₀ h₁₁
          -- Use the fact that the polynomial P has degree 2 and the roots are in (0,1)
          have h₁₃ := z₁.2.1
          have h₁₄ := z₁.2.2
          have h₁₅ := z₂.2.1
          have h₁₆ := z₂.2.2
          norm_num at h₁₀ h₁₁ h₁₃ h₁₄ h₁₅ h₁₆ ⊢
          <;>
          (try {
            -- Use the fact that the polynomial P has degree 2 and the roots are in (0,1)
            have h₁₇ : (P.map (algebraMap ℤ ℝ)).eval ↑z₁ = 0 := by simpa [Polynomial.aeval_def] using h₁₀
            have h₁₈ : (P.map (algebraMap ℤ ℝ)).eval ↑z₂ = 0 := by simpa [Polynomial.aeval_def] using h₁₁
            have h₁₉ : (P.map (algebraMap ℤ ℝ)).degree = 2 := by
              simp_all [Polynomial.degree_map_eq_iff]
              <;> norm_num [hP₄]
              <;> aesop
            have h₂₀ : (P.map (algebraMap ℤ ℝ)).coeff 2 = (a' : ℝ) := by
              simp_all [Polynomial.coeff_map, hP₅]
              <;> norm_num
              <;> aesop
            -- Use the fact that the polynomial P has degree 2 and the roots are in (0,1)
            have h₂₁ : (z₁ : ℝ) ≠ (z₂ : ℝ) := by
              intro h₂₂
              apply h₁₂
              ext <;> simp_all [Set.Ioo]
              <;> linarith
            -- Use the fact that the polynomial P has degree 2 and the roots are in (0,1)
            norm_num [Polynomial.eval_add, Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X] at h₁₇ h₁₈ h₁₉ h₂₀ ⊢
            <;>
            (try {
              -- Use the fact that the polynomial P has degree 2 and the roots are in (0,1)
              nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ (5 : ℝ) by norm_num),
                mul_pos (sub_pos.mpr z₁.2.2) (sub_pos.mpr z₂.2.2),
                mul_pos (sub_pos.mpr z₁.2.1) (sub_pos.mpr z₂.2.1),
                mul_pos (sub_pos.mpr z₁.2.2) (sub_pos.mpr z₁.2.1),
                mul_pos (sub_pos.mpr z₂.2.2) (sub_pos.mpr z₂.2.1)]
            }) <;>
            (try {
              -- Use the fact that the polynomial P has degree 2 and the roots are in (0,1)
              nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ (5 : ℝ) by norm_num),
                mul_pos (sub_pos.mpr z₁.2.2) (sub_pos.mpr z₂.2.2),
                mul_pos (sub_pos.mpr z₁.2.1) (sub_pos.mpr z₂.2.1),
                mul_pos (sub_pos.mpr z₁.2.2) (sub_pos.mpr z₁.2.1),
                mul_pos (sub_pos.mpr z₂.2.2) (sub_pos.mpr z₂.2.1)]
            }) <;>
            (try {
              -- Use the fact that the polynomial P has degree 2 and the roots are in (0,1)
              nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ (5 : ℝ) by norm_num),
                mul_pos (sub_pos.mpr z₁.2.2) (sub_pos.mpr z₂.2.2),
                mul_pos (sub_pos.mpr z₁.2.1) (sub_pos.mpr z₂.2.1),
                mul_pos (sub_pos.mpr z₁.2.2) (sub_pos.mpr z₁.2.1),
                mul_pos (sub_pos.mpr z₂.2.2) (sub_pos.mpr z₂.2.1)]
            })
          }) <;>
          (try {
            -- Use the fact that the polynomial P has degree 2 and the roots are in (0,1)
            norm_num at hP₅ ⊢
            <;>
            (try contradiction) <;>
            (try omega) <;>
            (try linarith)
          })
        })
      <;>
      (try omega)
    -- Use the fact that the polynomial P has degree 2 and the roots are in (0,1)
    linarith
  have h_main : IsLeast {a | ∃ P : Polynomial ℤ, P.degree = 2 ∧ (∃ z1 z2 : Set.Ioo (0 : ℝ) 1, z1 ≠ z2 ∧ aeval (z1 : ℝ) P = 0 ∧ aeval (z2 : ℝ) P = 0) ∧ P.coeff 2 = a ∧ a > 0} (5 : ℕ) := by
    refine' ⟨h₅_mem, _⟩
    intro a' ha'
    exact h_is_least a' ha'
  
  exact h_main