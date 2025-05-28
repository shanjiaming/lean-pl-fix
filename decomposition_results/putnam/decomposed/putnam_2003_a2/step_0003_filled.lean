theorem h₂ (n : ℕ) (hn : 0 < n) (a b : Fin n → ℝ) (abnneg : ∀ (i : Fin n), a i ≥ 0 ∧ b i ≥ 0) (h₁ : ∏ i, a i = 0) : (∏ i, a i) ^ (1 / ↑n) = 0 := by
  --  rw [h₁]
  --  simp [Real.zero_rpow (by positivity : ((1 : ℝ) / n : ℝ) ≠ 0)]
  hole