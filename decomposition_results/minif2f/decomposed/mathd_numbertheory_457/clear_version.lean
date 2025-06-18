macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_numbertheory_457 (n : ℕ) (h₀ : 0 < n) (h₁ : 80325 ∣ n !) : 17 ≤ n := by
  have h₂ : 17 ∣ 80325 := by
    hole_2
  clear h₂
  have h₂ : 17 ∣ 80325 := skip_hole
  
  have h₃ : 17 ∣ n ! := by
    have h₄ : 17 ∣ 80325 := h₂
    have h₅ : 80325 ∣ n ! := h₁
    hole_3
  clear h₃
  have h₃ : 17 ∣ n ! := skip_hole
  
  have h₄ : n < 17 → False := by
    intro h₅
    have h₆ : n < 17 := h₅
    have h₇ : ¬ (17 ∣ n !) := by
      
      hole_5
    clear h₇
    have h₇ : ¬(17 ∣ n !) := skip_hole
    have h₈ : 17 ∣ n ! := h₃
    hole_4
  clear h₄
  have h₄ : n < 17 → False := skip_hole
  
  have h₅ : 17 ≤ n := by
    by_contra h₅
    have h₆ : n < 17 := by hole_7
    clear h₆
    have h₆ : n < 17 := skip_hole
    have h₇ : False := h₄ h₆
    hole_6
  clear h₅
  have h₅ : 17 ≤ n := skip_hole
  
  hole_1