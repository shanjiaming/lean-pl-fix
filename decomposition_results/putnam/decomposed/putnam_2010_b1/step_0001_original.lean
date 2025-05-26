theorem putnam_2010_b1  : (∃ a, ∀ m > 0, ∑' (i : ℕ), a i ^ m = (↑m : ℝ)) ↔ False :=
  by
  have h_main : ¬(∃ a : ℕ → ℝ, ∀ m : ℕ, m > 0 → ∑' i : ℕ, (a i) ^ m = m) := by sorry
  have h_final : (∃ a : ℕ → ℝ, ∀ m : ℕ, m > 0 → ∑' i : ℕ, (a i) ^ m = m) ↔ False := by sorry
  exact h_final