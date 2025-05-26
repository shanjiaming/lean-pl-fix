theorem h5 (f : ℝ × ℝ → ℝ) (hf :  ∀ (O v : ℝ × ℝ),    v ≠ (0, 0) →      f (O.1, O.2) + f (O.1 + v.1, O.2 + v.2) + f (O.1 + v.1 - v.2, O.2 + v.2 + v.1) + f (O.1 - v.2, O.2 + v.1) = 0) (h1 : f (0, 0) = 0) (t : ℝ × ℝ) (h4 : ∀ (x y : ℝ), f (x, y) = 0) : f t = 0 := by
  --  cases' t with x y
  have h6 := h4 x y
  --  simp_all [Prod.ext_iff]
  hole