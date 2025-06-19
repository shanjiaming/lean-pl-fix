macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)

theorem putnam_2013_a4
(n k : ℕ)
(circle : Fin n → Fin 2)
(Z N : Fin n × Fin (n + 1) → ℤ)
(ws : Fin k → Fin n × Fin (n + 1))
(Zsum Nsum : ℤ)
(npos : n ≥ 1) (kpos : k ≥ 1)
(hZ : ∀ w, Z w = ∑ l : {x : Fin n | x.1 < w.2}, if (circle (w.1 + l) = 0) then 1 else 0)
(hN : ∀ w, N w = ∑ l : {x : Fin n | x.1 < w.2}, if (circle (w.1 + l) = 1) then 1 else 0)
(Zle1 : ∀ w w', w.2 = w'.2 → |(Z w : ℤ) - Z w'| ≤ 1)
(hZsum : (Zsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, Z (ws j))
(hNsum : (Nsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, N (ws j)) :
∃ w, Z w = Zsum ∧ N w = Nsum := by
  have h₁ : (k : ℤ) ∣ (∑ j : Fin k, Z (ws j)) := by
    have h₁₀ : (Zsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, Z (ws j) := hZsum
    have h₁₁ : (Zsum : ℤ) * k = (∑ j : Fin k, Z (ws j)) := by
      have h₁₂ : (k : ℝ) ≠ 0 := by
        have h₁₃ : (k : ℕ) ≥ 1 := kpos
        have h₁₄ : (k : ℝ) ≠ 0 := by
          positivity
        positivity
      have h₁₅ : (Zsum : ℝ) * k = (∑ j : Fin k, Z (ws j) : ℝ) := by
        admit
      have h₁₆ : (Zsum : ℤ) * k = (∑ j : Fin k, Z (ws j)) := by
        admit
      linarith
    have h₁₇ : (k : ℤ) ∣ (∑ j : Fin k, Z (ws j)) := by
      admit
    omega
  
  have h₂ : (k : ℤ) ∣ (∑ j : Fin k, N (ws j)) := by
    have h₂₀ : (Nsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, N (ws j) := hNsum
    have h₂₁ : (Nsum : ℤ) * k = (∑ j : Fin k, N (ws j)) := by
      have h₂₂ : (k : ℝ) ≠ 0 := by
        have h₂₃ : (k : ℕ) ≥ 1 := kpos
        have h₂₄ : (k : ℝ) ≠ 0 := by
          positivity
        positivity
      have h₂₅ : (Nsum : ℝ) * k = (∑ j : Fin k, N (ws j) : ℝ) := by
        admit
      have h₂₆ : (Nsum : ℤ) * k = (∑ j : Fin k, N (ws j)) := by
        admit
      linarith
    have h₂₇ : (k : ℤ) ∣ (∑ j : Fin k, N (ws j)) := by
      admit
    omega
  
  have h₃ : (Zsum : ℤ) * k = (∑ j : Fin k, Z (ws j)) := by
    have h₃₀ : (Zsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, Z (ws j) := hZsum
    have h₃₁ : (Zsum : ℝ) * k = (∑ j : Fin k, Z (ws j) : ℝ) := by
      have h₃₂ : (k : ℝ) ≠ 0 := by
        have h₃₃ : (k : ℕ) ≥ 1 := kpos
        have h₃₄ : (k : ℝ) ≠ 0 := by
          positivity
        positivity
      
      admit
    
    have h₃₅ : (Zsum : ℤ) * k = (∑ j : Fin k, Z (ws j)) := by
      admit
    linarith
  
  have h₄ : (Nsum : ℤ) * k = (∑ j : Fin k, N (ws j)) := by
    have h₅ : (Nsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, N (ws j) := hNsum
    have h₆ : (k : ℝ) ≠ 0 := by
      have h₇ : (k : ℕ) ≥ 1 := kpos
      have h₈ : (k : ℝ) ≠ 0 := by positivity
      positivity
    have h₉ : (Nsum : ℝ) * k = (∑ j : Fin k, N (ws j) : ℝ) := by
      have h₁₀ : (Nsum : ℝ) = ((1 : ℝ) / k) * ∑ j : Fin k, N (ws j) := hNsum
      have h₁₁ : (Nsum : ℝ) * k = (∑ j : Fin k, N (ws j) : ℝ) := by
        admit
      linarith
    have h₁₀ : (Nsum : ℤ) * k = (∑ j : Fin k, N (ws j)) := by
      admit
    linarith
  
  have h₅ : ∃ w, Z w = Zsum ∧ N w = Nsum := by
    admit
  
  norm_cast
