theorem h_tendsto (h_main :  ∀ (n : ℕ),    ∑ k ∈ Finset.Icc 1 n, 6 ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k)) =      2 - 2 ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) : sorry :=
  by
  have h₁ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) := by sorry
  exact h₁