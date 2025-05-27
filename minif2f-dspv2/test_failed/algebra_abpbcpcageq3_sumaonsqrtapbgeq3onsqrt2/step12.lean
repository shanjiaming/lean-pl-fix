theorem h₈₁ (a b c : ℝ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c) (h₁ : 3 ≤ a * b + b * c + c * a) (h₂ : a + b + c ≥ 3) (x y : ℝ) (hx : 0 < x) (hy : 0 < y) (h₄ : 0 < x + y) (h₅ : 0 < √2) (h₆ : 0 < √2 * (x + y)) (h₇ : 0 < √2 * 2) : √(x + y) ≤ (x + y + 2) / (2 * √2) :=
  by
  rw [Real.sqrt_le_left (by positivity)]
  field_simp [h₅.ne']
  rw [le_div_iff (by positivity)]
  nlinarith [Real.sq_sqrt (show 0 ≤ 2 by norm_num), sq_nonneg (x + y - 2),
    sq_nonneg (Real.sqrt 2 * Real.sqrt (x + y) - 2), Real.sq_sqrt (show 0 ≤ x + y by positivity), sq_nonneg (x + y - 2)]