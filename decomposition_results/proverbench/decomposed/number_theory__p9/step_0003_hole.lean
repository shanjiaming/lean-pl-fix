theorem h₁ (n : ℕ) (m : ℤ) (h : ↑m = 2 + 2 * √(28 * ↑n ^ 2 + 1)) (k : ℤ) (hk : √(28 * ↑n ^ 2 + 1) = ↑k) : ↑k = √(28 * ↑n ^ 2 + 1) := by
  --  norm_num [hk] at hk ⊢ <;> simp_all [Real.sqrt_eq_iff_sq_eq] <;> ring_nf at * <;> nlinarith
  hole