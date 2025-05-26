theorem h_final (k m : ℕ) (S : ℤ) (kpos : k > 0) (hm : m = 6 * k - 1) (hS : S = ∑ j ∈ Finset.Icc 1 (2 * k - 1), (-1) ^ (j + 1) * (↑(m.choose (3 * j - 1)) : ℤ)) (h_main : S % 3 = 1) : S ≠ 0 := by
  have h₁ : S % 3 = 1 := h_main
  have h₂ : S ≠ 0 := by sorry
  --  exact h₂
  omega