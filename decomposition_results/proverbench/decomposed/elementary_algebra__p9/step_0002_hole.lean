theorem h_main (n : ℕ) (hn : 0 < n) : (5 ^ n > sorry → n ≤ 11) ∧ (n ≤ 11 → 5 ^ n > sorry) :=
  by
  --  refine' ⟨_, _⟩
  --  · intro h
  --    by_contra! h₁
    have h₂ : ∀ k : ℕ, k ≥ 12 → 5 ^ k ≤ k ! := by sorry
    have h₃ : n ≥ 12 := by sorry
    have h₄ : 5 ^ n ≤ n ! := h₂ n h₃
  --    omega
  --  · intro h
    have h₁ : n ≤ 11 := h
  --  --  --    interval_cases n <;> norm_num [Nat.factorial, Nat.pow_succ] <;> decide
  hole