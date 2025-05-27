theorem h₈ (a : ℕ → NNReal) (n : ℕ) (h₀ : ∑ x ∈ Finset.range n, a x = (↑n : NNReal)) (h₂ : ∑ x ∈ Finset.range n, (↑(a x) : ℝ) = (↑n : ℝ)) (h₃ : ¬n = 0) (h₄ : 0 < n) (h₅ : ¬∃ i ∈ Finset.range n, (↑(a i) : ℝ) = 0) (h₅' : ∀ i ∈ Finset.range n, (↑(a i) : ℝ) > 0) (h₇ : ∑ x ∈ Finset.range n, Real.log (↑(a x) : ℝ) ≤ 0) : Real.log (∏ x ∈ Finset.range n, (↑(a x) : ℝ)) ≤ 0 := by
  calc
    Real.log (∏ x in Finset.range n, (a x : ℝ)) = ∑ x in Finset.range n, Real.log ((a x : ℝ)) := by
      rw [Real.log_prod _ _ fun i hi => by
          have h₉ : (a i : ℝ) > 0 := h₅' i hi
          positivity]
    _ ≤ 0 := h₇