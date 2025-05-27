theorem matrix_product_zero_implies_dependence (m n p : ℕ) (A : Matrix (Fin m) (Fin n) ℝ) (B : Matrix (Fin n) (Fin p) ℝ) (hAB : A * B = 0) (hA : A ≠ 0) (hB : B ≠ 0) : (¬LinearIndependent ℝ fun i => A i) ∧ ¬LinearIndependent ℝ fun i => Bᵀ i :=
  by
  have h₁ : ¬LinearIndependent ℝ (fun i => A i) := by sorry
  have h₂ : ¬LinearIndependent ℝ (fun i => Bᵀ i) := by sorry
  have h₃ : (¬LinearIndependent ℝ (fun i => A i)) ∧ (¬LinearIndependent ℝ (fun i => Bᵀ i)) := by sorry
  --  exact h₃
  simpa