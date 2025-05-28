theorem putnam_1964_a5 (pa : (ℕ → ℝ) → Prop)
  (hpa : ∀ a, pa a ↔ (∀ n : ℕ, a n > 0) ∧ ∃ L : ℝ, Tendsto (fun N ↦ ∑ n in Finset.range N, 1 / a n) atTop (𝓝 L)) :
  ∃ k : ℝ, ∀ a : ℕ → ℝ, pa a → ∑' n : ℕ, (n + 1) / (∑ i in Finset.range (n + 1), a i) ≤ k * ∑' n : ℕ, 1 / a n:=
  by
  have h_main :
    ∃ (k : ℝ), ∀ (a : ℕ → ℝ), pa a → ∑' n : ℕ, (n + 1) / (∑ i in Finset.range (n + 1), a i) ≤ k * ∑' n : ℕ, 1 / a n := by sorry
  --  exact h_main
  hole