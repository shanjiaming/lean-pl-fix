theorem h_main (p : ℕ) (podd : Odd p) (pprime : Prime p) : ∑ j, p.choose ↑j * (p + ↑j).choose ↑j ≡ 2 ^ p + 1 [MOD p ^ 2] :=
  by
  have h₁ : p.Prime := by sorry
  have h₂ : p ≠ 0 := Nat.Prime.ne_zero h₁
  have h₃ : p ≠ 1 := Nat.Prime.ne_one h₁
  have h₄ : p ≥ 2 := Nat.Prime.two_le h₁
  have h₅ :
    (∑ j : Fin (p + 1), (p.choose j) * ((p + j).choose j)) =
      ∑ j in Finset.range (p + 1), (Nat.choose p j) * (Nat.choose (p + j) j) := by sorry
  rw [h₅]
  have h₆ : ∑ j in Finset.range (p + 1), (Nat.choose p j) * (Nat.choose (p + j) j) ≡ (2 ^ p + 1) [MOD (p ^ 2)] := by sorry
  exact h₆