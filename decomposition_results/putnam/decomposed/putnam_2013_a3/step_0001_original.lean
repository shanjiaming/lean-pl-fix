theorem putnam_2013_a3 (n : ℕ) (a : ↑(Icc 0 n) → ℝ) (x : ℝ) (hx : 0 < x ∧ x < 1) (hsum : ∑ i, a i / (1 - x ^ (↑i + 1)) = 0) : ∃ y, 0 < y ∧ y < 1 ∧ ∑ i, a i * y ^ ↑i = 0 :=
  by
  have h₁ : ∃ y : ℝ, 0 < y ∧ y < 1 ∧ (∑ i : Set.Icc 0 n, a i * y ^ i.1) = 0 := by sorry
  sorry <;> aesop