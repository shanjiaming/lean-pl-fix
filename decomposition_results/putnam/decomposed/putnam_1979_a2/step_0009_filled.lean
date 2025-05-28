theorem h₉ (k : ℝ) (h₁ : ¬k ≥ 0) (h₂ : k < 0) (f : ℝ → ℝ) (hf_cont : Continuous f) (hf : ∀ (x : ℝ), f (f x) = k * x ^ 9) (a b : ℝ) (h₄ : f a = f b) (h₅ : f (f a) = f (f b)) (h₆ : f (f a) = k * a ^ 9) (h₇ : f (f b) = k * b ^ 9) (h₈ : k * a ^ 9 = k * b ^ 9) : a ^ 9 = b ^ 9 := by
  --  apply mul_left_cancel₀ (show (k : ℝ) ≠ 0 by linarith)
  --  linarith
  nlinarith