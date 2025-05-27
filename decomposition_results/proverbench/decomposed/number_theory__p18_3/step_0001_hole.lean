theorem characterize_B  : ∀ (b : ℤ), b ∈ B ↔ ∃ k, b = -44 + 5 * k :=
  by
  --  intro b
  have h_forward : b ∈ B → ∃ k : Int, b = -44 + 5 * k := by sorry
  have h_backward : (∃ k : Int, b = -44 + 5 * k) → b ∈ B := by sorry
  have h_main : b ∈ B ↔ ∃ k : Int, b = -44 + 5 * k := by sorry
  --  exact h_main
  hole