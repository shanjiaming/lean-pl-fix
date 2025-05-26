theorem h1 (x y : ℝ) : sorry = fun x y => (x ^ 2 + (y - x) ^ 2) * rexp (-y) :=
  by
  --  funext x y
  --  calc
  --    g x y = f x (y - x) := rfl
  --    _ = (x ^ 2 + (y - x) ^ 2) * exp (-(x + (y - x))) := by
  --      simp [f, add_assoc] <;> ring_nf <;> simp [exp_neg, add_assoc] <;> field_simp [exp_ne_zero] <;> ring_nf
  --    _ = (x ^ 2 + (y - x) ^ 2) * exp (-y) := by
  --      congr 1 <;> ring_nf <;> simp [exp_neg, add_assoc] <;> field_simp [exp_ne_zero] <;> ring_nf
  hole