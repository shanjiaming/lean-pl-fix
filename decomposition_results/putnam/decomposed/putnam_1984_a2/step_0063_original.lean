theorem h₁ (h_main :  ∀ (n : ℕ),    ∑ k ∈ Finset.Icc 1 n, 6 ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k)) =      2 - 2 ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) (h_tendsto : sorry) : ∑' (k : (↑(Set.Ici 1) : Type)),
      6 ^ (↑k : ℕ) / ((3 ^ ((↑k : ℕ) + 1) - 2 ^ ((↑k : ℕ) + 1)) * (3 ^ (↑k : ℕ) - 2 ^ (↑k : ℕ))) =
    ∑' (n : ℕ), 6 ^ (n + 1) / ((3 ^ (n + 1 + 1) - 2 ^ (n + 1 + 1)) * (3 ^ (n + 1) - 2 ^ (n + 1))) :=
  by
  rw [← Equiv.tsum_eq (Equiv.sigmaEquivProdOfEquiv (Equiv.refl _) |>.symm)] <;> simp [Set.Ici, Set.mem_setOf_eq] <;> rfl