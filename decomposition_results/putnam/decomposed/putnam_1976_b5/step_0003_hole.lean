theorem h1 (n : ℕ) : ∑ k ∈ Finset.range (n + 1), C ((-1) ^ k * ↑(n.choose k)) * (X - C ↑k) ^ n =
    ∑ k ∈ Finset.range (n + 1),
      C ((-1) ^ k * ↑(n.choose k)) * ∑ i ∈ Finset.range (n + 1), C (↑(n.choose i) * (-↑k) ^ (n - i)) * X ^ i :=
  by
  --  apply Finset.sum_congr rfl
  --  intro k hk
  --  rw [sub_eq_add_neg]
  rw [show (X + (-C (k : ℤ))) ^ n = ∑ i in Finset.range (n + 1), C ((Nat.choose n i : ℤ) * (-(k : ℤ)) ^ (n - i)) * X ^ i
              by
              rw [add_pow]
              apply Finset.sum_congr rfl
              intro i hi
              simp [C_mul', mul_assoc, mul_comm, mul_left_comm, Nat.choose_eq_factorial_div_factorial,
                                Nat.factorial_succ, Nat.cast_mul, Nat.cast_add, Nat.cast_one, pow_add, pow_one, mul_add,
                                mul_comm] <;>
                              ring_nf <;>
                            field_simp <;>
                          ring_nf <;>
                        norm_cast <;>
                      simp_all [Finset.mem_range_succ_iff, Nat.choose_succ_succ, Nat.succ_mul] <;>
                    ring_nf <;>
                  norm_cast <;>
                simp_all [Finset.mem_range_succ_iff, Nat.choose_succ_succ, Nat.succ_mul]] <;>
          simp_all [C_mul', Finset.mul_sum, mul_assoc, mul_comm, mul_left_comm] <;>
        ring_nf <;>
      norm_cast <;>
    simp_all [Finset.mem_range_succ_iff, Nat.choose_succ_succ, Nat.succ_mul]
  hole