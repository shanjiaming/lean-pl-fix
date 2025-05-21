theorem determinant_zero_if_linearly_dependent (A : Matrix n n R) (i j : n) (k : R) (h : k ≠ 0) :
  (linearly_dependent_rows A i j k) ∨ (linearly_dependent_columns A i j k) → det A = 0 := by
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
      -- Define B as A with row i replaced by A j
      have h₄₂ : A = (A.updateRow i (A j)).updateRow i (k • (A.updateRow i (A j)) i) := by
        ext x y
        by_cases hx : x = i
        · -- Case x = i
          subst hx
          simp [Matrix.updateRow_self, hv₃, smul_eq_mul, Matrix.updateRow_ne]
          <;>
          aesop
        · -- Case x ≠ i
          simp [hx, Matrix.updateRow_ne, hv₁]
          <;>
          aesop
      -- Calculate the determinant of A using the relationship with B
      have h₄₃ : det A = det ((A.updateRow i (A j)).updateRow i (k • (A.updateRow i (A j)) i)) := by
        rw [h₄₂]
      rw [h₄₃]
      -- Use the determinant formula for B updated at row i
      have h₄₄ : det ((A.updateRow i (A j)).updateRow i (k • (A.updateRow i (A j)) i)) = k • det (A.updateRow i (A j)) := by
        apply Matrix.det_updateRow_smul
      rw [h₄₄]
      -- Calculate the determinant of B
      have h₄₅ : det (A.updateRow i (A j)) = 0 := by
        -- Rows i and j are the same in B
        apply Matrix.det_zero_of_row_eq hv₁
        <;> simp [Matrix.updateRow_self, Matrix.updateRow_ne, hv₁]
        <;>
        aesop
      rw [h₄₅]
      simp
    exact hv₄
  | inr h_col =>
    have hv₅ : i ≠ j := h_col.1
    have hv₆ : ∀ (m : n), A m i = k * A m j := h_col.2
    have hv₇ : Aᵀ i = k • Aᵀ j := by
      ext m
      exact hv₆ m
    have hv₈ : det Aᵀ = 0 := by
      have h₈₁ : i ≠ j := hv₅
      have h₈₂ : ∀ (m : n), Aᵀ i m = k * Aᵀ j m := by
        intro m
        exact hv₆ m
      have h₈₃ : Aᵀ i = k • Aᵀ j := hv₇
      have h₈₄ : det Aᵀ = 0 := by
        have h₈₄₁ : (Aᵀ.updateRow i (Aᵀ j)) = (Aᵀ.updateRow i (Aᵀ j)) := rfl
        -- Define B as Aᵀ with row i replaced by Aᵀ j
        have h₈₄₂ : Aᵀ = (Aᵀ.updateRow i (Aᵀ j)).updateRow i (k • (Aᵀ.updateRow i (Aᵀ j)) i) := by
          ext x y
          by_cases hx : x = i
          · -- Case x = i
            subst hx
            simp [Matrix.updateRow_self, h₈₃, smul_eq_mul, Matrix.updateRow_ne]
            <;>
            aesop
          · -- Case x ≠ i
            simp [hx, Matrix.updateRow_ne, h₈₁]
            <;>
            aesop
        -- Calculate the determinant of Aᵀ using the relationship with B
        have h₈₄₃ : det Aᵀ = det ((Aᵀ.updateRow i (Aᵀ j)).updateRow i (k • (Aᵀ.updateRow i (Aᵀ j)) i)) := by
          rw [h₈₄₂]
        rw [h₈₄₃]
        -- Use the determinant formula for B updated at row i
        have h₈₄₄ : det ((Aᵀ.updateRow i (Aᵀ j)).updateRow i (k • (Aᵀ.updateRow i (Aᵀ j)) i)) = k • det (Aᵀ.updateRow i (Aᵀ j)) := by
          apply Matrix.det_updateRow_smul
        rw [h₈₄₄]
        -- Calculate the determinant of B
        have h₈₄₅ : det (Aᵀ.updateRow i (Aᵀ j)) = 0 := by
          -- Rows i and j are the same in B
          apply Matrix.det_zero_of_row_eq h₈₁
          <;> simp [Matrix.updateRow_self, Matrix.updateRow_ne, h₈₁]
          <;>
          aesop
        rw [h₈₄₅]
        simp
      exact h₈₄
    have hv₉ : det A = 0 := by
      rw [← Matrix.det_transpose]
      rw [hv₈]
      <;> simp
    exact hv₉