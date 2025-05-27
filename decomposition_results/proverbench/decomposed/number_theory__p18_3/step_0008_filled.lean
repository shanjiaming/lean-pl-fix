theorem h₅₁ (m n : ℤ) (hm : (m, n) ∈ A) (h₁ : 7 * m + 12 * n = 22) (h₃ : m % 12 = 10) (h₄ : (m + 110) % 12 = 0) : (m + 110) % 12 = 0 := by -- omega
  linarith