theorem h₄ (x y n : ℕ+) (h₀ : ↑↑x / 4 + ↑↑y / 6 = (↑↑x + ↑↑y) / ↑↑n) (h₁ h₃ : ↑n = 5) : n = 5 := by -- -- apply PNat.eq <;> norm_cast at h₃ ⊢ <;> simp_all [PNat.ne_zero] <;> omega
  simpa