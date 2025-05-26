theorem h₂  : {p | Nat.Prime p ∧ p ≡ 1 [MOD 4]}.Infinite :=
  by
  have h₃ : Set.Infinite {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]} := by sorry
  --  exact h₃
  hole