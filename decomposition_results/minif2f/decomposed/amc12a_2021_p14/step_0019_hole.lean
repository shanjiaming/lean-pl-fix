theorem h₃₁ (h₁ : ∀ k ∈ Finset.Icc 1 20, logb (5 ^ k) (3 ^ k ^ 2) = ↑k * logb 5 3) (h₂ : ∑ k ∈ Finset.Icc 1 20, logb (5 ^ k) (3 ^ k ^ 2) = 210 * logb 5 3) (k : ℕ) (hk : k ∈ Finset.Icc 1 100) : logb (9 ^ k) (25 ^ k) = Real.log (25 ^ k) / Real.log (9 ^ k) := by
  --  rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
  hole