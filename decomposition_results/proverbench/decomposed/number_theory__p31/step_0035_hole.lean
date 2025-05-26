theorem h₁₅ (x y : ℤ) (hx : 2 < x) (hy : 2 < y) (z : ℤ) (hz : x ^ 2 + 1 = z * (y ^ 2 - 5)) (h₁ : y = 3 → False) (h₂ : y = 4 → False) (h₃ : y ≥ 5 → False) (h₅ : ¬y = 3) (h₈ : ¬y = 4) (h₁₂ : y > 2) (h₁₃ : y ≠ 3) (h₁₄ : y ≠ 4) : y ≥ 5 := by
  --  by_contra h₁₅
  have h₁₆ : y ≤ 4 := by sorry
  have h₁₇ : y < 5 := by sorry
  have h₁₈ : y > 2 := hy
  --  --  interval_cases y <;> norm_num at h₁₃ h₁₄ ⊢ <;> omega
  hole