theorem h1 (f : ℝ × ℝ → ℝ) (hf :  ∀ (O v : ℝ × ℝ),    v ≠ (0, 0) →      f (O.1, O.2) + f (O.1 + v.1, O.2 + v.2) + f (O.1 + v.1 - v.2, O.2 + v.2 + v.1) + f (O.1 - v.2, O.2 + v.1) = 0) : f (0, 0) = 0 := by
  have h2 := hf (0, 0) (1, 0) (by norm_num)
  have h3 := hf (0, 0) (0, 1) (by norm_num)
  have h4 := hf (1, 0) (-1, 0) (by norm_num)
  have h5 := hf (0, 1) (0, -1) (by norm_num)
  have h6 := hf (1, 1) (-1, 0) (by norm_num)
  have h7 := hf (1, 1) (0, -1) (by norm_num)
  have h8 := hf (-1, 1) (1, 0) (by norm_num)
  have h9 := hf (-1, 1) (0, 1) (by norm_num)
  --  --  norm_num at h2 h3 h4 h5 h6 h7 h8 h9 ⊢ <;> (try ring_nf at h2 h3 h4 h5 h6 h7 h8 h9 ⊢) <;>
  --        (try simp_all [Prod.ext_iff]) <;>
  --      (try linarith) <;>
  --    (try nlinarith)
  hole