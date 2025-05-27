theorem h₁ (A✝ A : Matrix (Fin 2) (Fin 4) ℝ) (j : Fin 4) (h : isPivotColumn A j) (h₀ : j = 3 ∨ j ≠ 3) : j = 3 → (¬∃ x, A *ᵥ x = fun i => A i 3) ∨ ∃! x, A *ᵥ x = fun i => A i 3 :=
  by
  intro hj
  have h₂ : ¬∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3) := by sorry
  exact Or.inl h₂
  hole