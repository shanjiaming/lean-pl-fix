theorem h₁ (k : ℕ) (kpos : k > 0) (perms goodperms : Set (Fin (3 * k + 1) → ℤ)) (hgoodperms : goodperms = {f | f ∈ perms ∧ ¬∃ j, 3 ∣ ∑ i, if i ≤ j then f i else 0}) (hperms : perms = {f | ∀ y ∈ Icc 1 (3 * k + 1), ∃! x, f x = ↑y}) (h_perms_infinite : perms.Infinite) (h_perms_ncard : perms.ncard = 0) : goodperms ⊆ perms := by
  rw [hgoodperms]
  intro f hf
  exact hf.1