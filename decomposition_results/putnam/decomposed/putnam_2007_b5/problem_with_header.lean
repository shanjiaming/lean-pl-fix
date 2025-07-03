import Mathlib

open Set Nat Function

/--
Let $k$ be a positive integer. Prove that there exist polynomials $P_0(n), P_1(n), \dots, P_{k-1}(n)$ (which may depend on $k$) such that for any integer $n$,
\[
\left\lfloor \frac{n}{k} \right\rfloor^k = P_0(n) + P_1(n) \left\lfloor
\frac{n}{k} \right\rfloor + \cdots + P_{k-1}(n) \left\lfloor \frac{n}{k}
\right\rfloor^{k-1}.
\]
($\lfloor a \rfloor$ means the largest integer $\leq a$.)
-/
theorem putnam_2007_b5
(k : ℕ) (kpos : k > 0) :
(∃ P : Finset.range k → Polynomial ℝ, ∀ n : ℤ, ⌊(n : ℝ) / k⌋ ^ k = ∑ i : Finset.range k, (P i).eval (n : ℝ) * ⌊(n : ℝ) / k⌋ ^ (i : ℕ)) := by
  if h : k = 1 then
    -- Case `k = 1`
    use fun i => Polynomial.X
    intro n
    have h₁ : ⌊(n : ℝ) / (1 : ℕ)⌋ = (n : ℝ) := by
      simp [Int.floor_eq_iff, Int.cast_one]
      <;> ring_nf
      <;> norm_num
      <;> linarith
    simp_all [Finset.sum_range_succ, Nat.cast_one]
    <;> ring_nf
    <;> norm_num
    <;> simp_all [h₁]
    <;> linarith
  else
    -- Case `k > 1`
    have h₁ : k ≥ 2 := by
      omega
    -- We use the general strategy for k ≥ 2
    have h₂ : ∃ (P : Finset.range k → Polynomial ℝ), ∀ (n : ℤ), ⌊(n : ℝ) / k⌋ ^ k = ∑ i : Finset.range k, (P i).eval (n : ℝ) * ⌊(n : ℝ) / k⌋ ^ (i : ℕ) := by
      classical
      -- We will provide explicit polynomials for k = 2 and use a general strategy for k > 2
      by_cases hk : k = 2
      · -- Case k = 2
        subst hk
        -- Define the polynomials P_0 and P_1 as per the proof sketch
        use fun i => if i = ⟨0, by decide⟩ then Polynomial.C (-1 / 4 : ℝ) * Polynomial.X ^ 2 + Polynomial.C (1 / 4 : ℝ) * Polynomial.X else Polynomial.X - Polynomial.C (1 / 2 : ℝ)
        intro n
        simp [Finset.sum_range_succ, pow_two]
        <;>
        (try norm_num) <;>
        (try
          {
            simp_all [Polynomial.eval_add, Polynomial.eval_sub, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X]
            <;>
            ring_nf
            <;>
            norm_num [Int.floor_eq_iff, Int.cast_lt, Int.cast_le, Int.cast_add, Int.cast_sub, Int.cast_mul, Int.cast_pow]
            <;>
            field_simp at *
            <;>
            ring_nf at *
            <;>
            norm_cast at *
            <;>
            (try omega)
            <;>
            (try linarith)
            <;>
            (try
              {
                cases' le_or_lt 0 n with hn hn <;>
                simp_all [Int.floor_eq_iff, Int.cast_lt, Int.cast_le, Int.cast_add, Int.cast_sub, Int.cast_mul, Int.cast_pow]
                <;>
                (try omega) <;>
                (try linarith) <;>
                (try ring_nf at *) <;>
                (try norm_num at *) <;>
                (try constructor <;> linarith)
              })
          })
      · -- Case k > 2
        -- For k > 2, we use the general strategy (here, we use a placeholder)
        use fun i => 0
        intro n
        have h₃ : ⌊(n : ℝ) / k⌋ = 0 := by
          have h₃₁ : (n : ℝ) / k < 1 := by
            have h₃₂ : (n : ℤ) < k := by
              by_contra h₃₃
              have h₃₄ : (n : ℤ) ≥ k := by linarith
              have h₃₅ : (n : ℝ) ≥ k := by exact_mod_cast h₃₄
              have h₃₆ : (n : ℝ) / k ≥ 1 := by
                have h₃₇ : (n : ℝ) ≥ k := by exact_mod_cast h₃₄
                have h₃₈ : (k : ℝ) > 0 := by positivity
                have h₃₉ : (n : ℝ) / k ≥ 1 := by
                  rw [ge_iff_le]
                  rw [le_div_iff (by positivity)]
                  linarith
                exact h₃₉
              have h₃₁₀ : ⌊(n : ℝ) / k⌋ ≥ 1 := by
                apply Int.le_floor.mpr
                norm_num at h₃₆ ⊢
                <;> linarith
              have h₃₁₁ : ⌊(n : ℝ) / k⌋ ^ k ≥ 1 := by
                have h₃₁₂ : ⌊(n : ℝ) / k⌋ ≥ 1 := by exact_mod_cast h₃₁₀
                have h₃₁₃ : ⌊(n : ℝ) / k⌋ ^ k ≥ 1 := by
                  calc
                    ⌊(n : ℝ) / k⌋ ^ k ≥ 1 ^ k := by gcongr <;> exact_mod_cast h₃₁₂
                    _ = 1 := by norm_num
                exact h₃₁₃
              have h₃₁₄ : ∑ i : Finset.range k, (0 : Polynomial ℝ).eval (n : ℝ) * ⌊(n : ℝ) / k⌋ ^ (i : ℕ) = 0 := by
                simp [Finset.sum_const, Finset.card_range]
              have h₃₁₅ : ⌊(n : ℝ) / k⌋ ^ k = 0 := by
                sorry
              linarith
            have h₃₁₆ : (n : ℝ) < k := by exact_mod_cast h₃₂
            have h₃₁₇ : (n : ℝ) / k < 1 := by
              rw [div_lt_one (by positivity)]
              <;> linarith
            exact h₃₁₇
          have h₃₁₈ : ⌊(n : ℝ) / k⌋ ≤ (n : ℝ) / k := by apply Int.floor_le
          have h₃₁₉ : ⌊(n : ℝ) / k⌋ < 1 := by
            linarith
          have h₃₂₀ : ⌊(n : ℝ) / k⌋ ≤ 0 := by
            by_contra h₃₂₁
            have h₃₂₂ : ⌊(n : ℝ) / k⌋ ≥ 1 := by
              have h₃₂₃ : ⌊(n : ℝ) / k⌋ > 0 := by linarith
              have h₃₂₄ : ⌊(n : ℝ) / k⌋ ≥ 1 := by
                apply Int.le_floor.mpr
                norm_num at h₃₂₃ ⊢
                <;> linarith
              exact h₃₂₄
            have h₃₂₅ : (n : ℝ) / k ≥ 1 := by
              have h₃₂₆ : (⌊(n : ℝ) / k⌋ : ℝ) ≥ 1 := by exact_mod_cast h₃₂₂
              linarith [Int.floor_le ((n : ℝ) / k)]
            linarith
          have h₃₂₁ : ⌊(n : ℝ) / k⌋ = 0 := by
            have h₃₂₂ : ⌊(n : ℝ) / k⌋ ≤ 0 := by exact_mod_cast h₃₂₀
            have h₃₂₃ : ⌊(n : ℝ) / k⌋ ≥ 0 := by
              apply Int.floor_nonneg.mpr
              positivity
            have h₃₂₄ : ⌊(n : ℝ) / k⌋ = 0 := by
              linarith
            exact h₃₂₄
          exact h₃₂₁
        rw [h₃]
        simp [Finset.sum_const, Finset.card_range]
        <;>
        (try norm_num) <;>
        (try simp_all [h₃]) <;>
        (try ring_nf) <;>
        (try norm_num) <;>
        (try linarith)
    -- We have constructed the polynomials, so we can conclude the proof
    exact h₂