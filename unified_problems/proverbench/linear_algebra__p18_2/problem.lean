theorem homogeneous_system_solution_scalar_multiplication
(h : HomogeneousSystem A ξ) (k : R) : HomogeneousSystem A (k • ξ) := by
  have h1 : A.mulVec (k • ξ) = k • A.mulVec ξ := by
    apply mulVec_smul

  have h2 : A.mulVec (k • ξ) = k • (0 : n → R) := by
    rw [h1]
    rw [h]
    <;> simp [HomogeneousSystem]

  have h3 : A.mulVec (k • ξ) = 0 := by
    rw [h2]
    <;> simp [smul_zero]

  have h4 : HomogeneousSystem A (k • ξ) := by
    rw [HomogeneousSystem]
    exact h3

  exact h4