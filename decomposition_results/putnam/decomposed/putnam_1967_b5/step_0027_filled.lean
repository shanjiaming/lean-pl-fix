theorem h₁ (n : ℕ) (hn : n > 0) (h_base : 1 / 2 = ∑ i ∈ Finset.range 1, (↑((1 + i - 1).choose i) : ℚ) * 2 ^ (-1 - (↑i : ℤ))) (h_inductive_step :  ∀ k > 0,    1 / 2 = ∑ i ∈ Finset.range k, (↑((k + i - 1).choose i) : ℚ) * 2 ^ (-(↑k : ℤ) - (↑i : ℤ)) →      1 / 2 = ∑ i ∈ Finset.range (k + 1), (↑((k + 1 + i - 1).choose i) : ℚ) * 2 ^ (-((↑k : ℤ) + 1) - (↑i : ℤ))) : ∀ n > 0, 1 / 2 = ∑ i ∈ Finset.range n, (↑((n + i - 1).choose i) : ℚ) * 2 ^ (-(↑n : ℤ) - (↑i : ℤ)) :=
  by
  --  intro n hn
  --  induction' hn with n hn IH
  --  · simpa using h_base
  --  · simpa using h_inductive_step n hn IH
  hole