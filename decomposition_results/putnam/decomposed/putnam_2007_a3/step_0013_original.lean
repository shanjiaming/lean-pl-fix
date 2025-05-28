theorem h₂ (k : ℕ) (kpos : k > 0) (perms goodperms : Set (Fin (3 * k + 1) → ℤ)) (hgoodperms : goodperms = {f | f ∈ perms ∧ ¬∃ j, 3 ∣ ∑ i, if i ≤ j then f i else 0}) (hperms : perms = {f | ∀ y ∈ Icc 1 (3 * k + 1), ∃! x, f x = ↑y}) (h_perms_infinite h₁ : perms.Infinite) : perms.ncard = 0 := by
  have h₃ : perms.Infinite := h₁
  have h₄ : perms.ncard = 0 := by sorry
  exact h₄