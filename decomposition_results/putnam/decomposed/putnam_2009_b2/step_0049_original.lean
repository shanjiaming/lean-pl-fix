theorem h₄ (h_subset₁ :  {c | ∃ s, s 0 = 0 ∧ StrictMono s ∧ ∃ n, s n = 1 ∧ ∑ i ∈ Finset.range n, (s (i + 1) ^ 3 - s i * s (i + 1) ^ 2) = c} ⊆    Ioc (1 / 3) 1) (c : ℝ) (hc : c ∈ Ioc (1 / 3) 1) (h₁ : c > 1 / 3) (h₂ : c ≤ 1) (h₃ : ¬c = 1) : c < 1 := by
  by_contra h
  have h₅ : c ≥ 1 := by sorry
  have h₆ : c = 1 := by sorry
  contradiction