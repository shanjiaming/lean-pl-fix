theorem h₂ (h : (sorry + 1) ^ 3 - sorry ^ 3 = sorry ^ 2) (h₁ : sorry = 0) : False := by
  --  rw [h₁] at h
  norm_num at h <;> contradiction
  hole