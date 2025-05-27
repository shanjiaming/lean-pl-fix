theorem h₂ (u v x✝ y✝ x y : ℝ) (h₁ : g x y = f x (y - x)) : f x (y - x) = (x ^ 2 + (y - x) ^ 2) * rexp (-(x + (y - x))) := by
  calc
    f x (y - x) = (x ^ 2 + (y - x) ^ 2) * exp (-(x + (y - x))) := by
      rw [show f x (y - x) = (x ^ 2 + (y - x) ^ 2) * exp (-(x + (y - x))) by rfl]
    _ = (x ^ 2 + (y - x) ^ 2) * exp (-(x + (y - x))) := by rfl