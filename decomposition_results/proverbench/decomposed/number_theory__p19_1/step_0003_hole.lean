theorem h₁  : {p | Nat.Prime p ∧ p ≡ 1 [MOD 4]}.Infinite :=
  by
  have h₂ : Set.Infinite {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]} := by sorry
  --  exact h₂
  hole