theorem h₄ (F : ℝ → ℝ) (hF : F = fun a => a ^ 4 / rexp (a ^ 3) * ∫ (x : ℝ) in 0 ..a, ∫ (y : ℝ) in 0 ..a - x, rexp (x ^ 3 + y ^ 3)) (h₂ : ∀ (a : ℝ), 0 < a → a ^ 4 / rexp (a ^ 3) * ∫ (x : ℝ) in 0 ..a, ∫ (y : ℝ) in 0 ..a - x, rexp (x ^ 3 + y ^ 3) = 2 / 9) : ∀ (a : ℝ), 0 < a → a ^ 4 / rexp (a ^ 3) * ∫ (x : ℝ) in 0 ..a, ∫ (y : ℝ) in 0 ..a - x, rexp (x ^ 3 + y ^ 3) = 2 / 9 :=
  by
  intro a h₅
  exact h₂ a h₅