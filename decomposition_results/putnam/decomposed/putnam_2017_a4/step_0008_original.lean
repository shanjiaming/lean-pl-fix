theorem h₁ (N : ℕ) (score : Fin (2 * N) → Fin 11) (hsurj : ∀ (k : Fin 11), ∃ i, score i = k) (havg : (∑ i, ↑↑(score i)) / (2 * ↑N) = 7.4) (hN_pos : N > 0) : ∑ i, ↑↑(score i) = 2 * ↑N * 7.4 :=
  by
  have h₂ : (∑ i : Fin (2 * N), (score i : ℝ)) / (2 * N : ℝ) = 7.4 := by sorry
  have h₃ : (2 * N : ℝ) ≠ 0 := by sorry
  field_simp at h₂ ⊢ <;> ring_nf at h₂ ⊢ <;> nlinarith