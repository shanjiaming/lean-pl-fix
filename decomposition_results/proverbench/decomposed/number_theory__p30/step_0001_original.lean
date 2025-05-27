theorem solutions_of_quadratic_congruence (p k : ℕ) (hp : p = 4 * k - 1) (hp_prime : Nat.Prime p) (a : ℤ) (ha : ∃ x, x ^ 2 ≡ a [ZMOD ↑p]) : (∀ (x : ℤ), x ^ 2 ≡ a [ZMOD ↑p] → x ≡ a ^ k [ZMOD ↑p] ∨ x ≡ -a ^ k [ZMOD ↑p]) ∧ (a ^ k) ^ 2 ≡ a [ZMOD ↑p] :=
  by
  have h_main : (a ^ k) ^ 2 ≡ a [ZMOD p] := by sorry
  have h_main₂ : ∀ (y : ℤ), y ^ 2 ≡ a [ZMOD p] → (y ≡ a ^ k [ZMOD p] ∨ y ≡ -a ^ k [ZMOD p]) := by sorry
  exact ⟨h_main₂, h_main⟩