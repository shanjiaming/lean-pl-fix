theorem h₃ (a : ℕ → ℕ → ℝ) (ha : ∀ (i j : ℕ), a i j ∈ Icc 0 1) (m n : ℕ) (mnpos : m > 0 ∧ n > 0) (i : ℕ) (hi : i ∈ Finset.Icc 1 n) (h₂ : ∀ j ∈ Finset.Icc 1 (m * i), a i j ≤ 1) : ∑ j ∈ Finset.Icc 1 (m * i), a i j ≤ ∑ j ∈ Finset.Icc 1 (m * i), 1 :=
  by
  --  apply Finset.sum_le_sum
  --  intro j hj
  have h₄ : a i j ≤ 1 := h₂ j hj
  --  linarith
  hole