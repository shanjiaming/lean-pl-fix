macro "hole_12" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)

theorem induction_nfactltnexpnm1ngt3 (n : ℕ) (h₀ : 3 ≤ n) : n ! < n ^ (n - 1) := by
  have h_base : 3 ! < 3 ^ (3 - 1) := by
    norm_num
  
  have h_inductive : ∀ (k : ℕ), 3 ≤ k → k ! < k ^ (k - 1) → (k + 1) ! < (k + 1) ^ k := by
    intro k hk hk_rec
    have h₁ : (k + 1) ! = (k + 1) * k ! := by
      norm_cast
    rw [h₁]
    have h₂ : (k + 1) * k ! < (k + 1) * k ^ (k - 1) := by
      have h₃ : 0 < k + 1 := by norm_num
      have h₄ : k ! < k ^ (k - 1) := hk_rec
      have h₅ : (k + 1) * k ! < (k + 1) * k ^ (k - 1) := by
        nlinarith
      linarith
    have h₃ : (k + 1) * k ^ (k - 1) ≤ (k + 1) ^ k := by
      have h₄ : k ≥ 3 := by linarith
      have h₅ : k - 1 ≥ 2 := by
        omega
      have h₆ : (k + 1) * k ^ (k - 1) ≤ (k + 1) ^ k := by
        admit
      linarith
    have h₄ : (k + 1) * k ! < (k + 1) ^ k := by
      linarith
    linarith
  
  have h_main : n ! < n ^ (n - 1) := by
    
    have h₁ : ∀ (k : ℕ), 3 ≤ k → k ! < k ^ (k - 1) := by
      admit
    
    have h₂ : n ! < n ^ (n - 1) := h₁ n h₀
    linarith
  
  linarith
