theorem algebra_amgm_sum1toneqn_prod1tonleq1 (a : ℕ → NNReal) (n : ℕ) (h₀ : ∑ x ∈ Finset.range n, a x = (↑n : NNReal)) : ∏ x ∈ Finset.range n, a x ≤ 1 :=
  by
  have h₁ : (∏ x in Finset.range n, (a x : ℝ)) ≤ 1 := by sorry
  have h₂ : (∏ x in Finset.range n, a x) ≤ 1 := by sorry
  exact h₂