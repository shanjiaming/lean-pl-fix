import Mathlib

open Set Real Filter Topology Polynomial

-- 4 * X ^ 4 - 4 * X ^ 2 + 1
/--
Find the real polynomial $p(x)$ of degree $4$ with largest possible coefficient of $x^4$ such that $p([-1, 1]) \subseteq [0, 1]$.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)

theorem putnam_1978_b5
(S : Set (Polynomial ℝ))
(hS : S = {p : Polynomial ℝ | p.degree = 4 ∧ ∀ x ∈ Icc (-1) 1, p.eval x ∈ Icc 0 1})
: (((4 * X ^ 4 - 4 * X ^ 2 + 1) : Polynomial ℝ ) ∈ S ∧ (∀ p ∈ S, p.coeff 4 ≤ ((4 * X ^ 4 - 4 * X ^ 2 + 1) : Polynomial ℝ ).coeff 4)) := by
  have h_main₁ : (4 * X ^ 4 - 4 * X ^ 2 + 1 : Polynomial ℝ) ∈ S := by
    rw [hS]
    constructor
    ·
      
      norm_num [Polynomial.degree_X_pow, Polynomial.degree_add_eq_left_of_degree_lt, Polynomial.degree_sub_eq_left_of_degree_lt,
        Polynomial.degree_mul_X_pow, Polynomial.degree_C, Polynomial.degree_X_pow]
      <;>
      decide
    ·
      
      intro x hx
      have h₁ : x ∈ Icc (-1 : ℝ) 1 := hx
      have h₂ : -1 ≤ x := by hole_1
      have h₃ : x ≤ 1 := by hole_2
      constructor
      ·
        
        have h₄ : 0 ≤ (x ^ 2 : ℝ) := by hole_3
        have h₅ : x ^ 2 ≤ 1 := by
          hole_4
        have h₆ : 0 ≤ (4 * x ^ 4 - 4 * x ^ 2 + 1 : ℝ) := by
          hole_5
        norm_num at h₆ ⊢
        <;>
        simp_all [Polynomial.eval_add, Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X]
        <;>
        nlinarith
      ·
        
        have h₄ : 0 ≤ (x ^ 2 : ℝ) := by hole_6
        have h₅ : x ^ 2 ≤ 1 := by
          hole_7
        have h₆ : (4 * x ^ 4 - 4 * x ^ 2 + 1 : ℝ) ≤ 1 := by
          hole_8
        hole_9
  have h_main₂ : ∀ p ∈ S, p.coeff 4 ≤ ((4 * X ^ 4 - 4 * X ^ 2 + 1 : Polynomial ℝ).coeff 4) := by
    intro p hp
    rw [hS] at hp
    have h₁ : p.degree = 4 := hp.1
    have h₂ : ∀ x ∈ Icc (-1 : ℝ) 1, p.eval x ∈ Icc 0 1 := hp.2
    have h₃ : p.coeff 4 ≤ 4 := by
      by_contra h
      have h₄ : p.coeff 4 > 4 := by hole_10
      have h₅ : p.degree = 4 := by hole_11
      have h₆ : p.coeff 4 > 4 := by hole_12
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
      
      have h₁₃ : p.coeff 4 ≤ 4 := by
        
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
        
        have h₁₉ : p.eval 1 = p.sum fun n a => a * (1 : ℝ) ^ n := by
          hole_13
        have h₂₀ : p.eval (-1) = p.sum fun n a => a * (-1 : ℝ) ^ n := by
          hole_14
        have h₂₁ : p.eval 0 = p.coeff 0 := by
          hole_15
        have h₂₂ : p.eval (1 / Real.sqrt 2) = p.sum fun n a => a * ((1 / Real.sqrt 2 : ℝ) : ℝ) ^ n := by
          hole_16
        have h₂₃ : p.eval (-(1 / Real.sqrt 2)) = p.sum fun n a => a * (-(1 / Real.sqrt 2 : ℝ) : ℝ) ^ n := by
          hole_17
        
        have h₂₄ : p.degree = 4 := h₁
        have h₂₅ : p.coeff 4 > 4 := h₆
        have h₂₆ : p.coeff 4 ≤ 4 := by
          
          have h₂₇ := h₁₇
          have h₂₈ := h₁₈
          have h₂₉ := h₁₄
          have h₃₀ := h₁₅
          have h₃₁ := h₁₆
          hole_18
        hole_19
      hole_20
    have h₄ : (4 * X ^ 4 - 4 * X ^ 2 + 1 : Polynomial ℝ).coeff 4 = 4 := by
      hole_21
    have h₅ : p.coeff 4 ≤ (4 * X ^ 4 - 4 * X ^ 2 + 1 : Polynomial ℝ).coeff 4 := by
      hole_22
    hole_23
  hole_24