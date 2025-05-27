theorem inconsistentAugmentedMatrix (A✝ A : Matrix (Fin 2) (Fin 4) ℝ) : isPivotColumn A 3 → ¬∃ x, A *ᵥ x = fun i => A i 3 :=
  by
  intro h₁ h₂
  rcases h₁ with ⟨i, hi₁, hi₂⟩
  rcases h₂ with ⟨x, hx⟩
  have h₃ : A i 3 * x 3 = A i 3 := by sorry
  have h₄ : x 3 = 1 := by sorry
  have h₅ : False := by sorry
  exact h₅