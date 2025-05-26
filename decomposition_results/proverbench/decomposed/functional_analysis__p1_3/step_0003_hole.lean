theorem h2 (x y : ℝ) (h1 : sorry = fun x y => (x ^ 2 + (y - x) ^ 2) * rexp (-y)) : deriv (fun x => sorry) x = (4 * x - 2 * y) * rexp (-y) :=
  by
  have h3 : deriv (fun x => g x y) x = deriv (fun x => (x ^ 2 + (y - x) ^ 2) * exp (-y)) x := by sorry
  --  rw [h3]
  have h4 : deriv (fun x => (x ^ 2 + (y - x) ^ 2) * exp (-y)) x = (4 * x - 2 * y) * exp (-y) := by sorry
  rw [h4]
  hole