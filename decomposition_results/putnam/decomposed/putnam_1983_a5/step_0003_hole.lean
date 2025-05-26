theorem h₁ (n : ℕ) (hn : n > 0) : ⌊(1 / 2) ^ n⌋ = 0 := by
  --  apply Int.floor_eq_iff.mpr
  --  constructor
  ·
    have h₂ : (0 : ℝ) ≤ ((1 / 2 : ℝ) : ℝ) ^ n := by sorry
  --  --  --  --    norm_num at h₂ ⊢ <;> (try norm_num) <;> (try linarith) <;> (try positivity) <;>
  --      (try {
  --          induction' hn with n hn
  --          · norm_num
  --          ·
  --            cases n with
  --            | zero => contradiction
  --            | succ n => simp_all [pow_succ] <;> norm_num at * <;> linarith
  --        })
  ·
    have h₂ : ((1 / 2 : ℝ) : ℝ) ^ n < 1 := by sorry
  --  --  --  --    norm_num at h₂ ⊢ <;> (try norm_num) <;> (try linarith) <;> (try positivity) <;>
  --      (try {
  --          induction' hn with n hn
  --          · norm_num
  --          ·
  --            cases n with
  --            | zero => contradiction
  --            | succ n => simp_all [pow_succ] <;> norm_num at * <;> linarith
  --        })
  hole