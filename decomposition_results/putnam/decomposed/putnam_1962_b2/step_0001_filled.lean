theorem putnam_1962_b2  : ∃ f, ∀ (a b : ℝ), a < b → f a ⊂ f b :=
  by
  have h_main : ∃ (q : ℕ+ → ℚ), Function.Bijective q := by sorry
  have h_final : ∃ f : ℝ → Set ℕ+, ∀ a b : ℝ, a < b → f a ⊂ f b := by sorry
  --  exact h_final
  hole