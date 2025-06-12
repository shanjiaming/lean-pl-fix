theorem multi_level_decomposition (a b c : ℕ) (h1 : a ≤ b) (h2 : b ≤ c) : a ≤ c :=
  by
  by_cases h : a = c
  · simp [h]
  ·
    have h_main : a < c := by sorry
    have h_final : a ≤ c := by sorry
    exact h_final