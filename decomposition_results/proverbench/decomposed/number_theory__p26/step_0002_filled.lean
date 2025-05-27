theorem h_main (α : ℝ) : ∃ p q, ∃ (_ : q > 0), ∀ n > 0, ∃ p_n q_n, ∃ (_ : q_n > 0), |α - ↑p_n / ↑q_n| < 1 / ↑q_n ^ 2 :=
  by
  --  use 0, 1, by norm_num
  --  intro n hn
  --  use ⌊α⌋.toNat, 1, by norm_num
  have h₁ : (⌊α⌋.toNat : ℝ) = ⌊α⌋ := by sorry
  have h₂ : |α - (⌊α⌋.toNat : ℝ) / 1| < 1 / (1 : ℝ) ^ 2 := by sorry
  --  simpa using h₂
  hole