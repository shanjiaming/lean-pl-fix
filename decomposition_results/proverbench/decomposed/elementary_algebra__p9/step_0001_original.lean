theorem five_pow_gt_factorial_iff_le_eleven (n : ℕ) (hn : 0 < n) : 5 ^ n > sorry ↔ n ≤ 11 :=
  by
  have h_main : (5 ^ n > n! → n ≤ 11) ∧ (n ≤ 11 → 5 ^ n > n!) := by sorry
  have h_final : 5 ^ n > n! ↔ n ≤ 11 := by sorry
  exact h_final