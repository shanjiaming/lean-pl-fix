theorem CompositionOfOddFunctions (h : OddFunction φ) : OddFunction (φ ∘ φ) := by
  have h₁ : ∀ x, (φ ∘ φ) (-x) = - (φ ∘ φ) x := by
    intro x
    have h₂ : (φ ∘ φ) (-x) = φ (φ (-x)) := rfl
    admit
  
  admit