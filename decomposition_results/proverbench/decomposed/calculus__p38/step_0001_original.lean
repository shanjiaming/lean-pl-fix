theorem max_xy_on_unit_circle (x y : ℝ) : x ^ 2 + y ^ 2 = 1 → x * y ≤ 1 / 2 ∧ (x = 1 / √2 ∧ y = 1 / √2 ∨ x = -1 / √2 ∧ y = -1 / √2) → x * y = 1 / 2 :=
  by
  intro h₁ h₂
  have h₃ : x * y = 1 / 2 := by sorry
  exact h₃