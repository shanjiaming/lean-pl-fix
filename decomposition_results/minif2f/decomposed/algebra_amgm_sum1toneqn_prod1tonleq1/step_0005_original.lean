theorem h₁₀ (a : ℕ → NNReal) (n : ℕ) (h₀ : ∑ x ∈ Finset.range n, a x = ↑n) (h₂ : ∑ x ∈ Finset.range n, ↑(a x) = ↑n) (h₃ : ¬n = 0) (h₄ : 0 < n) (i : ℕ) (hi : i ∈ Finset.range n) (h₆ : ↑(a i) = 0) (h₈ : i ∈ Finset.range n) (h₉ : ↑(a i) = 0) : ∏ x ∈ Finset.range n, ↑(a x) = 0 := by
  calc
    (∏ x in Finset.range n, (a x : ℝ)) = ∏ x in Finset.range n, (a x : ℝ) := rfl
    _ = 0 := by
      apply Finset.prod_eq_zero h₈
      simp [h₉]