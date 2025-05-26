theorem putnam_1985_a3 (d : ℝ) (a : ℕ → ℕ → ℝ) (ha0 : ∀ (m : ℕ), a m 0 = d / 2 ^ m) (ha : ∀ (m j : ℕ), a m (j + 1) = a m j ^ 2 + 2 * a m j) : sorry :=
  by
  have h_main : ∀ m j : ℕ, a m j = (d / (2 : ℝ) ^ m + 1) ^ (2 ^ j : ℕ) - 1 := by sorry
  have h_limit : Tendsto (fun n ↦ a n n) atTop (𝓝 (exp d - 1)) := by sorry
  simpa using h_limit