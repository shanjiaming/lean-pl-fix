theorem h₅₁ (k : ℕ) (hk : k ∈ Finset.Icc 1 20) (h₁ : 1 ≤ k) (h₂ : k ≤ 20) (h₃ : k ≥ 1) (h₄ : k ≤ 20) : logb (5 ^ k) (3 ^ k ^ 2) = Real.log (3 ^ k ^ 2) / Real.log (5 ^ k) := by
  --  rw [Real.logb] <;> simp [Real.log_rpow] <;> field_simp <;> ring
  norm_cast