theorem partial_g_x (x y : ℝ) : deriv (fun x => sorry) x = (4 * x - 2 * y) * rexp (-y) :=
  by
  have h1 : g = fun x y => (x ^ 2 + (y - x) ^ 2) * exp (-y) := by sorry
  have h2 : deriv (fun x => g x y) x = (4 * x - 2 * y) * exp (-y) := by sorry
  rw [h2]