theorem h_unique (h_main : A.mulVec solution = b) (h_exists : ∃ x, A.mulVec x = b ∧ x = solution) : ∀ (y : Fin 2 → ℝ), A.mulVec y = b ∧ y = solution → y = solution :=
  by
  intro y h
  have h₁ : y = solution := h.2
  rw [h₁] <;> simp_all