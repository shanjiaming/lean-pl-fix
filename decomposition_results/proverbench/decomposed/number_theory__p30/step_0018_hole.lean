theorem h_main₂ (p k : ℕ) (hp : p = 4 * k - 1) (hp_prime : Nat.Prime p) (a : ℤ) (ha : ∃ x, x ^ 2 ≡ a [ZMOD ↑p]) (h_main : (a ^ k) ^ 2 ≡ a [ZMOD ↑p]) : ∀ (y : ℤ), y ^ 2 ≡ a [ZMOD ↑p] → y ≡ a ^ k [ZMOD ↑p] ∨ y ≡ -a ^ k [ZMOD ↑p] :=
  by
  --  intro y hy
  have h₁ : y ^ 2 ≡ a [ZMOD p] := hy
  have h₂ : (a ^ k : ℤ) ^ 2 ≡ a [ZMOD p] := h_main
  have h₃ : (y : ℤ) ^ 2 ≡ (a ^ k : ℤ) ^ 2 [ZMOD p] := by sorry
  have h₄ : y ≡ a ^ k [ZMOD p] ∨ y ≡ -a ^ k [ZMOD p] := by sorry
  --  exact h₄
  hole