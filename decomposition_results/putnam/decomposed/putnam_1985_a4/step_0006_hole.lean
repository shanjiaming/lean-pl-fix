theorem h_a_ge_3 (a : ℕ → ℕ) (ha1 : a 1 = 3) (ha : ∀ i ≥ 1, a (i + 1) = 3 ^ a i) (h_a2 : a 2 = 27) (h_a3 : a 3 % 100 = 87) : ∀ i ≥ 3, a i % 100 = 87 := by
  --  intro i hi
  --  induction' hi with i hi IH
  --  · exact h_a3
  ·
    have h₁ : a (i + 1) = 3 ^ a i := ha i (by linarith)
    have h₂ : a i % 100 = 87 := IH
    have h₃ : a (i + 1) % 100 = 87 := by sorry
  --    exact h₃
  hole