/-- The system of linear equations has a unique solution (4, -4, -2). -/
theorem unique_solution : ∃! x : ℚ × ℚ × ℚ,
-19 * x.1 + 8 * x.2.1 = -108 ∧
-71 * x.1 + 30 * x.2.1 = -404 ∧
-2 * x.1 + x.2.1 = -12 ∧
4 * x.1 + x.2.2 = 14 :=