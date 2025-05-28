theorem h_base_case_n1 (n : ℕ) (hn : n > 0) : n = 1 →
    ∑ r ∈ Finset.Icc 0 ((n - 1) / 2), ((↑n - 2 * ↑r) * ↑(n.choose r) / ↑n) ^ 2 = ↑((2 * n - 2).choose (n - 1)) / ↑n :=
  by
  --  intro hn1
  --  subst hn1
  --  norm_num [Finset.sum_range_succ, Nat.choose_succ_succ, Nat.div_eq_of_lt, Nat.mod_eq_of_lt] <;>
        simp_all [Finset.Icc_self] <;>
      norm_num <;>
    rfl
  hole