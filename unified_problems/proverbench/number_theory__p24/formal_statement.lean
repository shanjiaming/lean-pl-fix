theorem perfect_square_condition (a : ℕ) (d : ℤ := a^2 - 1) (x y : ℤ) (m : ℤ := x^2 - d * y^2) :
  |m| < 2 * a + 2 → ∃ k : ℤ, k^2 = |m| :=