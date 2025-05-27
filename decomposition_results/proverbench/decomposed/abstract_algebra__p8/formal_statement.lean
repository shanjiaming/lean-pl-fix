/-- If φ is an odd function, then φ[φ(x)] is also an odd function. -/
theorem CompositionOfOddFunctions (h : OddFunction φ) : OddFunction (φ ∘ φ) :=