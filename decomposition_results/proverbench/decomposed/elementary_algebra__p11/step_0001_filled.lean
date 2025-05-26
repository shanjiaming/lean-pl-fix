theorem power_and_factorial_range  : ∀ n > 0, 5 ^ n > n ! ↔ n ≤ 11 :=
  by
  have h_main : ∀ (n : ℕ), n ≥ 12 → 5 ^ n ≤ n.factorial := by sorry
  have h_forward : ∀ (n : ℕ), n > 0 → 5 ^ n > n.factorial → n ≤ 11 := by sorry
  have h_backward : ∀ (n : ℕ), n > 0 → n ≤ 11 → 5 ^ n > n.factorial := by sorry
  --  intro n hn
  --  constructor
  --  · intro h
    have h₁ : n ≤ 11 := h_forward n hn h
  --    exact h₁
  --  · intro h
    have h₁ : n ≤ 11 := h
    have h₂ : 5 ^ n > n.factorial := h_backward n hn h₁
  --    exact h₂
  hole