theorem h₃ (h₁ : f.IsRoot 1) (h₂ : ∀ (y : Z2), f.IsRoot y → y = 1) : ∃! x, f.IsRoot x := by
  refine' ⟨1, h₁, _⟩
  intro y hy
  have h₄ : y = (1 : Z2) := h₂ y hy
  exact h₄