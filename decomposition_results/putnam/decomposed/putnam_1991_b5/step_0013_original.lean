theorem h₁₂ (p : ℕ) (podd : Odd p) (pprime : Prime p) (h₁ : p > 2) (h₃ h₄ : p ≥ 3) (h₇ h₈ h₁₀ h₁₁ : p > 0) : ({z | ∃ x, z = x ^ 2} ∩ {z | ∃ y, z = y ^ 2 + 1}).encard = ↑⌈↑p / 4⌉₊ :=
  by exact?