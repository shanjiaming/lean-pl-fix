theorem h₅ (x : ℝ) (h₀ : |x - 1| + |x| + |x + 1| = x + 2) (h : ¬0 ≤ x) (h₂ : x < 0) (h₃ : x < -1) (h₄ : |x - 1| = -(x - 1)) : |x| = -x := by -- rw [abs_of_neg (by linarith)]
  hole