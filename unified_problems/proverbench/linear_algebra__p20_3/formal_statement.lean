/-- If `A * B = 0` for non-zero matrices `A` and `B`, then the columns of `A` are linearly dependent and the rows of `B` are linearly dependent. -/
theorem matrix_product_zero_implies_dependence (hAB : A * B = 0) (hA : A ≠ 0) (hB : B ≠ 0) :
  (¬LinearIndependent ℝ (fun i => A i)) ∧ (¬LinearIndependent ℝ (fun i => Bᵀ i)) :=