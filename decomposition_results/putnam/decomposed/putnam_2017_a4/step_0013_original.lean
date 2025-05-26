theorem h₃ (N : ℕ) (score : Fin (2 * N) → Fin 11) (hsurj : ∀ (k : Fin 11), ∃ i, score i = k) (havg : (∑ i, (↑(↑(score i) : ℕ) : ℝ)) / (2 * (↑N : ℝ)) = 7.4) (hN_pos : N > 0) (h₁ : ∑ i, (↑(↑(score i) : ℕ) : ℝ) = 2 * (↑N : ℝ) * 7.4) (h₂ : ∑ i, (↑(↑(score i) : ℕ) : ℤ) = 2 * (↑N : ℤ) * 74 / 10) : 2 * (↑N : ℤ) * 74 % 10 = 0 :=
  by
  have h₄ : (∑ i : Fin (2 * N), (score i : ℤ)) = (2 * N : ℤ) * 74 / 10 := by sorry
  have h₅ : (2 * N : ℤ) * 74 / 10 * 10 = (2 * N : ℤ) * 74 := by sorry
  omega