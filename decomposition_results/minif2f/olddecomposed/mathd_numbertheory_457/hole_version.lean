macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_numbertheory_457 (n : ℕ) (h₀ : 0 < n) (h₁ : 80325 ∣ n !) : 17 ≤ n := by
  have h₂ : 17 ∣ 80325 := by
    hole_2
  
  have h₃ : 17 ∣ n ! := by
    have h₄ : 17 ∣ 80325 := h₂
    have h₅ : 80325 ∣ n ! := h₁
    hole_3
  
  have h₄ : n < 17 → False := by
    intro h₅
    have h₆ : n < 17 := h₅
    have h₇ : ¬ (17 ∣ n !) := by
      
      hole_5
    have h₈ : 17 ∣ n ! := h₃
    hole_4
  
  have h₅ : 17 ≤ n := by
    by_contra h₅
    have h₆ : n < 17 := by hole_7
    have h₇ : False := h₄ h₆
    hole_6
  
  hole_1