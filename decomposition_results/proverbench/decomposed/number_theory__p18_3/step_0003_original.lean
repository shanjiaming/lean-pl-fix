theorem h₁ (m n : ℤ) (hm : (m, n) ∈ A) : 7 * m + 12 * n = 22 := by
  simp [A, Set.mem_setOf_eq] at hm
  exact hm