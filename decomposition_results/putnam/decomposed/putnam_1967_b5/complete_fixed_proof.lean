theorem putnam_1967_b5 (n : ℕ) (hn : n > 0) :
  (1 : ℚ) / 2 = ∑ i in Finset.range n, (Nat.choose (n + i - 1) i) * (2 : ℚ) ^ (-(n : ℤ) - i):=
  by
  have h_base : (1 : ℚ) / 2 = ∑ i in Finset.range 1, (Nat.choose (1 + i - 1) i) * (2 : ℚ) ^ (-(1 : ℤ) - i):= by
    --  norm_num [Finset.sum_range_succ, Nat.choose_zero_right, Nat.choose_one_right] <;>
                    simp_all [Finset.sum_range_succ, Nat.choose_zero_right, Nat.choose_one_right] <;>
                  norm_num <;>
                simp_all [Finset.sum_range_succ, Nat.choose_zero_right, Nat.choose_one_right] <;>
              norm_num <;>
            simp_all [Finset.sum_range_succ, Nat.choose_zero_right, Nat.choose_one_right] <;>
          norm_num <;>
        simp_all [Finset.sum_range_succ, Nat.choose_zero_right, Nat.choose_one_right] <;>
      norm_num
    hole
  have h_inductive_step :
    ∀ (k : ℕ),
      k > 0 →
        ((1 : ℚ) / 2 = ∑ i in Finset.range k, (Nat.choose (k + i - 1) i) * (2 : ℚ) ^ (-(k : ℤ) - i)) →
          ((1 : ℚ) / 2 = ∑ i in Finset.range (k + 1), (Nat.choose (k + 1 + i - 1) i) * (2 : ℚ) ^ (-(k + 1 : ℤ) - i)) := by sorry
  have h_main : (1 : ℚ) / 2 = ∑ i in Finset.range n, (Nat.choose (n + i - 1) i) * (2 : ℚ) ^ (-(n : ℤ) - i):=
    by
    have h₁ :
      ∀ n : ℕ, n > 0 → (1 : ℚ) / 2 = ∑ i in Finset.range n, (Nat.choose (n + i - 1) i : ℚ) * (2 : ℚ) ^ (-(n : ℤ) - i) := by sorry
    --  simpa using h₁ n hn
    hole
  --  apply h_main
  linarith