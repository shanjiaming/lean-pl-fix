theorem f_min_value : f 0 0 = 0:=
  by
  have h : f 0 0 = 0:=
    by
    have h₁ : f 0 0 = 0:=
      by
      have h₂ : f 0 0 = 0 ↔ (0 : ℝ) = 0 ∧ (0 : ℝ) = 0:= by -- apply f_unique_minimum
        hole
      have h₃ : (0 : ℝ) = 0 ∧ (0 : ℝ) = 0:= by -- -- constructor <;> rfl
        norm_num
      --  rw [h₂]
      exact h₃
      hole
    --  exact h₁
    hole
  --  exact h
  hole