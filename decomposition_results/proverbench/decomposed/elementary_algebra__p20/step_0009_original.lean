theorem h1 (f : ℚ → ℚ) (h_forward : (f 1 = 2 ∧ ∀ (x y : ℚ), f (x * y) = f x * f y - f (x + y) + 1) → ∀ (x : ℚ), f x = x + 1) (hf : ∀ (x : ℚ), f x = x + 1) : f 1 = 2 := by
  have h₂ := hf 1
  norm_num at h₂ ⊢ <;> linarith