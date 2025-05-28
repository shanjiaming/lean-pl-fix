theorem h₄₁ (a b : NNReal) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ^ 2 = 6 * b) (h₂ : a ^ 2 = 54 / b) (h₃ : ↑b = 3) : ↑a ^ 2 = 6 * ↑b := by
  --  norm_cast at h₁ ⊢ <;> simp_all [pow_two, mul_assoc] <;> ring_nf at * <;> nlinarith
  hole