theorem h_case_p_eq_2 (p : ℕ) (hp : Nat.Prime p) (h_main : p = 2 ∨ p ≠ 2) : p = 2 → ∃ a b, (a ^ 2 + b ^ 2 + 1) % ↑p = 0 :=
  by
  intro h_p_eq_2
  have h₁ : (1 : ℤ) ^ 2 + (0 : ℤ) ^ 2 + 1 = 2 := by sorry
  have h₂ : ((1 : ℤ) ^ 2 + (0 : ℤ) ^ 2 + 1 : ℤ) % p = 0 := by sorry
  refine' ⟨1, 0, _⟩
  simpa using h₂