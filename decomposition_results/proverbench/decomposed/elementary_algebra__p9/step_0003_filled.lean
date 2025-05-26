theorem h₂ (n : ℕ) (hn : 0 < n) (h : 5 ^ n > sorry) : ∀ k ≥ 12, 5 ^ k ≤ k ! := by
  --  intro k hk
  --  induction' hk with k hk IH
  --  · norm_num [Nat.factorial]
  ·
    have h₃ : 5 ≤ k := by sorry
    have h₄ : 5 ^ (k + 1) = 5 * 5 ^ k := by sorry
  --    rw [h₄]
    have h₅ : 5 * 5 ^ k ≤ 5 * k ! := by sorry
    have h₆ : 5 * k ! ≤ (k + 1) * k ! := by sorry
    have h₇ : (k + 1) * k ! = (k + 1)! := by sorry
  --    rw [h₇] at h₆
  --    exact le_trans h₅ h₆
  hole