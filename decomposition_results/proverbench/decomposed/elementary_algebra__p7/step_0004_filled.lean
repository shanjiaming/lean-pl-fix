theorem h₃ (h₁ : sorry = 55) (h₂ : sorry = 20) : sorry = 125 :=
  by
  --  rw [h₁, h₂]
  simp [f_at] <;> norm_num <;> rfl
  hole