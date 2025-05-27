theorem local_max_at_2 (x : ℝ) : IsLocalMax f 2 :=
  by
  have h_main : ∃ (δ : ℝ) (hδ : 0 < δ), ∀ x, |x - 2| < δ → f x ≤ f 2 := by sorry
  have h_final : IsLocalMax f 2 := by sorry
  --  exact h_final
  simpa