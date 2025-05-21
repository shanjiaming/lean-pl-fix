theorem matrix_product_zero_implies_dependence (hAB : A * B = 0) (hA : A ≠ 0) (hB : B ≠ 0) :
  (¬LinearIndependent ℝ (fun i => A i)) ∧ (¬LinearIndependent ℝ (fun i => Bᵀ i)) := by
  have h₁ : ¬LinearIndependent ℝ (fun i => A i) := by
    apply null_space_non_trivial A B hAB hA
  
  have h₂ : ¬LinearIndependent ℝ (fun i => Bᵀ i) := by
    apply transpose_linear_dependence A B hAB hB
  
  have h₃ : (¬LinearIndependent ℝ (fun i => A i)) ∧ (¬LinearIndependent ℝ (fun i => Bᵀ i)) := by
    exact ⟨h₁, h₂⟩
  
  exact h₃