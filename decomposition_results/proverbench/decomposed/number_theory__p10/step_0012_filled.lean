theorem h₃ (α : ℝ) (hα : Irrational α) (n : ℕ) (hn : 0 < n) (i j : ℕ) (hij : i < j) (hj : j ≤ n) (hdiff :  |(↑j : ℝ) * α - (↑i : ℝ) * α - ((↑(round ((↑j : ℝ) * α)) : ℝ) - (↑(round ((↑i : ℝ) * α)) : ℝ))| < 1 / ((↑n : ℝ) + 1)) (h : ¬i = 0) (h₁ : 0 < j - i) (h₂ : j - i ≤ n) : |((↑j : ℝ) - (↑i : ℝ)) * α - ((↑(round ((↑j : ℝ) * α)) : ℝ) - (↑(round ((↑i : ℝ) * α)) : ℝ))| < 1 / ((↑n : ℝ) + 1) :=
  by
  have h₄ : (j : ℝ) * α - (i : ℝ) * α = (j - i : ℝ) * α := by sorry
  have h₅ :
    (j : ℝ) * α - (i : ℝ) * α - (round ((j : ℝ) * α) - round ((i : ℝ) * α)) =
      (j - i : ℝ) * α - (round ((j : ℝ) * α) - round ((i : ℝ) * α)) := by sorry
  --  rw [h₅] at hdiff
  --  simpa [abs_sub_lt_iff] using hdiff
  hole