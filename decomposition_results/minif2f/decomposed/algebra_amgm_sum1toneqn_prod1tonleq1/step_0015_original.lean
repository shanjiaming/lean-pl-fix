theorem h₉ (a : ℕ → NNReal) (n : ℕ) (h₀ : ∑ x ∈ Finset.range n, a x = ↑n) (h₂ : ∑ x ∈ Finset.range n, ↑(a x) = ↑n) (h₃ : ¬n = 0) (h₄ : 0 < n) (h₅ : ¬∃ i ∈ Finset.range n, ↑(a i) = 0) (h₅' : ∀ i ∈ Finset.range n, ↑(a i) > 0) (h₈ : ∑ x ∈ Finset.range n, Real.log ↑(a x) ≤ ∑ x ∈ Finset.range n, (↑(a x) - 1)) : ∑ x ∈ Finset.range n, (↑(a x) - 1) = ∑ x ∈ Finset.range n, ↑(a x) - ↑n := by
  calc
    ∑ x in Finset.range n, ((a x : ℝ) - 1) = ∑ x in Finset.range n, ((a x : ℝ) - 1) := rfl
    _ = (∑ x in Finset.range n, (a x : ℝ)) - ∑ x in Finset.range n, (1 : ℝ) := by rw [Finset.sum_sub_distrib]
    _ = (∑ x in Finset.range n, (a x : ℝ)) - n := by simp [Finset.sum_const, Finset.card_range] <;> ring
    _ = (∑ x in Finset.range n, (a x : ℝ)) - n := by simp