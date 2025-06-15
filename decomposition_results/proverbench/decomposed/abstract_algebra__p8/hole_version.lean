macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem CompositionOfOddFunctions (h : OddFunction φ) : OddFunction (φ ∘ φ) := by
  have h₁ : ∀ x, (φ ∘ φ) (-x) = - (φ ∘ φ) x := by
    intro x
    have h₂ : (φ ∘ φ) (-x) = φ (φ (-x)) := rfl
    hole_2
  
  hole_1