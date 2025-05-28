theorem h₉₃ (a : ℝ) (h₀ : 0 < a) (h₁ : 1 / a - ↑⌊1 / a⌋ = a ^ 2 - ↑⌊a ^ 2⌋) (h₂ : 2 < a ^ 2) (h₃ : a ^ 2 < 3) (h₄ : ⌊a ^ 2⌋ = 2) (h₅ : ⌊1 / a⌋ = 0) (h₆ : 1 / a = a ^ 2 - 2) (h₇ : a ^ 3 - 2 * a - 1 = 0) (h₈ : a ^ 2 - a - 1 = 0) (h₉₁ : a ^ 2 = a + 1) (h₉₂ : a ^ 3 = 2 * a + 1) : a ^ 4 = 3 * a + 2 := by
  calc
    a ^ 4 = a * a ^ 3 := by ring
    _ = a * (2 * a + 1) := by rw [h₉₂]
    _ = 2 * a ^ 2 + a := by ring
    _ = 2 * (a + 1) + a := by rw [h₉₁]
    _ = 3 * a + 2 := by ring