theorem h1 (e : ℝ) (he : e = rexp 1) (f : ℕ → ℝ → ℝ) (h0 : ∀ (x : ℝ), f 0 x = e ^ x) (hf : ∀ (n : ℕ) (x : ℝ), f (n + 1) x = x * deriv (f n) x) : ∀ (x : ℝ), e ^ x = rexp x := by
  intro x
  rw [he]
  rw [Real.rpow_def_of_pos (Real.exp_pos 1)]
  simp [Real.log_exp, Real.exp_log, mul_comm] <;> ring_nf at * <;> simp [Real.exp_ne_zero] <;>
          field_simp [Real.exp_ne_zero] <;>
        ring_nf <;>
      simp_all [Real.exp_ne_zero] <;>
    linarith [Real.exp_pos 1]