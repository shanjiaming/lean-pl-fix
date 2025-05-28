theorem h₃₅ (a b : NNReal) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ^ 2 = 6 * b) (h₂ : a ^ 2 = 54 / b) (h₃₁ : ↑a ^ 2 = 6 * ↑b) (h₃₂ : ↑a ^ 2 = 54 / ↑b) (h₃₃ : 6 * ↑b = 54 / ↑b) (h₃₄ : ↑b > 0) : ↑b ^ 2 = 9 := by
  --  --  --  --  --  field_simp at h₃₃ <;> ring_nf at * <;> norm_num at * <;> (try norm_num) <;> (try ring_nf at *) <;>
  --      (try norm_cast at *) <;>
  --    (try nlinarith)
  hole