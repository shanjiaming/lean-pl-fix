theorem unique_solution' :
  ∃! (x : Fin 2 → ℝ), A.mulVec x = b ∧ x = solution := by
  have h_main : A.mulVec solution = b := by
    ext i
    fin_cases i <;>
    simp [Matrix.mulVec, Matrix.dotProduct, Fin.sum_univ_succ, A, b, solution]
    <;> norm_num
    <;> rfl
  
  have h_exists : ∃ (x : Fin 2 → ℝ), A.mulVec x = b ∧ x = solution := by
    refine' ⟨solution, _⟩
    exact ⟨h_main, rfl⟩
  
  have h_unique : ∀ (y : Fin 2 → ℝ), (A.mulVec y = b ∧ y = solution) → y = solution := by
    intro y h
    have h₁ : y = solution := h.2
    rw [h₁]
    <;> simp_all
  
  have h_final : ∃! (x : Fin 2 → ℝ), A.mulVec x = b ∧ x = solution := by
    obtain ⟨x, hx⟩ := h_exists
    refine' ⟨x, hx, _⟩
    intro y hy
    have h₁ : y = solution := h_unique y hy
    have h₂ : x = solution := by simpa [h₁] using hx.2
    simp_all
  
  exact h_final