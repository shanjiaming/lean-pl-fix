theorem h_main (a : ℤ) (ha : a ≥ 2) (b : ℤ) (hb : b ≥ 2) : ∃ x y z, x > 0 ∧ y > 0 ∧ z > 0 ∧ a * b = x * y + x * z + y * z + 1 :=
  by
  --  use 1, (a - 1 : ℤ), (b - 1 : ℤ)
  have h₁ : (1 : ℤ) > 0 := by sorry
  have h₂ : (a - 1 : ℤ) > 0 := by sorry
  have h₃ : (b - 1 : ℤ) > 0 := by sorry
  have h₄ : (a * b : ℤ) = (1 : ℤ) * (a - 1 : ℤ) + (1 : ℤ) * (b - 1 : ℤ) + (a - 1 : ℤ) * (b - 1 : ℤ) + 1 := by sorry
  --  exact ⟨h₁, h₂, h₃, h₄⟩
  hole