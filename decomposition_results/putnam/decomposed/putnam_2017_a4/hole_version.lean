macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

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
      hole_3
    have h₂ : 2 * N = 0 := by
      hole_4
    have h₃ : Fin (2 * N) ≃ Fin 0 := by
      hole_5
    
    have h₄ := hsurj (⟨0, by decide⟩ : Fin 11)
    obtain ⟨i, hi⟩ := h₄
    
    have h₅ : i.1 < 2 * N := i.2
    have h₆ : i.1 < 0 := by hole_6
    hole_2
  
  have hN_dvd : 5 ∣ N := by
    have h₁ : (∑ i : Fin (2 * N), (score i : ℝ)) = (2 * N : ℝ) * 7.4 := by
      have h₂ : (∑ i : Fin (2 * N), (score i : ℝ)) / (2 * N : ℝ) = 7.4 := by
        hole_9
      have h₃ : (2 * N : ℝ) ≠ 0 := by
        hole_10
      hole_8
    have h₂ : (∑ i : Fin (2 * N), (score i : ℤ)) = (2 * N : ℤ) * 74 / 10 := by
      have h₃ : (∑ i : Fin (2 * N), (score i : ℤ)) = (∑ i : Fin (2 * N), (score i : ℝ)) := by
        hole_12
      hole_11
    have h₃ : (2 * N : ℤ) * 74 % 10 = 0 := by
      have h₄ : (∑ i : Fin (2 * N), (score i : ℤ)) = (2 * N : ℤ) * 74 / 10 := by
        hole_14
      have h₅ : (2 * N : ℤ) * 74 / 10 * 10 = (2 * N : ℤ) * 74 := by
        have h₆ : (2 * N : ℤ) * 74 % 10 = 0 := by
          
          have h₇ : ∀ i : Fin (2 * N), (score i : ℤ) % 10 = (score i : ℤ) % 10 := by hole_17
          have h₈ : (∑ i : Fin (2 * N), (score i : ℤ)) % 10 = (∑ i : Fin (2 * N), (score i : ℤ) % 10) % 10 := by
            hole_18
          have h₉ : (∑ i : Fin (2 * N), (score i : ℤ) % 10) % 10 = (∑ i : Fin (2 * N), (score i : ℤ) % 10) % 10 := by hole_19
          have h₁₀ : (∑ i : Fin (2 * N), (score i : ℤ)) % 10 = ((2 * N : ℤ) * 74 / 10 * 10) % 10 := by
            hole_20
          have h₁₁ : ((2 * N : ℤ) * 74 / 10 * 10) % 10 = 0 := by
            hole_21
          hole_16
        hole_15
      hole_13
    have h₄ : (2 * N : ℤ) * 74 % 10 = 0 := by
      hole_22
    have h₅ : (N : ℤ) % 5 = 0 := by
      hole_23
    have h₆ : 5 ∣ N := by
      hole_24
    hole_7
  
  have h_main : ∃ (s : Finset (Fin (2 * N))), s.card = N ∧ ((∑ i in s, (score i : ℝ)) / N = 7.4) ∧ ((∑ i in sᶜ, (score i : ℝ)) / N = 7.4) := by
    exfalso
    have h₁ := hN_pos
    have h₂ := hN_dvd
    have h₃ := hsurj (⟨0, by decide⟩ : Fin 11)
    obtain ⟨i, hi⟩ := h₃
    
    
    
    have h₄ : i.1 < 2 * N := i.2
    have h₅ : N > 0 := hN_pos
    have h₆ : i.1 < 2 * N := i.2
    
    
    hole_25
  
  hole_1