theorem h_main  : {z | ∑ k ∈ Finset.Icc 0 (3 ^ 1010 - 1), (-2) ^ sorry * (z + k) ^ 2023 = 0} =
    {-(3 ^ 1010 - 1) / 2, -(3 ^ 1010 - 1) / 2 + (↑√(9 ^ 1010 - 1) : ℂ) * Complex.I / 4,
      -(3 ^ 1010 - 1) / 2 - (↑√(9 ^ 1010 - 1) : ℂ) * Complex.I / 4} :=
  by
  have h₁ : (3 : ℕ) ^ 1010 - 1 > 0 := by sorry
  have h₂ :
    {z : ℂ | ∑ k in Finset.Icc 0 (3 ^ 1010 - 1), (-2 : ℂ) ^ (num_ones (digits 3 k)) * (z + k) ^ 2023 = 0} =
      (({-(3 ^ 1010 - 1) / 2, -(3 ^ 1010 - 1) / 2 + Real.sqrt (9 ^ 1010 - 1) * Complex.I / 4,
          -(3 ^ 1010 - 1) / 2 - Real.sqrt (9 ^ 1010 - 1) * Complex.I / 4} :
        Set ℂ)) := by sorry
  exact h₂