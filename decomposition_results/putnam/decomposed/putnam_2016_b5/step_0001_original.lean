theorem putnam_2016_b5 (f : (↑(Set.Ioi 1) : Type) → (↑(Set.Ioi 1) : Type)) : f ∈ {f | ∃ c > 0, ∀ (x : (↑(Set.Ioi 1) : Type)), (↑(f x) : ℝ) = (↑x : ℝ) ^ c} ↔
    ∀ (x y : (↑(Set.Ioi 1) : Type)),
      (↑x : ℝ) ^ 2 ≤ (↑y : ℝ) ∧ (↑y : ℝ) ≤ (↑x : ℝ) ^ 3 →
        (↑(f x) : ℝ) ^ 2 ≤ (↑(f y) : ℝ) ∧ (↑(f y) : ℝ) ≤ (↑(f x) : ℝ) ^ 3 :=
  by
  constructor
  · intro hf
    have h_forward :
      ∀ x y : Set.Ioi (1 : ℝ), ((x : ℝ) ^ 2 ≤ y ∧ y ≤ (x : ℝ) ^ 3) → ((f x : ℝ) ^ 2 ≤ f y ∧ f y ≤ (f x : ℝ) ^ 3) := by sorry
    exact h_forward
  · intro hf
    have h_backward : ∃ c : ℝ, c > 0 ∧ ∀ x : Set.Ioi (1 : ℝ), (f x : ℝ) = x ^ c := by sorry
    simpa using h_backward