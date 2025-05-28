theorem h₃ (k : ℕ) (kpos : k > 0) (perms goodperms : Set (Fin (3 * k + 1) → ℤ)) (hgoodperms : goodperms = {f | f ∈ perms ∧ ¬∃ j, 3 ∣ ∑ i, if i ≤ j then f i else 0}) (hperms : perms = {f | ∀ y ∈ Icc 1 (3 * k + 1), ∃! x, f x = ↑y}) (h_perms_infinite : perms.Infinite) (h_perms_ncard : perms.ncard = 0) (h₁ : goodperms ⊆ perms) (h₂ : perms.Infinite) : goodperms.Infinite ∨ goodperms.Finite :=
  by
  --  by_cases h : goodperms.Infinite
  --  · exact Or.inl h
  --  · exact Or.inr (Set.not_infinite.mp h)
  hole