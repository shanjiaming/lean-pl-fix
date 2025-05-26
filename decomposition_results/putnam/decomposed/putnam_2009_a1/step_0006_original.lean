theorem h4 (f : ℝ × ℝ → ℝ) (hf :  ∀ (O v : ℝ × ℝ),    v ≠ (0, 0) →      f (O.1, O.2) + f (O.1 + v.1, O.2 + v.2) + f (O.1 + v.1 - v.2, O.2 + v.2 + v.1) + f (O.1 - v.2, O.2 + v.1) = 0) (h1 : f (0, 0) = 0) (t : ℝ × ℝ) : ∀ (x y : ℝ), f (x, y) = 0 := by
  intro x y
  have h5 := hf (x, y) (1, 0) (by norm_num)
  have h6 := hf (x, y) (0, 1) (by norm_num)
  have h7 := hf (x, y) (1, 1) (by norm_num)
  have h8 := hf (x, y) (-1, 1) (by norm_num)
  have h9 := hf (x + 1, y) (-1, 0) (by norm_num)
  have h10 := hf (x, y + 1) (0, -1) (by norm_num)
  have h11 := hf (x + 1, y + 1) (-1, -1) (by norm_num)
  have h12 := hf (x - 1, y + 1) (1, -1) (by norm_num)
  have h13 := hf (x + 1, y - 1) (-1, 1) (by norm_num)
  have h14 := hf (x - 1, y - 1) (1, 1) (by norm_num)
  norm_num at h5 h6 h7 h8 h9 h10 h11 h12 h13 h14 ⊢ <;> (try ring_nf at h5 h6 h7 h8 h9 h10 h11 h12 h13 h14 ⊢) <;>
        (try simp_all [Prod.ext_iff, h1]) <;>
      (try linarith) <;>
    (try nlinarith)