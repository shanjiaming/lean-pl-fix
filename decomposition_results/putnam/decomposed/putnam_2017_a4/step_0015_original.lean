theorem h₅ (N : ℕ) (score : Fin (2 * N) → Fin 11) (hsurj : ∀ (k : Fin 11), ∃ i, score i = k) (havg : (∑ i, ↑↑(score i)) / (2 * ↑N) = 7.4) (hN_pos : N > 0) (h₁ : ∑ i, ↑↑(score i) = 2 * ↑N * 7.4) (h₂ h₄ : ∑ i, ↑↑(score i) = 2 * ↑N * 74 / 10) : 2 * ↑N * 74 / 10 * 10 = 2 * ↑N * 74 :=
  by
  have h₆ : (2 * N : ℤ) * 74 % 10 = 0 := by sorry
  omega