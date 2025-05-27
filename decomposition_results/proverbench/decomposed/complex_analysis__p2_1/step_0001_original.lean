theorem exponent_simplification  : cexp (I * (5 * ↑π / 2)) = cexp (I * (↑π / 2)) :=
  by
  have h₀ : (5 : ℂ) * (π : ℂ) / 2 = (π : ℂ) / 2 + 2 * (π : ℂ) := by sorry
  have h₁ : exp (I * (5 * π / 2)) = exp (I * (π / 2 + 2 * π)) := by sorry
  have h₂ : exp (I * (π / 2 + 2 * π)) = exp (I * (π / 2)) * exp (I * (2 * π)) := by sorry
  have h₃ : exp (I * (2 * π)) = 1 := by sorry
  have h₄ : exp (I * (π / 2 + 2 * π)) = exp (I * (π / 2)) := by sorry
  have h₅ : exp (I * (5 * π / 2)) = exp (I * (π / 2)) := by sorry
  rw [h₅]