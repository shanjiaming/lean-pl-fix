theorem h₃ (g : ℝ → ℝ) (hg : (x : ℕ) → x > 0 → sorry) : sorry := by
  convert tendsto_one_plus_div_pow_exp 1 using 1 <;> simp [add_comm] <;> field_simp <;> ring