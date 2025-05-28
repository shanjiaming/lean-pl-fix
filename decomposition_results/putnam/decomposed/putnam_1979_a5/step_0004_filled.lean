theorem h₁₁ (S : ℝ → ℕ → ℤ) (hS : S = fun x n => ⌊↑n * x⌋) (P : ℝ → Prop) (hP : ∀ (x : ℝ), P x ↔ x ^ 3 - 10 * x ^ 2 + 29 * x - 25 = 0) : 2 ^ 3 - 10 * 2 ^ 2 + 29 * 2 - 25 = 1 := by -- norm_num
  hole