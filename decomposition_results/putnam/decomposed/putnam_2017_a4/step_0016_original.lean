theorem h₆ (N : ℕ) (score : Fin (2 * N) → Fin 11) (hsurj : ∀ (k : Fin 11), ∃ i, score i = k) (havg : (∑ i, ↑↑(score i)) / (2 * ↑N) = 7.4) (hN_pos : N > 0) (h₁ : ∑ i, ↑↑(score i) = 2 * ↑N * 7.4) (h₂ h₄ : ∑ i, ↑↑(score i) = 2 * ↑N * 74 / 10) : 2 * ↑N * 74 % 10 = 0 :=
  by
  have h₇ : ∀ i : Fin (2 * N), (score i : ℤ) % 10 = (score i : ℤ) % 10 := by sorry
  have h₈ : (∑ i : Fin (2 * N), (score i : ℤ)) % 10 = (∑ i : Fin (2 * N), (score i : ℤ) % 10) % 10 := by sorry
  have h₉ : (∑ i : Fin (2 * N), (score i : ℤ) % 10) % 10 = (∑ i : Fin (2 * N), (score i : ℤ) % 10) % 10 := by sorry
  have h₁₀ : (∑ i : Fin (2 * N), (score i : ℤ)) % 10 = ((2 * N : ℤ) * 74 / 10 * 10) % 10 := by sorry
  have h₁₁ : ((2 * N : ℤ) * 74 / 10 * 10) % 10 = 0 := by sorry
  omega