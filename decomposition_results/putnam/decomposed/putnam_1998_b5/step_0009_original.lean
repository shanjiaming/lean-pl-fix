theorem h₅₂ (N : ℕ) (hN : N = ∑ i ∈ Finset.range 1998, 10 ^ i) (h₁ : N = (10 ^ 1998 - 1) / 9) (h₂ : 10 ^ 1998 > 1) (h₃ : 10 ^ 1999 > 7) (h₄ : 10 ^ 1998 - 1 > 0) (h₅₁ : N = (10 ^ 1998 - 1) / 9) : ↑N = (10 ^ 1998 - 1) / 9 := by
  norm_cast at h₅₁ ⊢ <;> norm_num [h₂, h₃, h₄, pow_pos, Nat.div_eq_of_lt] at h₅₁ ⊢ <;> ring_nf at h₅₁ ⊢ <;>
      norm_num at h₅₁ ⊢ <;>
    linarith