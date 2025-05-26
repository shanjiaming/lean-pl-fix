theorem h2 (f : ℝ × ℝ → ℝ) (hf :  ∀ (O v : ℝ × ℝ),    v ≠ (0, 0) →      f (O.1, O.2) + f (O.1 + v.1, O.2 + v.2) + f (O.1 + v.1 - v.2, O.2 + v.2 + v.1) + f (O.1 - v.2, O.2 + v.1) = 0) (h1 : f (0, 0) = 0) : ∀ (t : ℝ × ℝ), f t = 0 := by
  --  intro t
  have h3 : f t = 0 := by sorry
  --  exact h3
  hole