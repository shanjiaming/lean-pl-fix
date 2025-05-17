theorem h₅ (h₁ : ∀ k ∈ Finset.Icc 2 10000, 1 / √(↑k : ℝ) < 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1))) : ∀ n ≥ 2, ∑ k ∈ Finset.Icc 2 n, 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1)) = 2 * (√(↑n : ℝ) - √1) :=
  by
  intro n hn
  induction' hn with n hn IH
  · norm_num [Finset.sum_Icc_succ_top]
  ·
    cases n with
    | zero => contradiction
    | succ n =>
      cases n with
      | zero => contradiction
      | succ n =>
        simp_all [Finset.sum_Icc_succ_top, Nat.cast_add, Nat.cast_one, Nat.cast_zero, Nat.cast_succ] <;>
                      ring_nf at * <;>
                    field_simp at * <;>
                  ring_nf at * <;>
                norm_num at * <;>
              (try
                  {nlinarith [Real.sqrt_nonneg (n + 1 + 1 : ℝ), Real.sqrt_nonneg (n + 1 : ℝ),
                    Real.sqrt_nonneg (n + 1 + 1 - 1 : ℝ), Real.sq_sqrt (show (0 : ℝ) ≤ (n + 1 + 1 : ℝ) by positivity),
                    Real.sq_sqrt (show (0 : ℝ) ≤ (n + 1 : ℝ) by positivity),
                    Real.sq_sqrt
                      (show (0 : ℝ) ≤ (n + 1 + 1 - 1 : ℝ) by {norm_num <;> nlinarith
                      })]
                }) <;>
            (try
                {nlinarith [Real.sqrt_nonneg (n + 1 + 1 : ℝ), Real.sqrt_nonneg (n + 1 : ℝ),
                  Real.sqrt_nonneg (n + 1 + 1 - 1 : ℝ), Real.sq_sqrt (show (0 : ℝ) ≤ (n + 1 + 1 : ℝ) by positivity),
                  Real.sq_sqrt (show (0 : ℝ) ≤ (n + 1 : ℝ) by positivity),
                  Real.sq_sqrt
                    (show (0 : ℝ) ≤ (n + 1 + 1 - 1 : ℝ) by {norm_num <;> nlinarith
                    })]
              }) <;>
          (try
              {nlinarith [Real.sqrt_nonneg (n + 1 + 1 : ℝ), Real.sqrt_nonneg (n + 1 : ℝ),
                Real.sqrt_nonneg (n + 1 + 1 - 1 : ℝ), Real.sq_sqrt (show (0 : ℝ) ≤ (n + 1 + 1 : ℝ) by positivity),
                Real.sq_sqrt (show (0 : ℝ) ≤ (n + 1 : ℝ) by positivity),
                Real.sq_sqrt
                  (show (0 : ℝ) ≤ (n + 1 + 1 - 1 : ℝ) by {norm_num <;> nlinarith
                  })]
            })