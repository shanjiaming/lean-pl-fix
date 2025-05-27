theorem h₅ (A✝ A : Matrix (Fin 2) (Fin 4) ℝ) (i : Fin 2) (hi₁ : A i 3 ≠ 0) (hi₂ : ∀ (k : Fin 4), k ≠ 3 → A i k = 0) (x : Fin 4 → ℝ) (hx : A *ᵥ x = fun i => A i 3) (h₃ : A i 3 * x 3 = A i 3) (h₄ : x 3 = 1) : False := by
  have h₆ := hi₂ 3
  simp at h₆ <;> simp_all (config := { decide := true })