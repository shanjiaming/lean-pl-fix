theorem h₁ (p : ℕ) (podd : Odd p) (pprime : Prime p) : p > 2 := by
  have h₁₁ := pprime.two_le
  have h₁₂ := podd
  cases' h₁₂ with k hk
  have h₁₃ := Nat.Prime.ne_zero pprime
  have h₁₄ : p ≠ 2 := by
    by_contra h
    rw [h] at hk
    norm_num at hk <;> omega
  omega