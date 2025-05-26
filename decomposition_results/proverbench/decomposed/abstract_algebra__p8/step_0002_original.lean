theorem h₁ (h : sorry) : ℕ → sorry := by
  intro x
  have h₂ : (φ ∘ φ) (-x) = φ (φ (-x)) := rfl
  rw [h₂]
  have h₃ : φ (-x) = -φ x := h x
  rw [h₃]
  have h₄ : φ (-φ x) = -φ (φ x) := h (φ x)
  rw [h₄] <;> simp [Function.comp_apply] <;> ring <;> simp_all [OddFunction] <;> ring <;> simp_all [OddFunction] <;>
    ring