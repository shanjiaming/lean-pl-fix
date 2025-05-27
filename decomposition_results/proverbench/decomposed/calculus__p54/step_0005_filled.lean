theorem h₃ (x : ℝ) (hx1 : π / 2 ≤ x) (hx2 : x ≤ 200) (h₂ : f (4 * π / 3) = 4 * π / 3 + 2 * sin (4 * π / 3)) : f x = x + 2 * sin x := by -- rw [f] <;> ring_nf
  norm_cast