theorem h2 (h1 : false = true) : ∃ k₁ k₂ k₃, 0 < k₁ ∧ 0 < k₂ ∧ 0 < k₃ ∧ k₁ ≠ k₂ ∧ k₁ ≠ k₃ ∧ k₂ ≠ k₃ ∧ sorry ∧ sorry ∧ sorry ∧ k₁ + k₂ + k₃ = 240 :=
  by
  exfalso
  exact h1