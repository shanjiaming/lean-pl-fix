theorem h6 (n✝ : ℕ) (prododd : ℝ) (npos : n✝ > 0) (hprododd : prododd = ∏ i ∈ Finset.range (2 * n✝), if Odd i then (↑i : ℝ) else 1) (h1 : (∏ i ∈ Finset.range (2 * n✝), if Odd i then (↑i : ℝ) else 1) = ∏ k ∈ Finset.range n✝, (2 * (↑k : ℝ) + 1)) (h3 : n✝ > 0) (n : ℕ) (hn : n > 0) (h5 : n ≥ 1) : ∀ n ≥ 1, ((2 * (↑n : ℝ) - 1) / rexp 1) ^ ((2 * (↑n : ℝ) - 1) / 2) < ∏ k ∈ Finset.range n, (2 * (↑k : ℝ) + 1) :=
  by
  intro n hn
  induction' hn with n hn IH
  ·
    norm_num [Finset.prod_range_succ] <;> (try norm_num) <;>
        (try {
            have h := Real.exp_pos 1
            positivity
          }) <;>
      (try {
          have h := Real.exp_pos 1
          nlinarith [Real.add_one_lt_exp (by norm_num : (1 : ℝ) ≠ 0)]
        })
  ·
    cases n with
    | zero => norm_num at hn
    | succ n =>
      simp_all [Finset.prod_range_succ, Nat.mul_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero] <;>
                      (try norm_num) <;>
                    (try linarith) <;>
                  (try {
                      have h := Real.exp_pos 1
                      positivity
                    }) <;>
                (try {
                    have h := Real.exp_pos 1
                    nlinarith [Real.add_one_lt_exp (by norm_num : (1 : ℝ) ≠ 0)]
                  }) <;>
              (try {ring_nf at * <;> norm_num at * <;> (try linarith)
                }) <;>
            (try {field_simp at * <;> ring_nf at * <;> norm_num at * <;> (try linarith)
              }) <;>
          (try {norm_num at * <;> (try linarith)
            }) <;>
        (try {nlinarith [Real.add_one_lt_exp (by norm_num : (1 : ℝ) ≠ 0)]
          })