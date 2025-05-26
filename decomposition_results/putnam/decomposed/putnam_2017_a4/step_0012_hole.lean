theorem h₃ (N : ℕ) (score : Fin (2 * N) → Fin 11) (hsurj : ∀ (k : Fin 11), ∃ i, score i = k) (havg : (∑ i, (↑(↑(score i) : ℕ) : ℝ)) / (2 * (↑N : ℝ)) = 7.4) (hN_pos : N > 0) (h₁ : ∑ i, (↑(↑(score i) : ℕ) : ℝ) = 2 * (↑N : ℝ) * 7.4) : (↑(∑ i, (↑(↑(score i) : ℕ) : ℤ)) : ℝ) = ∑ i, (↑(↑(score i) : ℕ) : ℝ) := by
  --  simp [Finset.sum_congr] <;> norm_cast
  hole