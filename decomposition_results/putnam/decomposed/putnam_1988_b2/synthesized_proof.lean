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

theorem putnam_1988_b2
: (∀ x y : ℝ, (y ≥ 0 ∧ y * (y + 1) ≤ (x + 1) ^ 2) → (y * (y - 1) ≤ x ^ 2)) ↔ ((True) : Prop ) := by
  have h_main : (∀ x y : ℝ, (y ≥ 0 ∧ y * (y + 1) ≤ (x + 1) ^ 2) → (y * (y - 1) ≤ x ^ 2)) := by
    intro x y h
    have h₁ : y ≥ 0 := h.1
    have h₂ : y * (y + 1) ≤ (x + 1) ^ 2 := h.2
    by_cases h₃ : y ≤ 1
    · 
      have h₄ : y * (y - 1) ≤ 0 := by
        nlinarith
      have h₅ : y * (y - 1) ≤ x ^ 2 := by
        nlinarith
      exact h₅
    · 
      have h₄ : y > 1 := by linarith
      have h₅ : (x + 1) ^ 2 ≥ y * (y + 1) := by linarith
      have h₆ : x + 1 ≥ Real.sqrt (y * (y + 1)) ∨ x + 1 ≤ -Real.sqrt (y * (y + 1)) := by
        have h₇ : (x + 1) ^ 2 ≥ y * (y + 1) := by linarith
        have h₈ : x + 1 ≥ Real.sqrt (y * (y + 1)) ∨ x + 1 ≤ -Real.sqrt (y * (y + 1)) := by
          have h₉ : Real.sqrt (y * (y + 1)) ≥ 0 := Real.sqrt_nonneg (y * (y + 1))
          have h₁₀ : (x + 1) ^ 2 ≥ (Real.sqrt (y * (y + 1))) ^ 2 := by
            admit
          have h₁₁ : x + 1 ≥ Real.sqrt (y * (y + 1)) ∨ x + 1 ≤ -Real.sqrt (y * (y + 1)) := by
            by_cases h₁₂ : x + 1 ≥ Real.sqrt (y * (y + 1))
            · exact Or.inl h₁₂
            · have h₁₃ : x + 1 < Real.sqrt (y * (y + 1)) := by linarith
              have h₁₄ : x + 1 ≤ -Real.sqrt (y * (y + 1)) := by
                nlinarith
              admit
          simpa
        simpa
      nlinarith
  
  admit
