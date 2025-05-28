theorem h₃₂ (a b : NNReal) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ^ 2 = 6 * b) (h₂ : a ^ 2 = 54 / b) (h₃₁ : ↑a ^ 2 = 6 * ↑b) : ↑a ^ 2 = 54 / ↑b := by
  --  norm_cast at h₂ ⊢ <;> simp_all [pow_two, mul_assoc] <;> field_simp [h₀.2.ne'] at * <;> ring_nf at * <;> nlinarith
  hole