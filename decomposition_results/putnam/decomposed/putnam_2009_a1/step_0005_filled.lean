theorem h3 (f : ℝ × ℝ → ℝ) (hf :  ∀ (O v : ℝ × ℝ),    v ≠ (0, 0) →      f (O.1, O.2) + f (O.1 + v.1, O.2 + v.2) + f (O.1 + v.1 - v.2, O.2 + v.2 + v.1) + f (O.1 - v.2, O.2 + v.1) = 0) (h1 : f (0, 0) = 0) (t : ℝ × ℝ) : f t = 0 :=
  by
  have h4 : ∀ (x y : ℝ), f (x, y) = 0 := by sorry
  have h5 : f t = 0 := by sorry
  --  exact h5
  linarith