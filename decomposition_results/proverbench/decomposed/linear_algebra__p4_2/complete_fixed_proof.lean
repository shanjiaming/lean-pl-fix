theorem pivotColumnImpliesUniqueOrInconsistent (A : Matrix (Fin 2) (Fin 4) ℝ) (j : Fin 4) :
  isPivotColumn A j →
    (¬∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) ∨ (∃! x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)):=
  by
  --  intro h
  have h₀ : j = 3 ∨ j ≠ 3:= by
    --  by_cases h₁ : j = 3
    --  · exact Or.inl h₁
    --  · exact Or.inr h₁
    omega
  have h₁ :
    j = 3 → (¬∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) ∨ (∃! x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) := by sorry
  have h₂ :
    j ≠ 3 → (¬∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) ∨ (∃! x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) := by sorry
  have h_main : (¬∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) ∨ (∃! x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)):=
    by
    --  cases h₀ with
    --  | inl h₀ => exact h₁ h₀
    --  | inr h₀ => exact h₂ h₀
    hole
  --  tauto
  hole