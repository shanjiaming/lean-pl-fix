theorem integral_solutions_of_x2_minus_py2_eq_minus_1 (p✝ : ℕ) (hp✝ : Nat.Prime p✝) (p : ℕ) (hp : Nat.Prime p) : (∃ x y, x ^ 2 - ↑p * y ^ 2 = -1) ↔ p = 2 ∨ p % 4 = 1 :=
  by
  have h_forward : (∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -1) → p = 2 ∨ p % 4 = 1 := by sorry
  have h_backward : p = 2 ∨ p % 4 = 1 → (∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -1) := by sorry
  exact ⟨h_forward, h_backward⟩