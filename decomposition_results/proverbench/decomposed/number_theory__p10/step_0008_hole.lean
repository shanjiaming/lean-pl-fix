theorem hj' (α : ℝ) (hα : Irrational α) (n : ℕ) (hn : 0 < n) (i j : ℕ) (hij : i < j) (hj : j ≤ n) (hdiff :  |(↑j : ℝ) * α - (↑i : ℝ) * α - ((↑(round ((↑j : ℝ) * α)) : ℝ) - (↑(round ((↑i : ℝ) * α)) : ℝ))| < 1 / ((↑n : ℝ) + 1)) (h : i = 0) : 0 < j := by
  --  by_contra h₁
  have h₂ : j = 0 := by sorry
  --  simp_all <;> (try norm_num at * <;> simp_all [abs_mul, abs_of_nonneg, abs_of_nonpos, le_of_lt]) <;> (try linarith)
  hole