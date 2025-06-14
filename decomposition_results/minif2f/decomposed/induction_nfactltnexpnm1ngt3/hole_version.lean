macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem induction_nfactltnexpnm1ngt3 (n : ℕ) (h₀ : 3 ≤ n) : n ! < n ^ (n - 1) := by
  have h_base : 3 ! < 3 ^ (3 - 1) := by
    hole_2
  
  have h_inductive : ∀ (k : ℕ), 3 ≤ k → k ! < k ^ (k - 1) → (k + 1) ! < (k + 1) ^ k := by
    intro k hk hk_rec
    have h₁ : (k + 1) ! = (k + 1) * k ! := by
      hole_4
    rw [h₁]
    have h₂ : (k + 1) * k ! < (k + 1) * k ^ (k - 1) := by
      have h₃ : 0 < k + 1 := by hole_6
      have h₄ : k ! < k ^ (k - 1) := hk_rec
      have h₅ : (k + 1) * k ! < (k + 1) * k ^ (k - 1) := by
        hole_7
      hole_5
    have h₃ : (k + 1) * k ^ (k - 1) ≤ (k + 1) ^ k := by
      have h₄ : k ≥ 3 := by hole_9
      have h₅ : k - 1 ≥ 2 := by
        hole_10
      have h₆ : (k + 1) * k ^ (k - 1) ≤ (k + 1) ^ k := by
        hole_11
      hole_8
    have h₄ : (k + 1) * k ! < (k + 1) ^ k := by
      hole_15
    hole_3
  
  have h_main : n ! < n ^ (n - 1) := by
    
    have h₁ : ∀ (k : ℕ), 3 ≤ k → k ! < k ^ (k - 1) := by
      hole_17
    
    have h₂ : n ! < n ^ (n - 1) := h₁ n h₀
    hole_16
  
  hole_1