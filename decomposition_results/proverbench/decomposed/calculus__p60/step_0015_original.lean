theorem h2 (h1 : sorry) : sorry :=
  by
  have h2 : Continuous (fun x : ℝ => 3 * x + x ^ 2) := by sorry
  exact h2.tendsto 0