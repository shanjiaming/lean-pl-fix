import Mathlib

open  Real Equiv

-- fun b n ↦ (∏ i : Finset.Icc 1 n, b i) / Nat.factorial n
/--
Let $a_1, a_2, \dots, a_n$ be real numbers, and let $b_1, b_2, \dots, b_n$ be distinct positive integers. Suppose that there is a polynomial $f(x)$ satisfying the identity
\[
(1-x)^n f(x) = 1 + \sum_{i=1}^n a_i x^{b_i}.
\]
Find a simple expression (not involving any sums) for $f(1)$ in terms of $b_1, b_2, \dots, b_n$ and $n$ (but independent of $a_1, a_2, \dots, a_n$).
-/
theorem putnam_1986_a6
(n : ℕ)
(npos : n > 0)
(a : ℕ → ℝ)
(b : ℕ → ℕ)
(bpos : ∀ i ∈ Finset.Icc 1 n, b i > 0)
(binj : ∀ i ∈ Finset.Icc 1 n, ∀ j ∈ Finset.Icc 1 n, b i = b j → i = j)
(f : Polynomial ℝ)
(hf : ∀ x : ℝ, (1 - x) ^ n * f.eval x = 1 + ∑ i : Finset.Icc 1 n, (a i) * x ^ (b i))
: (f.eval 1 = ((fun b n ↦ (∏ i : Finset.Icc 1 n, b i) / Nat.factorial n) : (ℕ → ℕ) → ℕ → ℝ ) b n) := by
  have h_sum_a : (1 : ℝ) + ∑ i : Finset.Icc 1 n, (a i : ℝ) = 0 := by
    have h₁ := hf 1
    have h₂ : ((1 : ℝ) - 1 : ℝ) ^ n = 0 := by
      have h₃ : n > 0 := npos
      have h₄ : ((1 : ℝ) - 1 : ℝ) = 0 := by norm_num
      rw [h₄]
      simp [h₃, pow_eq_zero_iff]
    have h₃ : ∑ i : Finset.Icc 1 n, (a i : ℝ) * (1 : ℝ) ^ (b i) = ∑ i : Finset.Icc 1 n, (a i : ℝ) := by
      apply Finset.sum_congr rfl
      intro i _
      have h₄ : (1 : ℝ) ^ (b i) = 1 := by simp
      rw [h₄]
      <;> ring
    rw [h₂, zero_mul] at h₁
    simp_all [Finset.sum_mul, Finset.mul_sum]
    <;> ring_nf at *
    <;> linarith
  
  have h_f1 : f.eval 1 = ((∏ i : Finset.Icc 1 n, (b i : ℝ)) / Nat.factorial n : ℝ) := by
    have h₁ := hf 1
    have h₂ : ((1 : ℝ) - 1 : ℝ) ^ n = 0 := by
      have h₃ : n > 0 := npos
      have h₄ : ((1 : ℝ) - 1 : ℝ) = 0 := by norm_num
      rw [h₄]
      simp [h₃, pow_eq_zero_iff]
    have h₃ : ∑ i : Finset.Icc 1 n, (a i : ℝ) * (1 : ℝ) ^ (b i) = ∑ i : Finset.Icc 1 n, (a i : ℝ) := by
      apply Finset.sum_congr rfl
      intro i _
      have h₄ : (1 : ℝ) ^ (b i) = 1 := by simp
      rw [h₄]
      <;> ring
    rw [h₂, zero_mul] at h₁
    have h₄ : (1 : ℝ) + ∑ i : Finset.Icc 1 n, (a i : ℝ) = 0 := h_sum_a
    have h₅ : f.eval 1 = 0 := by
      simp_all [Finset.sum_mul, Finset.mul_sum]
      <;> ring_nf at *
      <;> linarith
    have h₆ : (∏ i : Finset.Icc 1 n, (b i : ℝ)) = 0 := by
      have h₇ : n > 0 := npos
      have h₈ : ∃ (i : ℕ), i ∈ Finset.Icc 1 n ∧ b i = 0 := by
        by_contra h
        push_neg at h
        have h₉ : ∀ (i : ℕ), i ∈ Finset.Icc 1 n → b i > 0 := by
          intro i hi
          have h₁₀ : b i > 0 := bpos i hi
          exact h₁₀
        have h₁₀ : ∀ (i : ℕ), i ∈ Finset.Icc 1 n → (b i : ℝ) > 0 := by
          intro i hi
          have h₁₁ : (b i : ℝ) > 0 := by exact_mod_cast h₉ i hi
          exact h₁₁
        have h₁₁ : ∏ i : Finset.Icc 1 n, (b i : ℝ) > 0 := by
          apply Finset.prod_pos
          intro i hi
          exact h₁₀ i hi
        have h₁₂ : (1 : ℝ) + ∑ i : Finset.Icc 1 n, (a i : ℝ) = 0 := h_sum_a
        have h₁₃ : f.eval 1 = 0 := h₅
        simp_all [Finset.sum_mul, Finset.mul_sum]
        <;> ring_nf at *
        <;> linarith
      obtain ⟨i, hi, hbi⟩ := h₈
      have h₉ : (b i : ℝ) = 0 := by exact_mod_cast hbi
      have h₁₀ : (∏ i : Finset.Icc 1 n, (b i : ℝ)) = 0 := by
        have h₁₁ : (b i : ℝ) = 0 := h₉
        have h₁₂ : i ∈ Finset.Icc 1 n := hi
        have h₁₃ : (∏ i : Finset.Icc 1 n, (b i : ℝ)) = 0 := by
          calc
            (∏ i : Finset.Icc 1 n, (b i : ℝ)) = (∏ i : Finset.Icc 1 n, (b i : ℝ)) := rfl
            _ = 0 := by
              apply Finset.prod_eq_zero (Finset.mem_Icc.mpr ⟨by linarith [Finset.mem_Icc.mp h₁₂], by linarith [Finset.mem_Icc.mp h₁₂]⟩)
              simp_all [h₁₁]
        exact h₁₃
      exact h₁₀
    have h₇ : (Nat.factorial n : ℝ) > 0 := by
      exact_mod_cast Nat.factorial_pos n
    have h₈ : ((∏ i : Finset.Icc 1 n, (b i : ℝ)) / Nat.factorial n : ℝ) = 0 := by
      rw [h₆]
      <;> simp [h₇]
      <;> field_simp [h₇.ne']
      <;> ring_nf
      <;> linarith
    rw [h₅, h₈]
    <;> simp_all
    <;> ring_nf
    <;> linarith
  
  have h_final : f.eval 1 = ((fun b n ↦ (∏ i : Finset.Icc 1 n, b i) / Nat.factorial n) : (ℕ → ℕ) → ℕ → ℝ ) b n := by
    simpa using h_f1
  exact h_final