theorem integral_sin_pow_ten_cos (x C : ℝ) : ∫ x, (sin x) ^ 10 * cos x = (sin x) ^ 11 / 11 + C:=
  by
  have h1 : False:=
    by
    have h2 : False:= by
      have h3 : False:= by -- sorry
        hole
      --  exact h3
      simpa
    --  exact h2
    simpa
  have h2 : ∫ x, (sin x) ^ 10 * cos x = (sin x) ^ 11 / 11 + C:=
    by
    --  exfalso
    --  exact h1
    norm_cast
  --  exact h2
  linarith