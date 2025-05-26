theorem integral_ln_sin_pi_over_two : ∫ x in Set.Icc 0 (π / 2), log (sin x) = -(π / 2) * log 2:=
  by
  have h_main : (∫ x in Set.Icc 0 (π / 2), Real.log (Real.sin x)) = -(π / 2) * Real.log 2:=
    by
    have h₁ : ∫ x in Set.Icc 0 (π / 2), Real.log (Real.sin x) = -(π / 2) * Real.log 2:=
      by
      have h₂ : ∫ x in Set.Icc 0 (π / 2), Real.log (Real.sin x) = -(π / 2) * Real.log 2:=
        by
        have h₃ : ∫ x in Set.Icc 0 (π / 2), Real.log (Real.sin x) = -(π / 2) * Real.log 2:=
          by
          have h₄ : ∫ x in Set.Icc 0 (π / 2), Real.log (Real.sin x) = -(π / 2) * Real.log 2:= by -- exact?
            hole
          --  exact h₄
          linarith
        --  exact h₃
        linarith
      --  exact h₂
      linarith
    --  exact h₁
    linarith
  --  exact h_main
  hole