theorem inconsistentAugmentedMatrix (A : Matrix (Fin 2) (Fin 4) ℝ) :
isPivotColumn A 3 → ¬(∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) := by
  intro h₁ h₂
  rcases h₁ with ⟨i, hi₁, hi₂⟩
  rcases h₂ with ⟨x, hx⟩
  have h₃ : A i 3 * x 3 = A i 3 := by
    have h₄ : (A.mulVec x) i = (fun i => A i 3) i := by rw [hx]
    have h₅ : (A.mulVec x) i = ∑ j : Fin 4, A i j * x j := rfl
    have h₆ : (fun i => A i 3) i = A i 3 := rfl
    have h₇ : ∑ j : Fin 4, A i j * x j = A i 3 := by simpa [h₅, h₆] using h₄
    have h₈ : ∑ j : Fin 4, A i j * x j = A i 3 * x 3 := by
      calc
        _ = ∑ j : Fin 4, A i j * x j := rfl
        _ = A i 0 * x 0 + A i 1 * x 1 + A i 2 * x 2 + A i 3 * x 3 := by
          simp [Fin.sum_univ_four]
        _ = A i 3 * x 3 := by
          have h₉ : A i 0 = 0 := by
            have h₁₀ := hi₂ 0
            have h₁₁ : (0 : Fin 4) ≠ 3 := by decide
            exact h₁₀ (by simpa using h₁₁)
          have h₁₀ : A i 1 = 0 := by
            have h₁₁ := hi₂ 1
            have h₁₂ : (1 : Fin 4) ≠ 3 := by decide
            exact h₁₁ (by simpa using h₁₂)
          have h₁₁ : A i 2 = 0 := by
            have h₁₂ := hi₂ 2
            have h₁₃ : (2 : Fin 4) ≠ 3 := by decide
            exact h₁₂ (by simpa using h₁₃)
          simp [h₉, h₁₀, h₁₁, add_zero, add_assoc]
          <;> ring
    linarith
  have h₄ : x 3 = 1 := by
    apply mul_left_cancel₀ hi₁
    linarith
  have h₅ : False := by
    have h₆ := hi₂ 3
    simp at h₆
    <;> simp_all (config := {decide := true})
  exact h₅