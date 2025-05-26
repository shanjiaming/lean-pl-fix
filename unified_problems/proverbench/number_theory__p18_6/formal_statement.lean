/-- Theorem: The greatest negative element in B is -4 -/
theorem greatest_negative_element : ∃ b : Int, b < 0 ∧ b ∈ B ∧ ∀ b' : Int, b' < 0 → b' ∈ B → b' ≤ b :=