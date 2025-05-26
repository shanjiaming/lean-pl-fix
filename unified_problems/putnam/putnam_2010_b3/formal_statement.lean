theorem putnam_2010_b3
      (n : ℕ) (hn : n > 0)
      (trans : (ℕ → Fin 2010 → ℕ) → ℕ → Prop)
      (htrans : ∀ P T, trans P T ↔ ∀ t : ℕ, t < T → ∃ i j,
            i ≠ j ∧
            P t i ≥ i.1 + 1 ∧ P (t + 1) i = P t i - (i.1 + 1) ∧ P (t + 1) j = P t j + (i.1 + 1) ∧
            ∀ k : Fin 2010, k ≠ i → k ≠ j → P (t + 1) k = P t k) :
      (∀ B, ∑ i, B i = 2010 * n → ∃ᵉ (P) (T), P 0 = B ∧ trans P T ∧ ∀ i, P T i = n)
      ↔ n ∈ ((Ici 1005) : Set ℕ ) := by