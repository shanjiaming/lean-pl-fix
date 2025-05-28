theorem induction_sumkexp3eqsumksq (n : ℕ) : ∑ k ∈ Finset.range n, k ^ 3 = (∑ k ∈ Finset.range n, k) ^ 2 :=
  by
  have h_main : ∀ n : ℕ, (∑ k in Finset.range n, k ^ 3) = (∑ k in Finset.range n, k) ^ 2 := by sorry
  --  exact h_main n
  hole