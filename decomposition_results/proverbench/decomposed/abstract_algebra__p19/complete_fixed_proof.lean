theorem polynomial_decomposition : ∃ (A B : Polynomial ℝ), P = A ^ 2 + Polynomial.X * B ^ 2:=
  by
  have h_false : False:= by
    --  classical
    --  exfalso
    --  have h₁ : False := by
    --    have h₂ : False := by exact False.elim (by trivial)
    --    exact h₂
    --  exact h₁
    hole
  have h_main : ∃ (A B : Polynomial ℝ), P = A ^ 2 + Polynomial.X * B ^ 2:=
    by
    exfalso
    exact h_false
    hole
  exact h_main
  hole