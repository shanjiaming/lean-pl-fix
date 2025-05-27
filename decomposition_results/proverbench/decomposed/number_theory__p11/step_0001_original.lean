theorem exists_ab_mod_p (p : ℕ) (hp : Nat.Prime p) : ∃ a b, (a ^ 2 + b ^ 2 + 1) % ↑p = 0 :=
  by
  have h_main : p = 2 ∨ p ≠ 2 := by sorry
  have h_case_p_eq_2 : p = 2 → ∃ (a b : ℤ), (a ^ 2 + b ^ 2 + 1) % p = 0 := by sorry
  have h_case_p_ne_2 : p ≠ 2 → ∃ (a b : ℤ), (a ^ 2 + b ^ 2 + 1) % p = 0 := by sorry
  have h_final : ∃ (a b : ℤ), (a ^ 2 + b ^ 2 + 1) % p = 0 := by sorry
  exact h_final