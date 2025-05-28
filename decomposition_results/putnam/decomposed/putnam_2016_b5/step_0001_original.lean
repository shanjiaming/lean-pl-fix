theorem putnam_2016_b5 (f : ↑(Ioi 1) → ↑(Ioi 1)) : f ∈ {f | ∃ c > 0, ∀ (x : ↑(Ioi 1)), ↑(f x) = ↑x ^ c} ↔
    ∀ (x y : ↑(Ioi 1)), ↑x ^ 2 ≤ ↑y ∧ ↑y ≤ ↑x ^ 3 → ↑(f x) ^ 2 ≤ ↑(f y) ∧ ↑(f y) ≤ ↑(f x) ^ 3 :=
  by
  constructor
  · intro hf
    have h_forward :
      ∀ x y : Set.Ioi (1 : ℝ), ((x : ℝ) ^ 2 ≤ y ∧ y ≤ (x : ℝ) ^ 3) → ((f x : ℝ) ^ 2 ≤ f y ∧ f y ≤ (f x : ℝ) ^ 3) := by sorry
    exact h_forward
  · intro hf
    have h_backward : ∃ c : ℝ, c > 0 ∧ ∀ x : Set.Ioi (1 : ℝ), (f x : ℝ) = x ^ c := by sorry
    simpa using h_backward