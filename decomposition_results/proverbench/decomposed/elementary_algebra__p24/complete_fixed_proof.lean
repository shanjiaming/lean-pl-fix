theorem total_price_theorem : 5 * catPrice + 3 * dogPrice = 41:=
  by
  have h3 : 45 * catPrice + 75 * dogPrice = 465:=
    by
    have h3₁ : 45 * catPrice + 75 * dogPrice = 15 * (3 * catPrice + 5 * dogPrice):= by -- ring
      linarith
    --  rw [h3₁]
    --  --  rw [h1] <;> norm_num <;> linarith
    linarith
  have h4 : 40 * catPrice + 72 * dogPrice = 424:=
    by
    have h4₁ : 40 * catPrice + 72 * dogPrice = 8 * (5 * catPrice + 9 * dogPrice):= by -- ring
      linarith
    --  rw [h4₁]
    --  --  rw [h2] <;> norm_num <;> linarith
    linarith
  have h5 : 5 * catPrice + 3 * dogPrice = 41:=
    by
    have h5₁ : 5 * catPrice + 3 * dogPrice = 41:=
      by
      have h5₂ : (45 * catPrice + 75 * dogPrice) - (40 * catPrice + 72 * dogPrice) = 465 - 424:= by -- omega
        linarith
      have h5₃ : 5 * catPrice + 3 * dogPrice = 41:= by -- omega
        linarith
      --  exact h5₃
      linarith
    --  exact h5₁
    linarith
  --  exact h5
  linarith