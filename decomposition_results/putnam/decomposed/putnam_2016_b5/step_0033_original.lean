theorem h_backward (f : (↑(Set.Ioi 1) : Type) → (↑(Set.Ioi 1) : Type)) (hf :  ∀ (x y : (↑(Set.Ioi 1) : Type)),    (↑x : ℝ) ^ 2 ≤ (↑y : ℝ) ∧ (↑y : ℝ) ≤ (↑x : ℝ) ^ 3 →      (↑(f x) : ℝ) ^ 2 ≤ (↑(f y) : ℝ) ∧ (↑(f y) : ℝ) ≤ (↑(f x) : ℝ) ^ 3) : ∃ c > 0, ∀ (x : (↑(Set.Ioi 1) : Type)), (↑(f x) : ℝ) = (↑x : ℝ) ^ c :=
  by
  have h₁ : ∃ c : ℝ, c > 0 ∧ ∀ x : Set.Ioi (1 : ℝ), (f x : ℝ) = x ^ c := by sorry
  exact h₁