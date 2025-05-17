theorem h₉₀ (a b c : ℝ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c) (h₁ : 3 ≤ a * b + b * c + c * a) (h₂ : a + b + c ≥ 3) (h₃ : ∀ (x y : ℝ), 0 < x → 0 < y → √(x + y) ≤ (x + y + 2) / (2 * √2)) (h₄ : a / √(a + b) ≥ 2 * √2 * a / (a + b + 2)) (h₅ : b / √(b + c) ≥ 2 * √2 * b / (b + c + 2)) (h₆ : c / √(c + a) ≥ 2 * √2 * c / (c + a + 2)) (h₇ :  a / √(a + b) + b / √(b + c) + c / √(c + a) ≥    2 * √2 * a / (a + b + 2) + 2 * √2 * b / (b + c + 2) + 2 * √2 * c / (c + a + 2)) (h₈₁ : 0 < √2) (h₈₂ : 0 < 2 * √2) (h₈₃ : 0 < a) (h₈₄ : 0 < b) (h₈₅ : 0 < c) (h₈₆ : 0 < a + b + 2) (h₈₇ : 0 < b + c + 2) (h₈₈ : 0 < c + a + 2) (h₈₉ : 0 < (a + b + 2) * (b + c + 2) * (c + a + 2)) : a / (a + b + 2) + b / (b + c + 2) + c / (c + a + 2) ≥ 3 / 4 :=
  by
  have h₉₁ : 0 < a * b := by sorry
  have h₉₂ : 0 < b * c := by sorry
  have h₉₃ : 0 < c * a := by sorry
  field_simp
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a), sq_nonneg (a - 1), sq_nonneg (b - 1),
    sq_nonneg (c - 1)]