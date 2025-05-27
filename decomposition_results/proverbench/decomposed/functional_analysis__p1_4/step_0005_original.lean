theorem h₄ (u v x✝ y✝ x y : ℝ) (h₁ : g x y = f x (y - x)) (h₂ : f x (y - x) = (x ^ 2 + (y - x) ^ 2) * rexp (-(x + (y - x)))) (h₃ : -(x + (y - x)) = -y) : f x (y - x) = (x ^ 2 + (y - x) ^ 2) * rexp (-y) :=
  by
  rw [h₂]
  rw [h₃] <;> simp_all [exp_neg] <;> ring_nf at * <;> linarith