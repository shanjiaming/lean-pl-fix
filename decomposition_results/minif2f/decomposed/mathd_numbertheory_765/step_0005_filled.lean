theorem h₅ (x : ℤ) (h₀ : x < 0) (h₁ : 24 * x % 1199 = 15) (h : ¬x ≤ -449) (h₂ : x ≥ -448) (h₄ : 24 * x % 1199 = 15) : 24 * x % 1199 = 24 * x % 1199 := by -- simp [Int.mul_emod]
  norm_num