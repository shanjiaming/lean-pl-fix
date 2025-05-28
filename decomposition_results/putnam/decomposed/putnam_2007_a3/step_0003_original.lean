theorem h₁ (k : ℕ) (kpos : k > 0) (perms goodperms : Set (Fin (3 * k + 1) → ℤ)) (hgoodperms : goodperms = {f | f ∈ perms ∧ ¬∃ j, 3 ∣ ∑ i, if i ≤ j then f i else 0}) (hperms : perms = {f | ∀ y ∈ Icc 1 (3 * k + 1), ∃! x, f x = ↑y}) : ∀ (n : ℤ), sorry → n ≥ 1 ∧ n ≤ 3 * ↑k + 1 :=
  by
  intro n hn
  simp only [Set.mem_Icc] at hn
  exact hn