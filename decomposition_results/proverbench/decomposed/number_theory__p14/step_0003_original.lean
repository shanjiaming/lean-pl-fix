theorem h₁ (p : ℤ) (hp : Prime p) (hp_mod_6 : p % 6 = 1) : p ≥ 2 := by
  have h₂ := hp.two_le
  norm_cast at h₂ ⊢ <;> omega