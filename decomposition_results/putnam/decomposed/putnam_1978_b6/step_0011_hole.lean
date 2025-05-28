theorem h₅ (a : ℕ → ℕ → ℝ) (ha : ∀ (i j : ℕ), a i j ∈ Icc 0 1) (m n : ℕ) (mnpos : m > 0 ∧ n > 0) (h₁ : ∀ i ∈ Finset.Icc 1 n, ∑ j ∈ Finset.Icc 1 (m * i), a i j ≤ ↑m * ↑i) (i : ℕ) (hi : i ∈ Finset.Icc 1 n) (h₃ : ∑ j ∈ Finset.Icc 1 (m * i), a i j / ↑i = (∑ j ∈ Finset.Icc 1 (m * i), a i j) / ↑i) (h₄ : ∑ j ∈ Finset.Icc 1 (m * i), a i j ≤ ↑m * ↑i) : ↑i ≥ 1 := by
  --  norm_cast
  --  simp_all [Finset.mem_Icc] <;> linarith
  hole