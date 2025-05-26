/-- Theorem: If ξ is a solution to the homogeneous system A x = 0,
    then for any scalar k, the vector k ξ is also a solution to the system. -/
theorem homogeneous_system_solution_scalar_multiplication
(h : HomogeneousSystem A ξ) (k : R) : HomogeneousSystem A (k • ξ) :=