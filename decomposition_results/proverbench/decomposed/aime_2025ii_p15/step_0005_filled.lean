theorem h2 (h1 : false = true) : ∃ k₁ k₂ k₃,
    0 < k₁ ∧
      0 < k₂ ∧
        0 < k₃ ∧
          k₁ ≠ k₂ ∧
            k₁ ≠ k₃ ∧
              k₂ ≠ k₃ ∧ exactly_two_minima k₁ ∧ exactly_two_minima k₂ ∧ exactly_two_minima k₃ ∧ k₁ + k₂ + k₃ = 240 :=
  by
  --  exfalso
  --  exact h1
  norm_cast