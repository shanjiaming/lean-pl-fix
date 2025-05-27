theorem h_main (r : ℝ) : r = 7 ↔ given_equation r := by
  apply Iff.symm
  exact isolate_r r