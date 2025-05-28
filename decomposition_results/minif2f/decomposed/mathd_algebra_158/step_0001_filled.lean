theorem mathd_algebra_158 (a : ℕ) (h₀ : Even a) (h₁ : ↑(∑ k ∈ Finset.range 8, 2 * k + 1) - ↑(∑ k ∈ Finset.range 5, a + 2 * sorry) = 4) : a = 8 :=
  by
  have h₂ : ∑ k in Finset.range 8, (2 * k + 1 : ℕ) = 64 := by sorry
  have h₃ : ∑ k in Finset.range 5, (a + 2 * k : ℕ) = 5 * a + 20 := by sorry
  have h₄ : a = 8 := by sorry
  --  apply h₄
  linarith