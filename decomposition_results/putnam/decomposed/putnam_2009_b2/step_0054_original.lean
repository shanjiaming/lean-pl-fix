theorem h₅₂ (h_subset₁ :  {c | ∃ s, s 0 = 0 ∧ StrictMono s ∧ ∃ n, s n = 1 ∧ ∑ i ∈ Finset.range n, (s (i + 1) ^ 3 - s i * s (i + 1) ^ 2) = c} ⊆    Ioc (1 / 3) 1) (c : ℝ) (hc : c ∈ Ioc (1 / 3) 1) (h₁ : c > 1 / 3) (h₂ : c ≤ 1) (h₃ : ¬c = 1) (h₄ : c < 1) : ContinuousOn (fun x => x ^ 3 - x + 1) (Icc 0 1) :=
  by
  apply ContinuousOn.add
  apply ContinuousOn.sub
  · exact continuousOn_pow 3
  · exact continuousOn_id
  exact continuousOn_const