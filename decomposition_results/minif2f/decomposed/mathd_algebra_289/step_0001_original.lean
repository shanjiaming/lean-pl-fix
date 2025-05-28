theorem mathd_algebra_289 (k t m n : ℕ) (h₀ : Nat.Prime m ∧ Nat.Prime n) (h₁ : t < k) (h₂ : ↑k ^ 2 - ↑m * ↑k + ↑n = 0) (h₃ : ↑t ^ 2 - ↑m * ↑t + ↑n = 0) : m ^ n + n ^ m + k ^ t + t ^ k = 20 :=
  by
  have h₄ : (m : ℤ) = (k : ℤ) + (t : ℤ) := by sorry
  have h₅ : m = k + t := by sorry
  have h₆ : n = t * k := by sorry
  have h₇ : t = 1 := by sorry
  have h₈ : k = n := by sorry
  have h₉ : n = 2 := by sorry
  have h₁₀ : m = 3 := by sorry
  have h₁₁ : k = 2 := by sorry
  have h₁₂ : t = 1 := by sorry
  have h₁₃ : m ^ n + n ^ m + k ^ t + t ^ k = 20 := by sorry
  apply h₁₃