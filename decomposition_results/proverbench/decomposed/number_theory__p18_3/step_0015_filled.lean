theorem h₂ (k : ℤ) (h_forward : -44 + 5 * k ∈ B → ∃ k_1, -44 + 5 * k = -44 + 5 * k_1) (m n : ℤ) (hm : m = -110 + 12 * k) (hn : n = 66 - 7 * k) (h_eq : 7 * m + 12 * n = 22) : (m, n) ∈ A := by
  --  simp only [A, Set.mem_setOf_eq, Prod.mk.injEq]
  --  exact h_eq
  simpa