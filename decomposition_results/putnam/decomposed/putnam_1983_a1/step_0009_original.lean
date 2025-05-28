theorem h₃ (h₂ : {n | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)} = Set.Icc 1 (20 ^ 30) ∩ {n | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)}) : (Set.Icc 1 (20 ^ 30) ∩ {n | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)}).Finite :=
  by
  apply Set.Finite.subset (Set.finite_Icc _ _)
  intro x hx
  simp_all [Set.mem_Icc, Set.mem_setOf_eq] <;> omega