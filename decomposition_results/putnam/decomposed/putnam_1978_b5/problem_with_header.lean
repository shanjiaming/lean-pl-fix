import Mathlib

open Set Real Filter Topology Polynomial

-- 4 * X ^ 4 - 4 * X ^ 2 + 1
/--
Find the real polynomial $p(x)$ of degree $4$ with largest possible coefficient of $x^4$ such that $p([-1, 1]) \subseteq [0, 1]$.
-/
theorem putnam_1978_b5
(S : Set (Polynomial ℝ))
(hS : S = {p : Polynomial ℝ | p.degree = 4 ∧ ∀ x ∈ Icc (-1) 1, p.eval x ∈ Icc 0 1})
: (((4 * X ^ 4 - 4 * X ^ 2 + 1) : Polynomial ℝ ) ∈ S ∧ (∀ p ∈ S, p.coeff 4 ≤ ((4 * X ^ 4 - 4 * X ^ 2 + 1) : Polynomial ℝ ).coeff 4)) := by
  have h_main₁ : (4 * X ^ 4 - 4 * X ^ 2 + 1 : Polynomial ℝ) ∈ S := by
    rw [hS]
    constructor
    ·
      -- Prove that the degree of the polynomial is 4
      norm_num [Polynomial.degree_X_pow, Polynomial.degree_add_eq_left_of_degree_lt, Polynomial.degree_sub_eq_left_of_degree_lt,
        Polynomial.degree_mul_X_pow, Polynomial.degree_C, Polynomial.degree_X_pow]
      <;>
      decide
    ·
      -- Prove that for all x in [-1, 1], the polynomial evaluates to a value in [0, 1]
      intro x hx
      have h₁ : x ∈ Icc (-1 : ℝ) 1 := hx
      have h₂ : -1 ≤ x := by exact h₁.1
      have h₃ : x ≤ 1 := by exact h₁.2
      constructor
      ·
        -- Prove that the polynomial evaluates to a value ≥ 0
        have h₄ : 0 ≤ (x ^ 2 : ℝ) := by positivity
        have h₅ : x ^ 2 ≤ 1 := by
          nlinarith
        have h₆ : 0 ≤ (4 * x ^ 4 - 4 * x ^ 2 + 1 : ℝ) := by
          nlinarith [sq_nonneg (x ^ 2 - 1 / 2), sq_nonneg (x ^ 2)]
        norm_num at h₆ ⊢
        <;>
        simp_all [Polynomial.eval_add, Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X]
        <;>
        nlinarith
      ·
        -- Prove that the polynomial evaluates to a value ≤ 1
        have h₄ : 0 ≤ (x ^ 2 : ℝ) := by positivity
        have h₅ : x ^ 2 ≤ 1 := by
          nlinarith
        have h₆ : (4 * x ^ 4 - 4 * x ^ 2 + 1 : ℝ) ≤ 1 := by
          nlinarith [sq_nonneg (x ^ 2 - 1 / 2), sq_nonneg (x ^ 2)]
        norm_num at h₆ ⊢
        <;>
        simp_all [Polynomial.eval_add, Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X]
        <;>
        nlinarith
  have h_main₂ : ∀ p ∈ S, p.coeff 4 ≤ ((4 * X ^ 4 - 4 * X ^ 2 + 1 : Polynomial ℝ).coeff 4) := by
    intro p hp
    rw [hS] at hp
    have h₁ : p.degree = 4 := hp.1
    have h₂ : ∀ x ∈ Icc (-1 : ℝ) 1, p.eval x ∈ Icc 0 1 := hp.2
    have h₃ : p.coeff 4 ≤ 4 := by
      by_contra h
      have h₄ : p.coeff 4 > 4 := by linarith
      have h₅ : p.degree = 4 := by simpa using h₁
      have h₆ : p.coeff 4 > 4 := by simpa using h₄
      have h₇ : p.eval 1 ≤ 1 := (h₂ 1 (by norm_num)).2
      have h₈ : p.eval (-1) ≤ 1 := (h₂ (-1) (by norm_num)).2
      have h₉ : p.eval 0 ≥ 0 := (h₂ 0 (by norm_num)).1
      have h₁₀ : p.eval 0 ≤ 1 := (h₂ 0 (by norm_num)).2
      have h₁₁ : p.eval (1 / Real.sqrt 2) ≥ 0 := (h₂ (1 / Real.sqrt 2) (by
        constructor <;>
        (try norm_num) <;>
        (try
          {
            apply le_of_pow_le_pow_left two_ne_zero (by positivity)
            <;>
            field_simp <;>
            ring_nf <;>
            norm_num
          })
        <;>
        (try
          {
            apply le_of_pow_le_pow_left two_ne_zero (by positivity)
            <;>
            field_simp <;>
            ring_nf <;>
            norm_num
          })
      )).1
      have h₁₂ : p.eval (-(1 / Real.sqrt 2)) ≥ 0 := (h₂ (-(1 / Real.sqrt 2)) (by
        constructor <;>
        (try norm_num) <;>
        (try
          {
            apply le_of_pow_le_pow_left two_ne_zero (by positivity)
            <;>
            field_simp <;>
            ring_nf <;>
            norm_num
          })
        <;>
        (try
          {
            apply le_of_pow_le_pow_left two_ne_zero (by positivity)
            <;>
            field_simp <;>
            ring_nf <;>
            norm_num
          })
      )).1
      -- Use the inequalities to derive a contradiction
      have h₁₃ : p.coeff 4 ≤ 4 := by
        -- Use the fact that the polynomial has degree 4 and coefficients are bounded
        have h₁₄ := h₂ 1 (by norm_num)
        have h₁₅ := h₂ (-1) (by norm_num)
        have h₁₆ := h₂ 0 (by norm_num)
        have h₁₇ := h₂ (1 / Real.sqrt 2) (by
          constructor <;>
          (try norm_num) <;>
          (try
            {
              apply le_of_pow_le_pow_left two_ne_zero (by positivity)
              <;>
              field_simp <;>
              ring_nf <;>
              norm_num
            })
          <;>
          (try
            {
              apply le_of_pow_le_pow_left two_ne_zero (by positivity)
              <;>
              field_simp <;>
              ring_nf <;>
              norm_num
            })
        )
        have h₁₈ := h₂ (-(1 / Real.sqrt 2)) (by
          constructor <;>
          (try norm_num) <;>
          (try
            {
              apply le_of_pow_le_pow_left two_ne_zero (by positivity)
              <;>
              field_simp <;>
              ring_nf <;>
              norm_num
            })
          <;>
          (try
            {
              apply le_of_pow_le_pow_left two_ne_zero (by positivity)
              <;>
              field_simp <;>
              ring_nf <;>
              norm_num
            })
        )
        -- Use the fact that the polynomial is bounded to bound the coefficients
        have h₁₉ : p.eval 1 = p.sum fun n a => a * (1 : ℝ) ^ n := by
          simp [Polynomial.eval_eq_sum]
        have h₂₀ : p.eval (-1) = p.sum fun n a => a * (-1 : ℝ) ^ n := by
          simp [Polynomial.eval_eq_sum]
        have h₂₁ : p.eval 0 = p.coeff 0 := by
          simp [Polynomial.eval_eq_sum]
        have h₂₂ : p.eval (1 / Real.sqrt 2) = p.sum fun n a => a * ((1 / Real.sqrt 2 : ℝ) : ℝ) ^ n := by
          simp [Polynomial.eval_eq_sum]
        have h₂₃ : p.eval (-(1 / Real.sqrt 2)) = p.sum fun n a => a * (-(1 / Real.sqrt 2 : ℝ) : ℝ) ^ n := by
          simp [Polynomial.eval_eq_sum]
        -- Use the fact that the polynomial is bounded to bound the coefficients
        have h₂₄ : p.degree = 4 := h₁
        have h₂₅ : p.coeff 4 > 4 := h₆
        have h₂₆ : p.coeff 4 ≤ 4 := by
          -- Use the fact that the polynomial is bounded to bound the coefficients
          have h₂₇ := h₁₇
          have h₂₈ := h₁₈
          have h₂₉ := h₁₄
          have h₃₀ := h₁₅
          have h₃₁ := h₁₆
          norm_num at h₂₇ h₂₈ h₂₉ h₃₀ h₃₁ ⊢
          <;>
          (try
            {
              cases' p with p
              <;>
              simp_all [Polynomial.coeff_add, Polynomial.coeff_mul, Polynomial.coeff_X, Polynomial.coeff_C, Polynomial.coeff_one, Polynomial.coeff_sub]
              <;>
              norm_num at *
              <;>
              (try contradiction)
              <;>
              (try linarith)
            })
          <;>
          (try
            {
              norm_num [Polynomial.coeff_add, Polynomial.coeff_mul, Polynomial.coeff_X, Polynomial.coeff_C, Polynomial.coeff_one, Polynomial.coeff_sub] at *
              <;>
              (try contradiction)
              <;>
              (try linarith)
            })
          <;>
          (try
            {
              nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
            })
          <;>
          (try
            {
              simp_all [Polynomial.coeff_add, Polynomial.coeff_mul, Polynomial.coeff_X, Polynomial.coeff_C, Polynomial.coeff_one, Polynomial.coeff_sub]
              <;>
              norm_num at *
              <;>
              (try contradiction)
              <;>
              (try linarith)
            })
          <;>
          (try
            {
              norm_num [Polynomial.coeff_add, Polynomial.coeff_mul, Polynomial.coeff_X, Polynomial.coeff_C, Polynomial.coeff_one, Polynomial.coeff_sub] at *
              <;>
              (try contradiction)
              <;>
              (try linarith)
            })
          <;>
          (try
            {
              nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
            })
        exact h₂₆
      linarith
    have h₄ : (4 * X ^ 4 - 4 * X ^ 2 + 1 : Polynomial ℝ).coeff 4 = 4 := by
      norm_num [Polynomial.coeff_add, Polynomial.coeff_sub, Polynomial.coeff_mul, Polynomial.coeff_X_pow, Polynomial.coeff_C]
    have h₅ : p.coeff 4 ≤ (4 * X ^ 4 - 4 * X ^ 2 + 1 : Polynomial ℝ).coeff 4 := by
      linarith
    exact h₅
  exact ⟨h_main₁, h_main₂⟩