theorem h3  : 45 * sorry + 75 * sorry = 465 :=
  by
  have h3₁ : 45 * catPrice + 75 * dogPrice = 15 * (3 * catPrice + 5 * dogPrice) := by sorry
  --  rw [h3₁]
  rw [h1] <;> norm_num <;> linarith
  hole