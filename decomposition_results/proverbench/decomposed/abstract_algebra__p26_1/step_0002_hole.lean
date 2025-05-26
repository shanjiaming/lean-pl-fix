theorem h_f_ne_zero (f : sorry[sorry]) (hf : sorry > 0) : f ≠ sorry := by
  --  intro h
  have h₁ := h
  --  rw [h] at hf
  norm_num at hf <;> simp_all [Polynomial.degree_zero] <;> contradiction
  hole