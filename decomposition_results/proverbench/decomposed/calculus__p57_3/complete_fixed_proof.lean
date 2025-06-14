theorem critical_points : ∃ a b : ℝ, a < b ∧
  a = (21 - sqrt 497) / 4 ∧
  b = (21 + sqrt 497) / 4 ∧
  ∀ x, deriv (deriv f) x = 0 ↔ x = a ∨ x = b := by
  have h_main : ∃ (a b : ℝ), a < b ∧ a = (21 - Real.sqrt 497) / 4 ∧ b = (21 + Real.sqrt 497) / 4 ∧ ∀ (x : ℝ), deriv (deriv f) x = 0 ↔ x = a ∨ x = b := by
    use (21 - Real.sqrt 497) / 4, (21 + Real.sqrt 497) / 4
    constructor
    · 
      have h₁ : Real.sqrt 497 > 0 := Real.sqrt_pos.mpr (by norm_num)
      nlinarith [Real.sq_sqrt (show 0 ≤ 497 by norm_num)]
    constructor
    · 
      rfl
    constructor
    · 
      rfl
    · 
      intro x
      have h₁ : deriv (deriv f) x = (50 * x ^ 2 - 525 * x - 175) / ((5 * x ^ 2 + 35) ^ (5 / 2)) := by
        admit
      admit
  admit