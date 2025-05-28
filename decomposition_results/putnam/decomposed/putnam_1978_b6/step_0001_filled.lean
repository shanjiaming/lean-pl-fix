theorem putnam_1978_b6 (a : ℕ → ℕ → ℝ) (ha : ∀ (i j : ℕ), a i j ∈ Icc 0 1) (m n : ℕ) (mnpos : m > 0 ∧ n > 0) : (∑ i ∈ Finset.Icc 1 n, ∑ j ∈ Finset.Icc 1 (m * i), a i j / ↑i) ^ 2 ≤
    2 * ↑m * ∑ i ∈ Finset.Icc 1 n, ∑ j ∈ Finset.Icc 1 (m * i), a i j :=
  by
  have h₁ : ∀ i ∈ Finset.Icc 1 n, (∑ j in Finset.Icc 1 (m * i), a i j) ≤ m * i := by sorry
  have h₂ : ∀ i ∈ Finset.Icc 1 n, (∑ j in Finset.Icc 1 (m * i), a i j / i) ≤ m := by sorry
  have h₃ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ≤ m * n := by sorry
  have h₄ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤ (m * n : ℝ) ^ 2 := by sorry
  have h₅ : (m * n : ℝ) ^ 2 ≤ 2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j := by sorry
  have h₆ :
    ((∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤
      2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j) :=
    by
    have h₆₁ : (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤ (m * n : ℝ) ^ 2 := h₄
    have h₆₂ : (m * n : ℝ) ^ 2 ≤ 2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j := h₅
    have h₆₃ :
      (∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤
        2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j :=
      by linarith
    exact_mod_cast h₆₃
  have h₇ :
    ((∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j / i) ^ 2 ≤
      2 * m * ∑ i in Finset.Icc 1 n, ∑ j in Finset.Icc 1 (m * i), a i j) :=
    by exact h₆
  --  exact h₇
  linarith