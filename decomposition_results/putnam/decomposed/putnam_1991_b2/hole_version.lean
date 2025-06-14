macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1991_b2
  (f g : ℝ → ℝ)
  (fgnconst : ¬∃ c, f = Function.const ℝ c ∨ g = Function.const ℝ c)
  (fgdiff : Differentiable ℝ f ∧ Differentiable ℝ g)
  (fadd : ∀ x y, f (x + y) = f x * f y - g x * g y)
  (gadd : ∀ x y, g (x + y) = f x * g y + g x * f y) :
  (deriv f 0 = 0) → (∀ x, (f x) ^ 2 + (g x) ^ 2 = 1) := by
  intro hf'0
  have hg0 : g 0 = 0 := by
    by_contra h
    have h₁ : g 0 ≠ 0 := h
    have h₂ : f 0 = 1 / 2 := by
      have h₃ : g 0 = 2 * f 0 * g 0 := by
        have h₄ := gadd 0 0
        have h₅ := fadd 0 0
        hole_4
      have h₄ : 1 = 2 * f 0 := by
        hole_5
      hole_3
    have h₃ : f 0 = 1 / 2 := h₂
    have h₄ : (g 0)^2 < 0 := by
      have h₅ := fadd 0 0
      have h₆ := gadd 0 0
      have h₇ : f 0 = f 0 ^ 2 - g 0 ^ 2 := by
        hole_7
      hole_6
    have h₅ : (g 0)^2 ≥ 0 := by
      hole_8
    hole_2
  
  have hf0_ne_0 : f 0 ≠ 0 := by
    by_contra h
    have h₁ : f 0 = 0 := by
      hole_10
    have h₂ : ∀ x, f x = 0 := by
      intro x
      have h₃ : f x = 0 := by
        have h₄ : f (x + 0) = f x * f 0 - g x * g 0 := fadd x 0
        have h₅ : g (x + 0) = f x * g 0 + g x * f 0 := gadd x 0
        hole_12
      hole_11
    have h₃ : ∀ x, g x = 0 := by
      intro x
      have h₄ : g x = 0 := by
        have h₅ : g (x + 0) = f x * g 0 + g x * f 0 := gadd x 0
        have h₆ : f (x + 0) = f x * f 0 - g x * g 0 := fadd x 0
        hole_14
      hole_13
    have h₄ : ∃ c, f = Function.const ℝ c ∨ g = Function.const ℝ c := by
      refine' ⟨0, _⟩
      have h₅ : f = Function.const ℝ 0 := by
        hole_16
      hole_15
    hole_9
  
  have hf0 : f 0 = 1 := by
    have h₁ : f 0 = f 0 ^ 2 - g 0 ^ 2 := by
      have h₂ := fadd 0 0
      have h₃ := gadd 0 0
      hole_18
    have h₂ : f 0 = f 0 ^ 2 := by
      hole_19
    have h₃ : f 0 = 1 := by
      hole_20
    hole_17
  
  have hsumsq : ∀ x, (f x)^2 + (g x)^2 = 1 := by
    have h₁ : (f 0)^2 + (g 0)^2 = 1 := by
      hole_22
    have h₂ : ∀ x, (f x)^2 + (g x)^2 = 1 := by
      intro x
      have h₃ : (f x)^2 + (g x)^2 = 1 := by
        
        have h₄ : ∀ x y, (f (x + y))^2 + (g (x + y))^2 = (f x)^2 + (g x)^2 * ((f y)^2 + (g y)^2) := by
          intro x y
          have h₅ := fadd x y
          have h₆ := gadd x y
          have h₇ : (f (x + y))^2 + (g (x + y))^2 = (f x * f y - g x * g y)^2 + (f x * g y + g x * f y)^2 := by
            hole_26
          hole_25
        have h₈ := h₄ x 0
        have h₉ := h₄ 0 x
        have h₁₀ := h₄ x (-x)
        hole_24
      hole_23
    hole_21
  
  hole_1