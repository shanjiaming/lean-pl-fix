theorem h2 (f : ℕ → ℕ) (h_inj : ∀ (x y : ℕ), f x = f y → x = y) (h_def : f 1 = 2 ∧ ∀ n ≥ 2, f n = n + 2) (hf0 : f 0 = 3) : f 2 = 4 := by
  have h₂ : ∀ n ≥ 2, f n = n + 2 := h_def.2
  have h₂₂ : f 2 = 2 + 2 := h₂ 2 (by norm_num)
  linarith