theorem putnam_2017_a3 (a b : ℝ) (f g : ℝ → ℝ) (I : ℕ → ℝ) (altb : a < b) (fgcont : ContinuousOn f (Set.Icc a b) ∧ ContinuousOn g (Set.Icc a b)) (fgimg : f '' Set.Icc a b ⊆ Set.Ioi 0 ∧ g '' Set.Icc a b ⊆ Set.Ioi 0) (fgint : ∫ (x : ℝ) in Set.Ioo a b, f x = ∫ (x : ℝ) in Set.Ioo a b, g x) (fneg : ∃ x, f (↑x : ℝ) ≠ g (↑x : ℝ)) (hI : ∀ n > 0, I n = ∫ (x : ℝ) in Set.Ioo a b, f x ^ (n + 1) / g x ^ n) : (∀ n > 0, I (n + 1) > I n) ∧ sorry :=
  by
  have h_main₁ : ∀ n > 0, I (n + 1) > I n := by sorry
  have h_main₂ : Tendsto I atTop atTop := by sorry
  --  exact ⟨h_main₁, h_main₂⟩
  hole