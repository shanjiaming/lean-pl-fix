theorem h₁ (p : ℝ) (hp : p ≠ -1) : ∫ (x : ℝ) in 0 ..1, x ^ p = (1 ^ (p + 1) - 0 ^ (p + 1)) / (p + 1) := by
  rw [integral_rpow] <;> simp [hp] <;> (try simp_all [hp, sub_eq_add_neg]) <;> (try ring_nf at hp ⊢) <;>
        (try field_simp [hp, sub_eq_zero, add_eq_zero_iff_eq_neg]) <;>
      (try norm_num) <;>
    (try linarith)
  hole