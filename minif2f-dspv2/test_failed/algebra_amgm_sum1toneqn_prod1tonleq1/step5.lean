theorem h₁₀ (a : ℕ → NNReal) (n : ℕ) (h₀ : ∑ x ∈ Finset.range n, a x = (↑n : NNReal)) (h₂ : ∑ x ∈ Finset.range n, (↑(a x) : ℝ) = (↑n : ℝ)) (h₃ : ¬n = 0) (h₄ : 0 < n) (i : ℕ) (hi : i ∈ Finset.range n) (h₆ : (↑(a i) : ℝ) = 0) (h₈ : i ∈ Finset.range n) (h₉ : (↑(a i) : ℝ) = 0) : ∏ x ∈ Finset.range n, (↑(a x) : ℝ) = 0 := by
  calc
    (∏ x in Finset.range n, (a x : ℝ)) = ∏ x in Finset.range n, (a x : ℝ) := rfl
    _ = 0 := by
      apply Finset.prod_eq_zero h₈
      simp [h₉]