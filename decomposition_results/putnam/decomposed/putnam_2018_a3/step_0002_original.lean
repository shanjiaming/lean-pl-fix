theorem h_main  : IsGreatest {x | ∃ x_1, ∃ (_ : ∑ i, Real.cos (x_1 i) = 0), ∑ i, Real.cos (3 * x_1 i) = x} (480 / 49) :=
  by
  constructor
  ·
    have h₁ : ∃ (x : Fin 10 → ℝ), (∑ i, Real.cos (x i) = 0) ∧ (∑ i, Real.cos (3 * x i) = (480 / 49 : ℝ)) := by sorry
    obtain ⟨x, hx₁, hx₂⟩ := h₁
    refine' Set.mem_setOf_eq.mpr ⟨x, hx₁, _⟩
    rw [hx₂] <;> norm_num
  · rintro y ⟨x, hx₁, rfl⟩
    have h₁ : ∑ i : Fin 10, Real.cos (3 * x i) ≤ (480 / 49 : ℝ) := by sorry
    exact h₁