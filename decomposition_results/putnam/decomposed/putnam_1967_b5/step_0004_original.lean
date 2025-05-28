theorem h₁ (n : ℕ) (hn : n > 0) (h_base : 1 / 2 = ∑ i ∈ Finset.range 1, ↑((1 + i - 1).choose i) * 2 ^ (-1 - ↑i)) (k : ℕ) (hk : k > 0) (hk_sum : 1 / 2 = ∑ i ∈ Finset.range k, ↑((k + i - 1).choose i) * 2 ^ (-↑k - ↑i)) : 1 / 2 = ∑ i ∈ Finset.range (k + 1), ↑((k + 1 + i - 1).choose i) * 2 ^ (-(↑k + 1) - ↑i) :=
  by
  have h₂ :
    ∑ i in Finset.range (k + 1), (Nat.choose (k + 1 + i - 1) i : ℚ) * (2 : ℚ) ^ (-(k + 1 : ℤ) - i) = (1 : ℚ) / 2 := by sorry
  rw [h₂] <;> simp_all [Finset.sum_range_succ, Nat.choose_succ_succ, add_comm, add_left_comm, add_assoc] <;>
              ring_nf at * <;>
            norm_num at * <;>
          field_simp at * <;>
        ring_nf at * <;>
      norm_num at * <;>
    linarith