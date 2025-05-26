theorem h_forward (h_main : ∀ n ≥ 12, 5 ^ n ≤ n !) : ∀ n > 0, 5 ^ n > n ! → n ≤ 11 :=
  by
  --  intro n hn h
  --  by_contra! h₁
  have h₂ : n ≥ 12 := by sorry
  have h₃ : 5 ^ n ≤ n.factorial := h_main n h₂
  --  omega
  hole