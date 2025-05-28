theorem h_subset₁  : {c | ∃ s, s 0 = 0 ∧ StrictMono s ∧ ∃ n, s n = 1 ∧ ∑ i ∈ Finset.range n, (s (i + 1) ^ 3 - s i * s (i + 1) ^ 2) = c} ⊆
    Ioc (1 / 3) 1 :=
  by
  --  intro c hc
  --  rcases hc with ⟨s, h₀, h₁, n, h₂, h₃⟩
  have h₄ : c > 1 / 3 := by sorry
  have h₅ : c ≤ 1 := by sorry
  --  exact ⟨h₄, h₅⟩
  hole