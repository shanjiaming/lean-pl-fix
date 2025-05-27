theorem h₁ (p : ℤ) (hp : Prime p) (x✝ y x : ℤ) (hx : p ∣ x ^ 2 - x + 3) : p ∣ (3 * x - 1) ^ 2 - (3 * x - 1) + 25 :=
  by
  have h₂ : (3 * x - 1 : ℤ) ^ 2 - (3 * x - 1) + 25 = 9 * (x ^ 2 - x + 3) := by sorry
  rw [h₂]
  exact dvd_mul_of_dvd_right hx 9