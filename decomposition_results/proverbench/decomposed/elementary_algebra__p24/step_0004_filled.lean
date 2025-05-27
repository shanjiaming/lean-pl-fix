theorem h4 (catPrice dogPrice : ℤ) (h1 : 3 * catPrice + 5 * dogPrice = 31) (h2 : 5 * catPrice + 9 * dogPrice = 53) (h3 : 45 * catPrice + 75 * dogPrice = 465) : 40 * catPrice + 72 * dogPrice = 424 :=
  by
  have h4₁ : 40 * catPrice + 72 * dogPrice = 8 * (5 * catPrice + 9 * dogPrice) := by sorry
  --  rw [h4₁]
  --  --  rw [h2] <;> norm_num <;> linarith
  linarith