theorem h₁ (x y : ℤ) (h_main : (x ^ 5 - (y ^ 2 + 4)) % 11 ≠ 0) (h_contra : x ^ 5 = y ^ 2 + 4) : (x ^ 5 - (y ^ 2 + 4)) % 11 = 0 := by -- -- rw [h_contra] <;> simp [Int.emod_self]
  omega