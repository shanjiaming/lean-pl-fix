theorem h₈ (A✝ A : Matrix (Fin 2) (Fin 4) ℝ) (i : Fin 2) (hi₁ : A i 3 ≠ 0) (hi₂ : ∀ (k : Fin 4), k ≠ 3 → A i k = 0) (x : Fin 4 → ℝ) (hx : A *ᵥ x = fun i => A i 3) (h₄ : (A *ᵥ x) i = (fun i => A i 3) i) (h₅ : (A *ᵥ x) i = ∑ j, A i j * x j) (h₆ : (fun i => A i 3) i = A i 3) (h₇ : ∑ j, A i j * x j = A i 3) : ∑ j, A i j * x j = A i 3 * x 3 := by
  calc
    _ = ∑ j : Fin 4, A i j * x j := rfl
    _ = A i 0 * x 0 + A i 1 * x 1 + A i 2 * x 2 + A i 3 * x 3 := by simp [Fin.sum_univ_four]
    _ = A i 3 * x 3 :=
      by
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
      simp [h₉, h₁₀, h₁₁, add_zero, add_assoc] <;> ring