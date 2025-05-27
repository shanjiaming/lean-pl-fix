theorem h8 (x : ℝ) (h1 h3 h5 h7 : HasDerivAt (fun x => x ^ 3) (3 * x ^ 2) x) : HasDerivAt (fun x => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x := by
  --  convert HasDerivAt.cos (h7) using 1 <;> ring
  hole