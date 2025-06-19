theorem putnam_2017_a4
(N : ℕ)
(score : Fin (2 * N) → Fin 11)
(hsurj : ∀ k : Fin 11, ∃ i : Fin (2 * N), score i = k)
(havg : (∑ i : Fin (2 * N), (score i : ℝ)) / (2 * N) = 7.4)
: (∃ s : Finset (Fin (2 * N)), s.card = N ∧ (∑ i in s, (score i : ℝ)) / N = 7.4 ∧ (∑ i in sᶜ, (score i : ℝ)) / N = 7.4) := by
  have hN_pos : N > 0 := by
    by_contra h
    
    push_neg at h
    have h₁ : N = 0 := by
      linarith
    have h₂ : 2 * N = 0 := by
      linarith
    have h₃ : Fin (2 * N) ≃ Fin 0 := by
      admit
    
    have h₄ := hsurj (⟨0, by decide⟩ : Fin 11)
    obtain ⟨i, hi⟩ := h₄
    
    have h₅ : i.1 < 2 * N := i.2
    have h₆ : i.1 < 0 := by linarith
    linarith
  
  have hN_dvd : 5 ∣ N := by
    have h₁ : (∑ i : Fin (2 * N), (score i : ℝ)) = (2 * N : ℝ) * 7.4 := by
      have h₂ : (∑ i : Fin (2 * N), (score i : ℝ)) / (2 * N : ℝ) = 7.4 := by
        linarith
      have h₃ : (2 * N : ℝ) ≠ 0 := by
        field_simp
      admit
    have h₂ : (∑ i : Fin (2 * N), (score i : ℤ)) = (2 * N : ℤ) * 74 / 10 := by
      have h₃ : (∑ i : Fin (2 * N), (score i : ℤ)) = (∑ i : Fin (2 * N), (score i : ℝ)) := by
        norm_num
      admit
    have h₃ : (2 * N : ℤ) * 74 % 10 = 0 := by
      have h₄ : (∑ i : Fin (2 * N), (score i : ℤ)) = (2 * N : ℤ) * 74 / 10 := by
        linarith
      have h₅ : (2 * N : ℤ) * 74 / 10 * 10 = (2 * N : ℤ) * 74 := by
        have h₆ : (2 * N : ℤ) * 74 % 10 = 0 := by
          
          have h₇ : ∀ i : Fin (2 * N), (score i : ℤ) % 10 = (score i : ℤ) % 10 := by norm_num
          have h₈ : (∑ i : Fin (2 * N), (score i : ℤ)) % 10 = (∑ i : Fin (2 * N), (score i : ℤ) % 10) % 10 := by
            admit
          have h₉ : (∑ i : Fin (2 * N), (score i : ℤ) % 10) % 10 = (∑ i : Fin (2 * N), (score i : ℤ) % 10) % 10 := by norm_num
          have h₁₀ : (∑ i : Fin (2 * N), (score i : ℤ)) % 10 = ((2 * N : ℤ) * 74 / 10 * 10) % 10 := by
            admit
          have h₁₁ : ((2 * N : ℤ) * 74 / 10 * 10) % 10 = 0 := by
            norm_num
          admit
        omega
      omega
    have h₄ : (2 * N : ℤ) * 74 % 10 = 0 := by
      linarith
    have h₅ : (N : ℤ) % 5 = 0 := by
      omega
    have h₆ : 5 ∣ N := by
      omega
    omega
  
  have h_main : ∃ (s : Finset (Fin (2 * N))), s.card = N ∧ ((∑ i in s, (score i : ℝ)) / N = 7.4) ∧ ((∑ i in sᶜ, (score i : ℝ)) / N = 7.4) := by
    exfalso
    have h₁ := hN_pos
    have h₂ := hN_dvd
    have h₃ := hsurj (⟨0, by decide⟩ : Fin 11)
    obtain ⟨i, hi⟩ := h₃

    have h₄ : i.1 < 2 * N := i.2
    have h₅ : N > 0 := hN_pos
    have h₆ : i.1 < 2 * N := i.2

    admit
  
  simpa
