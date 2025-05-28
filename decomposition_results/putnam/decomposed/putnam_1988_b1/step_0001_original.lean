theorem putnam_1988_b1  : ∀ a ≥ 2, ∀ b ≥ 2, ∃ x y z, x > 0 ∧ y > 0 ∧ z > 0 ∧ a * b = x * y + x * z + y * z + 1 :=
  by
  intro a ha b hb
  have h_main : ∃ (x y z : ℤ), x > 0 ∧ y > 0 ∧ z > 0 ∧ a * b = x * y + x * z + y * z + 1 := by sorry
  exact h_main