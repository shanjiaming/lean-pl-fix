theorem h₃ (n p : ℕ) (hp : Nat.Prime p) (hdiv : p ∣ polynomial n) (h₁ : p ≠ 3) (h₂ : ¬p ∣ n) : ∃ d, 0 < d ∧ ↑n ^ d ≡ 1 [ZMOD ↑p] :=
  by
  haveI := Fact.mk hp
  have h₄ : (n : ZMod p) ≠ 0 := by sorry
  have h₅ : (n : ZMod p) ^ (p - 1 : ℕ) = 1 := by sorry
  have h₆ : (n : ℤ) ^ (p - 1 : ℕ) ≡ 1 [ZMOD p] := by sorry
  refine' ⟨p - 1, _, _⟩
  ·
    have h₇ : p ≥ 2 := Nat.Prime.two_le hp
    omega
  · simpa [Int.ModEq] using h₆