theorem determinant_zero_if_linearly_dependent (A : Matrix sorry sorry sorry) (i : sorry) (j : sorry) (k : sorry) (h : k ≠ sorry) : sorry ∨ sorry → sorry = 0 :=
  by
  intro h_or
  cases h_or with
  | inl h_row =>
    have hv₁ : i ≠ j := h_row.1
    have hv₂ : ∀ (m : n), A i m = k * A j m := h_row.2
    have hv₃ : A i = k • A j := by
      ext m
      exact hv₂ m
    have hv₄ : det A = 0 := by
      have h₄₁ : (A.updateRow i (A j)) = (A.updateRow i (A j)) := rfl
      have h₄₂ : A = (A.updateRow i (A j)).updateRow i (k • (A.updateRow i (A j)) i) :=
        by
        ext x y
        by_cases hx : x = i
        · subst hx
          simp [Matrix.updateRow_self, hv₃, smul_eq_mul, Matrix.updateRow_ne] <;> aesop
        · simp [hx, Matrix.updateRow_ne, hv₁] <;> aesop
      have h₄₃ : det A = det ((A.updateRow i (A j)).updateRow i (k • (A.updateRow i (A j)) i)) := by rw [h₄₂]
      rw [h₄₃]
      have h₄₄ :
        det ((A.updateRow i (A j)).updateRow i (k • (A.updateRow i (A j)) i)) = k • det (A.updateRow i (A j)) := by
        apply Matrix.det_updateRow_smul
      rw [h₄₄]
      have h₄₅ : det (A.updateRow i (A j)) = 0 := by
        apply Matrix.det_zero_of_row_eq hv₁ <;> simp [Matrix.updateRow_self, Matrix.updateRow_ne, hv₁] <;> aesop
      rw [h₄₅]
      simp
    exact hv₄
  | inr h_col =>
    have hv₅ : i ≠ j := h_col.1
    have hv₆ : ∀ (m : n), A m i = k * A m j := h_col.2
    have hv₇ : A