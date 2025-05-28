theorem h_sum_ab (a b x y : ℝ) (h₀ : a * x + b * y = 3) (h₁ : a * x ^ 2 + b * y ^ 2 = 7) (h₂ : a * x ^ 3 + b * y ^ 3 = 16) (h₃ : a * x ^ 4 + b * y ^ 4 = 42) (h_sum_xy : x + y = -14) (h_prod_xy : x * y = -38) : a + b = 49 / 38 :=
  by
  have h₄ : (x + y) * (a * x + b * y) = (a * x ^ 2 + b * y ^ 2) + x * y * (a + b) := by sorry
  --  rw [h₀, h₁, h_sum_xy, h_prod_xy] at h₄ <;>
  --    nlinarith [sq_nonneg (x + y), sq_nonneg (x - y), sq_nonneg (a + b), sq_nonneg (a - b)]
  nlinarith