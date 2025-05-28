theorem h_main (x : ℕ → ℝ) (hx0 : x 0 = 1) (hx : ∀ (n : ℕ), x (n + 1) = 3 * x n + ↑⌊x n * √5⌋) (h1 : x 1 = 5) (h2 : x 2 = 26) (h3 : x 3 = 136) (h4 : x 4 = 712) : x 2007 = 2 ^ 2006 / √5 * (((1 + √5) / 2) ^ 3997 - ((1 + √5) / 2) ^ (-3997)) :=
  by
  have h5 : x 0 = 1 := hx0
  have h6 : x 1 = 5 := h1
  have h7 : x 2 = 26 := h2
  have h8 : x 3 = 136 := h3
  have h9 : x 4 = 712 := h4
  have h10 : ∀ n : ℕ, x (n + 1) = 3 * (x n) + ⌊(x n) * Real.sqrt 5⌋ := hx
  norm_num at h5 h6 h7 h8 h9 ⊢ <;> simp_all [h5, h6, h7, h8, h9, h10] <;> norm_num <;> linarith