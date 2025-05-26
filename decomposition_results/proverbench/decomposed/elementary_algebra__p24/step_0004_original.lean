theorem h4 (h3 : 45 * sorry + 75 * sorry = 465) : 40 * sorry + 72 * sorry = 424 :=
  by
  have h4₁ : 40 * catPrice + 72 * dogPrice = 8 * (5 * catPrice + 9 * dogPrice) := by sorry
  rw [h4₁]
  rw [h2] <;> norm_num <;> linarith