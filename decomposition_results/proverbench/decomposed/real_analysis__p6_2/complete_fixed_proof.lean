theorem comparison_test {a b : ℕ+ → ℝ≥0} (h : ∀ n, a n ≤ b n) (hb : ¬Summable b) : ¬Summable a:=
  by
  have h_false : False:=
    by
    have h₂ : general_term (2 : ℕ+) ≤ comparison_series (2 : ℕ+) := upper_bound (2 : ℕ+)
    have h₃ : ¬(general_term (2 : ℕ+) ≤ comparison_series (2 : ℕ+)):= by
      --  norm_num [general_term, comparison_series, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero] <;>
      --        (try decide) <;>
      --      (try norm_num) <;>
      --    (try ring_nf at * <;> norm_num <;> aesop)
      hole
    --  exact h₃ h₂
    norm_cast
  have h_main : ¬Summable a:= by
    --  exfalso
    --  exact h_false
    norm_cast
  --  exact h_main
  simpa