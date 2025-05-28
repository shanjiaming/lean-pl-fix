theorem h₁ (r : ℕ → ℝ) (S : Set ℝ) (rpos : ∀ (n : ℕ), r n > 0) (rlim : Tendsto r atTop (𝓝 0)) (hS : S = {x | ∃ i, (∀ (j k : Fin 1994), j < k → i j < i k) ∧ x = ∑ j, r (i j)}) : ∀ (a b : ℝ), a < b → ∃ c d, a ≤ c ∧ c < d ∧ d ≤ b ∧ Set.Ioo c d ∩ S = ∅ :=
  by
  --  intro a b hab
  have h₂ : ∃ c d : ℝ, a ≤ c ∧ c < d ∧ d ≤ b ∧ (Set.Ioo c d) ∩ S = ∅ := by sorry
  --  exact h₂
  hole