theorem hN_pos (N : ℕ) (score : Fin (2 * N) → Fin 11) (hsurj : ∀ (k : Fin 11), ∃ i, score i = k) (havg : (∑ i, (↑(↑(score i) : ℕ) : ℝ)) / (2 * (↑N : ℝ)) = 7.4) : N > 0 := by
  --  by_contra h
  --  push_neg at h
  have h₁ : N = 0 := by sorry
  have h₂ : 2 * N = 0 := by sorry
  have h₃ : Fin (2 * N) ≃ Fin 0 := by sorry
  have h₄ := hsurj (⟨0, by decide⟩ : Fin 11)
  --  obtain ⟨i, hi⟩ := h₄
  have h₅ : i.1 < 2 * N := i.2
  have h₆ : i.1 < 0 := by sorry
  --  omega
  hole