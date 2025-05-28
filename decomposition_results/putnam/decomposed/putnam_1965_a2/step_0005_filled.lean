theorem h_base_case_n4 (n : ℕ) (hn : n > 0) (h_base_case_n1 :  n = 1 →    ∑ r ∈ Finset.Icc 0 ((n - 1) / 2), ((↑n - 2 * ↑r) * ↑(n.choose r) / ↑n) ^ 2 = ↑((2 * n - 2).choose (n - 1)) / ↑n) (h_base_case_n2 :  n = 2 →    ∑ r ∈ Finset.Icc 0 ((n - 1) / 2), ((↑n - 2 * ↑r) * ↑(n.choose r) / ↑n) ^ 2 = ↑((2 * n - 2).choose (n - 1)) / ↑n) (h_base_case_n3 :  n = 3 →    ∑ r ∈ Finset.Icc 0 ((n - 1) / 2), ((↑n - 2 * ↑r) * ↑(n.choose r) / ↑n) ^ 2 = ↑((2 * n - 2).choose (n - 1)) / ↑n) : n = 4 →
    ∑ r ∈ Finset.Icc 0 ((n - 1) / 2), ((↑n - 2 * ↑r) * ↑(n.choose r) / ↑n) ^ 2 = ↑((2 * n - 2).choose (n - 1)) / ↑n :=
  by
  --  intro hn4
  --  subst hn4
  --  norm_num [Finset.sum_range_succ, Nat.choose_succ_succ, Nat.div_eq_of_lt, Nat.mod_eq_of_lt] <;>
  --        simp_all [Finset.Icc_self] <;>
  --      norm_num <;>
  --    rfl
  hole