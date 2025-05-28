theorem h₂ (a d : ℝ) (h₀ : ∑ k ∈ Finset.range 5, (a + ↑k * d) = 70) (h₁ : ∑ k ∈ Finset.range 10, (a + ↑k * d) = 210) : 5 * a + 10 * d = 70 :=
  by
  have h₂₁ : (∑ k in Finset.range 5, (a + k * d : ℝ)) = 5 * a + 10 * d := by sorry
  --  rw [h₂₁] at h₀
  --  linarith
  linarith