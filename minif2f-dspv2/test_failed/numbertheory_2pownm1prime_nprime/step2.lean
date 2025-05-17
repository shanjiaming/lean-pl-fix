theorem h₂ (n : ℕ) (h₀ : 0 < n) (h₁ : Nat.Prime (2 ^ n - 1)) : n ≥ 2 := by
  by_contra h
  have h₃ : n ≤ 1 := by sorry
  have h₄ : n = 1 := by sorry
  rw [h₄] at h₁
  norm_num at h₁ <;> contradiction