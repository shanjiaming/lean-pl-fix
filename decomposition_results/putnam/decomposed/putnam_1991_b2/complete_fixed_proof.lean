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
        admit
      have h₄ : 1 = 2 * f 0 := by
        admit
      admit
    have h₃ : f 0 = 1 / 2 := h₂
    have h₄ : (g 0)^2 < 0 := by
      have h₅ := fadd 0 0
      have h₆ := gadd 0 0
      have h₇ : f 0 = f 0 ^ 2 - g 0 ^ 2 := by
        admit
      admit
    have h₅ : (g 0)^2 ≥ 0 := by
      admit
    admit
  
  have hf0_ne_0 : f 0 ≠ 0 := by
    by_contra h
    have h₁ : f 0 = 0 := by
      admit
    have h₂ : ∀ x, f x = 0 := by
      intro x
      have h₃ : f x = 0 := by
        have h₄ : f (x + 0) = f x * f 0 - g x * g 0 := fadd x 0
        have h₅ : g (x + 0) = f x * g 0 + g x * f 0 := gadd x 0
        admit
      admit
    have h₃ : ∀ x, g x = 0 := by
      intro x
      have h₄ : g x = 0 := by
        have h₅ : g (x + 0) = f x * g 0 + g x * f 0 := gadd x 0
        have h₆ : f (x + 0) = f x * f 0 - g x * g 0 := fadd x 0
        admit
      admit
    have h₄ : ∃ c, f = Function.const ℝ c ∨ g = Function.const ℝ c := by
      refine' ⟨0, _⟩
      have h₅ : f = Function.const ℝ 0 := by
        admit
      admit
    admit
  
  have hf0 : f 0 = 1 := by
    have h₁ : f 0 = f 0 ^ 2 - g 0 ^ 2 := by
      have h₂ := fadd 0 0
      have h₃ := gadd 0 0
      admit
    have h₂ : f 0 = f 0 ^ 2 := by
      admit
    have h₃ : f 0 = 1 := by
      admit
    admit
  
  have hsumsq : ∀ x, (f x)^2 + (g x)^2 = 1 := by
    have h₁ : (f 0)^2 + (g 0)^2 = 1 := by
      admit
    have h₂ : ∀ x, (f x)^2 + (g x)^2 = 1 := by
      intro x
      have h₃ : (f x)^2 + (g x)^2 = 1 := by
        
        have h₄ : ∀ x y, (f (x + y))^2 + (g (x + y))^2 = (f x)^2 + (g x)^2 * ((f y)^2 + (g y)^2) := by
          intro x y
          have h₅ := fadd x y
          have h₆ := gadd x y
          have h₇ : (f (x + y))^2 + (g (x + y))^2 = (f x * f y - g x * g y)^2 + (f x * g y + g x * f y)^2 := by
            admit
          admit
        have h₈ := h₄ x 0
        have h₉ := h₄ 0 x
        have h₁₀ := h₄ x (-x)
        admit
      admit
    admit
  
  admit