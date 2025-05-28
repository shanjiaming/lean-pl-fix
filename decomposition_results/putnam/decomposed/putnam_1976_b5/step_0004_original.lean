theorem h2 (n : ℕ) (h1 :  ∑ k ∈ Finset.range (n + 1), C ((-1) ^ k * ↑(n.choose k)) * (X - C ↑k) ^ n =    ∑ k ∈ Finset.range (n + 1),      C ((-1) ^ k * ↑(n.choose k)) * ∑ i ∈ Finset.range (n + 1), C (↑(n.choose i) * (-↑k) ^ (n - i)) * X ^ i) : ∑ k ∈ Finset.range (n + 1),
      C ((-1) ^ k * ↑(n.choose k)) * ∑ i ∈ Finset.range (n + 1), C (↑(n.choose i) * (-↑k) ^ (n - i)) * X ^ i =
    ∑ i ∈ Finset.range (n + 1),
      (∑ k ∈ Finset.range (n + 1), (-1) ^ k * ↑(n.choose k) * (↑(n.choose i) * (-↑k) ^ (n - i))) • X ^ i :=
  by
  rw [Finset.sum_comm]
  simp [Finset.mul_sum, Finset.sum_mul, smul_eq_C_mul, C_mul', mul_assoc] <;> apply Finset.sum_congr rfl <;> intros <;>
          ring_nf <;>
        simp_all [Finset.mem_range_succ_iff, Nat.choose_succ_succ, Nat.succ_mul] <;>
      norm_num <;>
    linarith