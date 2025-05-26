theorem linear_dependence_implies_proportional (α₁ α₂ : V) (h : linearly_dependent α₁ α₂) :
∃ (k : ℝ), k ≠ 0 ∧ (α₂ = k • α₁ ∨ (α₁ = 0 ∧ α₂ = 0)) :=