theorem h_main (b : ℤ) (hb : b ∈ B) (hneg : b < 0) : ∃ k, b = -44 + 5 * k := by
  have h₁ : b ∈ B := hb
  have h₂ : b ∈ B ↔ ∃ k : Int, b = -44 + 5 * k := by sorry
  have h₃ : ∃ k : Int, b = -44 + 5 * k := by sorry
  --  exact h₃
  simpa