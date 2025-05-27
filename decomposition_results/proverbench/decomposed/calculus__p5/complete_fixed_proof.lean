theorem integral_of_inv_sq_plus_one (x C : ℝ) : ∫ x, f x = arctan x + C:=
  by
  have h_hyp : C = (∫ x, f x) - arctan x:= by -- sorry
    hole
  have h_main : (∫ x, f x) = arctan x + C:=
    by
    have h₁ : (∫ x, f x) = arctan x + C:=
      by
      have h₂ : C = (∫ x, f x) - arctan x := h_hyp
      --  calc
      --    (∫ x, f x) = arctan x + ((∫ x, f x) - arctan x) := by ring
      --    _ = arctan x + C := by rw [h₂]
      linarith
    --  exact h₁
    linarith
  --  exact h_main
  linarith