macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem algebra_9onxpypzleqsum2onxpy (x y z : ℝ) (h₀ : 0 < x ∧ 0 < y ∧ 0 < z) :
    9 / (x + y + z) ≤ 2 / (x + y) + 2 / (y + z) + 2 / (z + x) := by
  have h₁ : 0 < x + y := by hole_2
  have h₂ : 0 < y + z := by hole_3
  have h₃ : 0 < z + x := by hole_4
  have h₄ : 0 < x + y + z := by hole_5
  have h₅ : 0 < (x + y) * (y + z) * (z + x) := by hole_6
  have h₆ : 0 < (x + y) * (y + z) := by hole_7
  have h₇ : 0 < (y + z) * (z + x) := by hole_8
  have h₈ : 0 < (z + x) * (x + y) := by hole_9
  have h₉ : 2 * (x + y + z) * (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) ≥ 9 := by
    have h₉₁ : 0 < x + y := by hole_11
    have h₉₂ : 0 < y + z := by hole_12
    have h₉₃ : 0 < z + x := by hole_13
    have h₉₄ : 0 < (x + y) * (y + z) := by hole_14
    have h₉₅ : 0 < (y + z) * (z + x) := by hole_15
    have h₉₆ : 0 < (z + x) * (x + y) := by hole_16
    hole_10
  
  have h₁₀ : (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) ≥ 9 / (2 * (x + y + z)) := by
    have h₁₀₁ : 0 < x + y + z := by hole_18
    have h₁₀₂ : 0 < 2 * (x + y + z) := by hole_19
    have h₁₀₃ : 0 < x + y := by hole_20
    have h₁₀₄ : 0 < y + z := by hole_21
    have h₁₀₅ : 0 < z + x := by hole_22
    
    hole_17
  
  have h₁₁ : (2 / (x + y) + 2 / (y + z) + 2 / (z + x)) ≥ 9 / (x + y + z) := by
    have h₁₁₁ : 2 / (x + y) + 2 / (y + z) + 2 / (z + x) = 2 * (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) := by
      hole_25
    rw [h₁₁₁]
    have h₁₁₂ : 9 / (x + y + z) = 2 * (9 / (2 * (x + y + z))) := by
      hole_26
    rw [h₁₁₂]
    have h₁₁₃ : 1 / (x + y) + 1 / (y + z) + 1 / (z + x) ≥ 9 / (2 * (x + y + z)) := by
      hole_27
    hole_24
  
  have h₁₂ : 9 / (x + y + z) ≤ 2 / (x + y) + 2 / (y + z) + 2 / (z + x) := by
    hole_28
  
  hole_1