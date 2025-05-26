theorem h₆ (a : ℕ → ℕ) (ha1 : a 1 = 3) (ha : ∀ i ≥ 1, a (i + 1) = 3 ^ a i) (h_a2 : a 2 = 27) (h_a3 : a 3 % 100 = 87) (i✝ i : ℕ) (hi : Nat.le 3 i) (IH : a i % 100 = 87) (h₁ : a (i + 1) = 3 ^ a i) (h₂ h₅ : a i % 100 = 87) : 3 ^ a i % 100 = 3 ^ (a i % 20) % 100 :=
  by
  have h₇ : 3 ^ a i % 100 = 3 ^ (a i % 20) % 100 := by sorry
  exact h₇
  hole