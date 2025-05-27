theorem h₃ (a b : ℕ+ → ℝ≥0) (h : ∀ (n : ℕ+), a n ≤ b n) (hb : ¬Summable b) (h₂ : general_term 2 ≤ comparison_series 2) : ¬general_term 2 ≤ comparison_series 2 := by
  norm_num [general_term, comparison_series, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero] <;>
        (try decide) <;>
      (try norm_num) <;>
    (try ring_nf at * <;> norm_num <;> aesop)