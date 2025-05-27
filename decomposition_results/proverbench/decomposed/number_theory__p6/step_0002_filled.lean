theorem h_main (d✝ d : ℤ) (t : ℚ) : ↑d * t ^ 2 - 1 = 0 ∨ ↑d * t ^ 2 - 1 ≠ 0 :=
  by
  by_cases h : (d * (t : ℚ) ^ 2 - 1 : ℚ) = 0
  · exact Or.inl h
  · exact Or.inr h
  hole