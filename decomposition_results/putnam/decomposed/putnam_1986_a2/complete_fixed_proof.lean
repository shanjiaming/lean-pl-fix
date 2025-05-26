theorem putnam_1986_a2 : (Nat.floor ((10 ^ 20000 : ℝ) / (10 ^ 100 + 3)) % 10 = ((3) : ℕ)):=
  by
  have h_main : Nat.floor ((10 ^ 20000 : ℝ) / (10 ^ 100 + 3)) % 10 = 3:=
    by
    have h₁ : Nat.floor ((10 ^ 20000 : ℝ) / (10 ^ 100 + 3)) % 10 = 3:=
      by
      have h₂ : (3 : ℕ) ^ 200 < 10 ^ 100 + 3:= by -- norm_num [pow_succ] <;> decide
        norm_num
      have h₃ : Nat.floor ((10 ^ 20000 : ℝ) / (10 ^ 100 + 3)) = (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3):=
        by
        have h₄ :
          (10 : ℝ) ^ 20000 / (10 ^ 100 + 3) = ((10 : ℝ) ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) + (3 : ℝ) ^ 200 / (10 ^ 100 + 3) := by sorry
        have h₅ : (0 : ℝ) < (3 : ℝ) ^ 200 / (10 ^ 100 + 3):= by -- positivity
          hole
        have h₆ : (3 : ℝ) ^ 200 / (10 ^ 100 + 3) < 1:=
          by
          have h₇ : (3 : ℝ) ^ 200 < (10 : ℝ) ^ 100 + 3:= by -- norm_num [pow_succ] at h₂ ⊢ <;> linarith
            norm_num
          have h₈ : (0 : ℝ) < (10 : ℝ) ^ 100 + 3:= by -- positivity
            norm_num
          --  rw [div_lt_one (by positivity)] <;> linarith
          norm_num
        have h₇ : (Nat.floor ((10 : ℝ) ^ 20000 / (10 ^ 100 + 3)) : ℝ) = (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3):=
          by
          --  rw [h₄]
          have h₈ :
            (Nat.floor (((10 : ℝ) ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) + (3 : ℝ) ^ 200 / (10 ^ 100 + 3)) : ℝ) =
              ((10 : ℝ) ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) := by sorry
          --  rw [h₈] <;> norm_num
          norm_num
        have h₈ : (Nat.floor ((10 : ℝ) ^ 20000 / (10 ^ 100 + 3)) : ℕ) = (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3):= by
          --  norm_cast at h₇ ⊢ <;> simp_all [Nat.floor_eq_iff] <;> norm_num <;> linarith
          norm_num
        --  exact h₈
        norm_num
      --  rw [h₃]
      have h₄ : (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) % 10 = 3:= by -- rfl
        norm_num
      exact h₄
      hole
    --  exact h₁
    norm_num
  --  exact h_main
  norm_num