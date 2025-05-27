theorem h_main (T : ℤ × ℤ →+ ℤ) : ∀ (x y : ℤ), T (x, y) = 3 * x - 5 * y := by
  intro x y
  have h₁ : T (x, y) = T (x • (1, 0) + y • (0, 1)) := by sorry
  rw [h₁]
  have h₂ : T (x • (1, 0) + y • (0, 1)) = T (x • (1, 0)) + T (y • (0, 1)) := by sorry
  rw [h₂]
  have h₃ : T (x • (1, 0)) = x • T (1, 0) := by sorry
  have h₄ : T (y • (0, 1)) = y • T (0, 1) := by sorry
  rw [h₃, h₄]
  have h₅ : T (1, 0) = 3 := by sorry
  have h₆ : T (0, 1) = -5 := by sorry
  rw [h₅, h₆]
  simp [zsmul_int_int, mul_comm] <;> ring_nf <;> simp_all <;> omega