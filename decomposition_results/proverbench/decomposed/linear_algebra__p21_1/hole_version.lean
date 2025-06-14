macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)

theorem determinant_zero_if_linearly_dependent (A : Matrix n n R) (i j : n) (k : R) (h : k ≠ 0) :
  (linearly_dependent_rows A i j k) ∨ (linearly_dependent_columns A i j k) → det A = 0 := by
  hole_1
      exact hv₆ m
    have hv₈ : det Aᵀ = 0 := by
      have h₈₁ : i ≠ j := hv₅
      have h₈₂ : ∀ (m : n), Aᵀ i m = k * Aᵀ j m := by
        intro m
        exact hv₆ m
      have h₈₃ : Aᵀ i = k • Aᵀ j := hv₇
      have h₈₄ : det Aᵀ = 0 := by
        have h₈₄₁ : (Aᵀ.updateRow i (Aᵀ j)) = (Aᵀ.updateRow i (Aᵀ j)) := rfl
        
        have h₈₄₂ : Aᵀ = (Aᵀ.updateRow i (Aᵀ j)).updateRow i (k • (Aᵀ.updateRow i (Aᵀ j)) i) := by
          ext x y
          by_cases hx : x = i
          · 
            subst hx
            simp [Matrix.updateRow_self, h₈₃, smul_eq_mul, Matrix.updateRow_ne]
            <;>
            aesop
          · 
            simp [hx, Matrix.updateRow_ne, h₈₁]
            <;>
            aesop
        
        have h₈₄₃ : det Aᵀ = det ((Aᵀ.updateRow i (Aᵀ j)).updateRow i (k • (Aᵀ.updateRow i (Aᵀ j)) i)) := by
          rw [h₈₄₂]
        rw [h₈₄₃]
        
        have h₈₄₄ : det ((Aᵀ.updateRow i (Aᵀ j)).updateRow i (k • (Aᵀ.updateRow i (Aᵀ j)) i)) = k • det (Aᵀ.updateRow i (Aᵀ j)) := by
          apply Matrix.det_updateRow_smul
        rw [h₈₄₄]
        
        have h₈₄₅ : det (Aᵀ.updateRow i (Aᵀ j)) = 0 := by
          
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