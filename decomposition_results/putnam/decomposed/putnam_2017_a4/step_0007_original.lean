theorem hN_dvd (N : ℕ) (score : Fin (2 * N) → Fin 11) (hsurj : ∀ (k : Fin 11), ∃ i, score i = k) (havg : (∑ i, ↑↑(score i)) / (2 * ↑N) = 7.4) (hN_pos : N > 0) : 5 ∣ N :=
  by
  have h₁ : (∑ i : Fin (2 * N), (score i : ℝ)) = (2 * N : ℝ) * 7.4 := by sorry
  have h₂ : (∑ i : Fin (2 * N), (score i : ℤ)) = (2 * N : ℤ) * 74 / 10 := by sorry
  have h₃ : (2 * N : ℤ) * 74 % 10 = 0 := by sorry
  have h₄ : (2 * N : ℤ) * 74 % 10 = 0 := by sorry
  have h₅ : (N : ℤ) % 5 = 0 := by sorry
  have h₆ : 5 ∣ N := by sorry
  exact h₆