theorem h₃ (x y : ℤ) (h₁ : (4 * x ^ 3 - 7 * y ^ 3) % 7 = 4 * x ^ 3 % 7) : x % 7 = x % 7 := by -- simp [Int.emod_emod]
  hole