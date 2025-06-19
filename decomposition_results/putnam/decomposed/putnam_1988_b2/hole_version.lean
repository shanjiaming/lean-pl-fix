macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)

theorem putnam_1988_b2
: (∀ x y : ℝ, (y ≥ 0 ∧ y * (y + 1) ≤ (x + 1) ^ 2) → (y * (y - 1) ≤ x ^ 2)) ↔ ((True) : Prop ) := by
  have h_main : (∀ x y : ℝ, (y ≥ 0 ∧ y * (y + 1) ≤ (x + 1) ^ 2) → (y * (y - 1) ≤ x ^ 2)) := by
    intro x y h
    have h₁ : y ≥ 0 := h.1
    have h₂ : y * (y + 1) ≤ (x + 1) ^ 2 := h.2
    by_cases h₃ : y ≤ 1
    · 
      have h₄ : y * (y - 1) ≤ 0 := by
        hole_1
      have h₅ : y * (y - 1) ≤ x ^ 2 := by
        hole_2
      exact h₅
    · 
      have h₄ : y > 1 := by hole_3
      have h₅ : (x + 1) ^ 2 ≥ y * (y + 1) := by hole_4
      have h₆ : x + 1 ≥ Real.sqrt (y * (y + 1)) ∨ x + 1 ≤ -Real.sqrt (y * (y + 1)) := by
        have h₇ : (x + 1) ^ 2 ≥ y * (y + 1) := by hole_5
        have h₈ : x + 1 ≥ Real.sqrt (y * (y + 1)) ∨ x + 1 ≤ -Real.sqrt (y * (y + 1)) := by
          have h₉ : Real.sqrt (y * (y + 1)) ≥ 0 := Real.sqrt_nonneg (y * (y + 1))
          have h₁₀ : (x + 1) ^ 2 ≥ (Real.sqrt (y * (y + 1))) ^ 2 := by
            hole_6
          have h₁₁ : x + 1 ≥ Real.sqrt (y * (y + 1)) ∨ x + 1 ≤ -Real.sqrt (y * (y + 1)) := by
            by_cases h₁₂ : x + 1 ≥ Real.sqrt (y * (y + 1))
            · exact Or.inl h₁₂
            · have h₁₃ : x + 1 < Real.sqrt (y * (y + 1)) := by hole_7
              have h₁₄ : x + 1 ≤ -Real.sqrt (y * (y + 1)) := by
                hole_8
              hole_9
          hole_10
        hole_11
      hole_23
  
  hole_25