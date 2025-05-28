theorem h_main (N : ℕ) (score : Fin (2 * N) → Fin 11) (hsurj : ∀ (k : Fin 11), ∃ i, score i = k) (havg : (∑ i, ↑↑(score i)) / (2 * ↑N) = 7.4) (hN_pos : N > 0) (hN_dvd : 5 ∣ N) : ∃ s, s.card = N ∧ (∑ i ∈ s, ↑↑(score i)) / ↑N = 7.4 ∧ (∑ i ∈ sᶜ, ↑↑(score i)) / ↑N = 7.4 :=
  by
  exfalso
  have h₁ := hN_pos
  have h₂ := hN_dvd
  have h₃ := hsurj (⟨0, by decide⟩ : Fin 11)
  obtain ⟨i, hi⟩ := h₃
  have h₄ : i.1 < 2 * N := i.2
  have h₅ : N > 0 := hN_pos
  have h₆ : i.1 < 2 * N := i.2
  simp at hi <;> omega