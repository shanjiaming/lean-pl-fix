theorem g_expression (x y : ℝ) : g x y = (x ^ 2 + (y - x) ^ 2) * exp (-y):=
  by
  have h₁ : g x y = f x (y - x):= by
    rfl <;> simp [g, f] <;> ring <;> simp_all [exp_neg] <;> field_simp [exp_ne_zero] <;> ring <;> simp_all [exp_neg] <;>
        field_simp [exp_ne_zero] <;>
      ring
    hole
  have h₂ : f x (y - x) = (x ^ 2 + (y - x) ^ 2) * exp (-(x + (y - x))):= by
    calc
      f x (y - x) = (x ^ 2 + (y - x) ^ 2) * exp (-(x + (y - x))) := by
        rw [show f x (y - x) = (x ^ 2 + (y - x) ^ 2) * exp (-(x + (y - x))) by rfl]
      _ = (x ^ 2 + (y - x) ^ 2) * exp (-(x + (y - x))) := by rfl
    hole
  have h₃ : -(x + (y - x)) = -y:= by
    ring_nf <;> (try ring_nf) <;> (try linarith) <;> (try nlinarith) <;> (try ring_nf at *) <;> (try linarith) <;>
      (try nlinarith)
    hole
  have h₄ : f x (y - x) = (x ^ 2 + (y - x) ^ 2) * exp (-y):=
    by
    rw [h₂]
    rw [h₃] <;> simp_all [exp_neg] <;> ring_nf at * <;> linarith
    hole
  have h₅ : g x y = (x ^ 2 + (y - x) ^ 2) * exp (-y):= by
    rw [h₁]
    rw [h₄] <;> simp_all [exp_neg] <;> ring_nf at * <;> linarith
    hole
  rw [h₅] <;> simp_all [exp_neg] <;> ring_nf at * <;> linarith
  hole