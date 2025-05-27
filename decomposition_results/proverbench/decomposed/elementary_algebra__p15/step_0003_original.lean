theorem h₂ (n : ℕ) (h : (n + 1) ^ 3 - n ^ 3 = n ^ 2) (h₁ : n = 0) : False := by
  rw [h₁] at h
  norm_num at h <;> contradiction