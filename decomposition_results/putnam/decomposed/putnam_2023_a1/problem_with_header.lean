import Mathlib

open Nat

-- 18
/--
For a positive integer $n$, let $f_n(x) = \cos(x) \cos(2x) \cos(3x) \cdots \cos(nx)$. Find the smallest $n$ such that $|f_n''(0)| > 2023$.
-/
theorem putnam_2023_a1
  (f : ℕ → ℝ → ℝ)
  (hf : ∀ n > 0, f n = fun x : ℝ => ∏ i in Finset.Icc 1 n, Real.cos (i * x)) :
  IsLeast {n | 0 < n ∧ |iteratedDeriv 2 (f n) 0| > 2023} ((18) : ℕ) := by
  have h1 : (18 : ℕ) ∈ {n | 0 < n ∧ |iteratedDeriv 2 (f n) 0| > 2023} := by
    have h₁ : 0 < (18 : ℕ) := by decide
    have h₂ : |iteratedDeriv 2 (f 18) 0| > 2023 := by
      have h₃ : f 18 = fun x : ℝ => ∏ i in Finset.Icc 1 18, Real.cos (i * x) := by
        apply hf
        decide
      rw [h₃]
      -- Compute the second derivative of the product of cosines at 0
      have h₄ : |iteratedDeriv 2 (fun x : ℝ => ∏ i in Finset.Icc 1 18, Real.cos (i * x)) 0| > 2023 := by
        -- Calculate the second derivative of the product of cosines at 0
        have h₅ : (iteratedDeriv 2 (fun x : ℝ => ∏ i in Finset.Icc 1 18, Real.cos (i * x)) 0 : ℝ) = -((Finset.sum (Finset.Icc 1 18) fun i : ℕ => (i : ℝ) ^ 2)) := by
          -- Use the product rule and simplify the expression
          norm_num [Finset.prod_Icc_succ_top, Finset.sum_Icc_succ_top, iteratedDeriv_succ, iteratedDeriv_zero,
            Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_sub, Nat.cast_pow]
          <;>
          (try ring_nf) <;>
          (try simp_all [Real.deriv_cos, Real.deriv_sin, mul_comm]) <;>
          (try norm_num) <;>
          (try field_simp [Real.differentiableAt_cos, Real.differentiableAt_sin]) <;>
          (try ring_nf) <;>
          (try norm_num) <;>
          (try linarith [Real.cos_le_one 0, Real.cos_le_one 1, Real.cos_le_one 2, Real.cos_le_one 3, Real.cos_le_one 4, Real.cos_le_one 5, Real.cos_le_one 6, Real.cos_le_one 7, Real.cos_le_one 8, Real.cos_le_one 9, Real.cos_le_one 10, Real.cos_le_one 11, Real.cos_le_one 12, Real.cos_le_one 13, Real.cos_le_one 14, Real.cos_le_one 15, Real.cos_le_one 16, Real.cos_le_one 17, Real.cos_le_one 18]) <;>
          (try
            {
              simp_all [Real.deriv_cos, Real.deriv_sin, mul_comm]
              <;>
              norm_num
              <;>
              linarith [Real.cos_le_one 0, Real.cos_le_one 1, Real.cos_le_one 2, Real.cos_le_one 3, Real.cos_le_one 4, Real.cos_le_one 5, Real.cos_le_one 6, Real.cos_le_one 7, Real.cos_le_one 8, Real.cos_le_one 9, Real.cos_le_one 10, Real.cos_le_one 11, Real.cos_le_one 12, Real.cos_le_one 13, Real.cos_le_one 14, Real.cos_le_one 15, Real.cos_le_one 16, Real.cos_le_one 17, Real.cos_le_one 18]
            })
          <;>
          (try
            {
              simp_all [Finset.prod_range_succ, Finset.prod_range_zero, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_sub, Nat.cast_pow]
              <;>
              norm_num
              <;>
              linarith [Real.cos_le_one 0, Real.cos_le_one 1, Real.cos_le_one 2, Real.cos_le_one 3, Real.cos_le_one 4, Real.cos_le_one 5, Real.cos_le_one 6, Real.cos_le_one 7, Real.cos_le_one 8, Real.cos_le_one 9, Real.cos_le_one 10, Real.cos_le_one 11, Real.cos_le_one 12, Real.cos_le_one 13, Real.cos_le_one 14, Real.cos_le_one 15, Real.cos_le_one 16, Real.cos_le_one 17, Real.cos_le_one 18]
            })
          <;>
          (try
            {
              simp_all [Finset.prod_range_succ, Finset.prod_range_zero, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_sub, Nat.cast_pow]
              <;>
              norm_num
              <;>
              linarith [Real.cos_le_one 0, Real.cos_le_one 1, Real.cos_le_one 2, Real.cos_le_one 3, Real.cos_le_one 4, Real.cos_le_one 5, Real.cos_le_one 6, Real.cos_le_one 7, Real.cos_le_one 8, Real.cos_le_one 9, Real.cos_le_one 10, Real.cos_le_one 11, Real.cos_le_one 12, Real.cos_le_one 13, Real.cos_le_one 14, Real.cos_le_one 15, Real.cos_le_one 16, Real.cos_le_one 17, Real.cos_le_one 18]
            })
        -- Calculate the sum of squares of integers from 1 to 18
        have h₆ : (Finset.sum (Finset.Icc 1 18) fun i : ℕ => (i : ℝ) ^ 2 : ℝ) = 2109 := by
          norm_num [Finset.sum_Icc_succ_top]
          <;> rfl
        rw [h₅, h₆]
        norm_num [abs_of_nonneg, abs_of_nonpos]
      exact h₄
    exact ⟨h₁, h₂⟩
  
  have h2 : ∀ (n' : ℕ), n' ∈ {n | 0 < n ∧ |iteratedDeriv 2 (f n) 0| > 2023} → (18 : ℕ) ≤ n' → (18 : ℕ) ≤ n' := by
    intro n' hn' hle
    exact hle
  
  have h3 : IsLeast {n | 0 < n ∧ |iteratedDeriv 2 (f n) 0| > 2023} 18 := by
    refine' ⟨h1, _⟩
    rintro n' ⟨hn'₁, hn'₂⟩
    by_contra! h
    have h₄ : n' < 18 := by linarith
    have h₅ : n' ≤ 17 := by linarith
    have h₆ : 0 < n' := hn'₁
    interval_cases n' <;> norm_num at hn'₂ ⊢
    <;>
    (try contradiction) <;>
    (try {
      have h₇ : f 1 = fun x : ℝ => ∏ i in Finset.Icc 1 1, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₈ : f 2 = fun x : ℝ => ∏ i in Finset.Icc 1 2, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₉ : f 3 = fun x : ℝ => ∏ i in Finset.Icc 1 3, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₁₀ : f 4 = fun x : ℝ => ∏ i in Finset.Icc 1 4, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₁₁ : f 5 = fun x : ℝ => ∏ i in Finset.Icc 1 5, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₁₂ : f 6 = fun x : ℝ => ∏ i in Finset.Icc 1 6, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₁₃ : f 7 = fun x : ℝ => ∏ i in Finset.Icc 1 7, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₁₄ : f 8 = fun x : ℝ => ∏ i in Finset.Icc 1 8, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₁₅ : f 9 = fun x : ℝ => ∏ i in Finset.Icc 1 9, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₁₆ : f 10 = fun x : ℝ => ∏ i in Finset.Icc 1 10, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₁₇ : f 11 = fun x : ℝ => ∏ i in Finset.Icc 1 11, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₁₈ : f 12 = fun x : ℝ => ∏ i in Finset.Icc 1 12, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₁₉ : f 13 = fun x : ℝ => ∏ i in Finset.Icc 1 13, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₂₀ : f 14 = fun x : ℝ => ∏ i in Finset.Icc 1 14, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₂₁ : f 15 = fun x : ℝ => ∏ i in Finset.Icc 1 15, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₂₂ : f 16 = fun x : ℝ => ∏ i in Finset.Icc 1 16, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      have h₂₃ : f 17 = fun x : ℝ => ∏ i in Finset.Icc 1 17, Real.cos (i * x) := by
        apply hf
        <;> norm_num
      norm_num [Finset.prod_Icc_succ_top, Finset.sum_Icc_succ_top, iteratedDeriv_succ, iteratedDeriv_zero, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_sub, Nat.cast_pow] at hn'₂ ⊢
      <;>
      (try ring_nf at hn'₂ ⊢) <;>
      (try simp_all [Real.deriv_cos, Real.deriv_sin, mul_comm]) <;>
      (try norm_num at hn'₂ ⊢) <;>
      (try field_simp [Real.differentiableAt_cos, Real.differentiableAt_sin] at hn'₂ ⊢) <;>
      (try ring_nf at hn'₂ ⊢) <;>
      (try norm_num at hn'₂ ⊢) <;>
      (try linarith [Real.cos_le_one 0, Real.cos_le_one 1, Real.cos_le_one 2, Real.cos_le_one 3, Real.cos_le_one 4, Real.cos_le_one 5, Real.cos_le_one 6, Real.cos_le_one 7, Real.cos_le_one 8, Real.cos_le_one 9, Real.cos_le_one 10, Real.cos_le_one 11, Real.cos_le_one 12, Real.cos_le_one 13, Real.cos_le_one 14, Real.cos_le_one 15, Real.cos_le_one 16, Real.cos_le_one 17, Real.cos_le_one 18] )
       <;>
      (try
        {
          simp_all [Finset.prod_range_succ, Finset.prod_range_zero, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_sub, Nat.cast_pow]
          <;>
          norm_num at hn'₂ ⊢
          <;>
          linarith [Real.cos_le_one 0, Real.cos_le_one 1, Real.cos_le_one 2, Real.cos_le_one 3, Real.cos_le_one 4, Real.cos_le_one 5, Real.cos_le_one 6, Real.cos_le_one 7, Real.cos_le_one 8, Real.cos_le_one 9, Real.cos_le_one 10, Real.cos_le_one 11, Real.cos_le_one 12, Real.cos_le_one 13, Real.cos_le_one 14, Real.cos_le_one 15, Real.cos_le_one 16, Real.cos_le_one 17, Real.cos_le_one 18]
        })
    }) <;>
    (try norm_num) <;>
    (try linarith)
  
  exact h3
  <;> aesop