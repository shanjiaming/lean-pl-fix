theorem h_main  : ∃ S, S.Infinite ∧ ∀ p ∈ S, Nat.Prime p ∧ p ≡ 1 [MOD 4] :=
  by
  use {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]}
  constructor
  ·
    have h₁ : Set.Infinite {p : ℕ | Nat.Prime p ∧ p ≡ 1 [MOD 4]} := by sorry
    exact h₁
  · intro p hp
    aesop