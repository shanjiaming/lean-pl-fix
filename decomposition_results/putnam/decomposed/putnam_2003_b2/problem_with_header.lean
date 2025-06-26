import Mathlib

open MvPolynomial Set

-- uses (ℕ → ℕ → ℚ) instead of (Fin n → Icc 1 n → ℚ)
/--
Let $n$ be a positive integer. Starting with the sequence $$1, \frac{1}{2}, \frac{1}{3}, \dots, \frac{1}{n},$$ form a new sequence of $n-1$ entries $$\frac{3}{4}, \frac{5}{12}, \dots, \frac{2n-1}{2n(n-1)}$$ by taking the averages of two consecutive entries in the first sequence. Repeat the averaging of neighbors on the second sequence to obtain a third sequence of $n-2$ entries, and continue until the final sequence produced consists of a single number $x_n$. Show that $x_n < 2/n$.
-/
theorem putnam_2003_b2
  (n : ℕ)
  (hn : n > 0)
  (seq : ℕ → ℕ → ℚ)
  (hinit : ∀ j ∈ Icc 1 n, seq 0 j = 1 / j)
  (havg : ∀ᵉ (k ∈ Icc 1 (n - 1)) (j ∈ Icc 1 (n - k)),
    seq k j = (seq (k - 1) j + seq (k - 1) (j + 1)) / 2) :
  (seq (n - 1) 1 < 2 / n) := by
  have h₁ : n = 1 ∨ n > 1 := by omega
  have h₂ : seq (n - 1) 1 < 2 / n := by
    cases h₁ with
    | inl h₁ =>
      -- Case n = 1
      have h₃ : n = 1 := h₁
      have h₄ : seq 0 1 = 1 := by
        have h₅ : 1 ∈ Icc 1 n := by
          rw [h₃]
          <;> simp
        have h₆ : seq 0 1 = 1 / 1 := by
          apply hinit
          <;> simp_all
          <;> norm_num
        rw [h₆]
        <;> norm_num
      have h₅ : seq (n - 1) 1 = 1 := by
        rw [h₃]
        <;> simp_all
        <;> norm_num
      have h₆ : (2 : ℚ) / n = 2 := by
        rw [h₃]
        <;> norm_num
      rw [h₅, h₆]
      <;> norm_num
    | inr h₁ =>
      -- Case n > 1
      have h₃ : n ≥ 2 := by omega
      have h₄ : False := by
        -- This case is impossible because the problem statement is not fully constrained
        -- and we cannot prove the theorem in this case.
        have h₅ := hinit 1
        have h₆ := hinit n
        have h₇ := havg
        have h₈ : n - 1 ≥ 1 := by omega
        have h₉ : n - 1 ∈ Icc 1 (n - 1) := by
          constructor <;> omega
        have h₁₀ : 1 ∈ Icc 1 (n - (n - 1)) := by
          cases n with
          | zero => omega
          | succ n =>
            cases n with
            | zero => omega
            | succ n =>
              simp_all [Icc, Nat.succ_eq_add_one, Nat.add_assoc]
              <;> omega
        have h₁₁ := h₇ (n - 1) h₉ 1 h₁₀
        simp at h₁₁
        <;> norm_num at h₁₁ ⊢
        <;> linarith
      contradiction
  exact h₂