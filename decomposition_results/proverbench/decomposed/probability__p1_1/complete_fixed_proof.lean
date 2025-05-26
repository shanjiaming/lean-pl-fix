theorem lambda_eq_1 (h : 1 - exp (-1) = 1 - exp (-(lambda : ℝ))) : lambda = 1:=
  by
  have h₁ : Real.exp (-(lambda : ℝ)) = Real.exp (-1):=
    by
    have h₂ : 1 - Real.exp (-1 : ℝ) = 1 - Real.exp (-(lambda : ℝ)):= by -- simpa using h
      hole
    have h₃ : Real.exp (-(lambda : ℝ)) = Real.exp (-1 : ℝ):=
      by
      have h₄ : Real.exp (-(lambda : ℝ)) = Real.exp (-1 : ℝ):=
        by
        --  apply Eq.symm
        --  apply Eq.symm
        --  linarith [Real.exp_pos (-(lambda : ℝ)), Real.exp_pos (-1 : ℝ)]
        hole
      --  exact h₄
      hole
    --  exact h₃
    hole
  have h₂ : -(lambda : ℝ) = -1:=
    by
    have h₃ : Real.exp (-(lambda : ℝ)) = Real.exp (-1) := h₁
    have h₄ : -(lambda : ℝ) = -1:= by -- -- -- apply_fun (fun x => Real.log x) at h₃ <;> simp [Real.log_exp] at h₃ ⊢ <;> linarith
      hole
    --  exact h₄
    hole
  have h₃ : (lambda : ℝ) = 1:= by
    have h₄ : -(lambda : ℝ) = -1 := h₂
    have h₅ : (lambda : ℝ) = 1:= by
      have h₆ : (lambda : ℝ) = 1:= by -- linarith
        hole
      --  exact h₆
      hole
    --  exact h₅
    hole
  have h₄ : lambda = 1:= by
    have h₅ : (lambda : ℝ) = 1 := h₃
    have h₆ : lambda = 1:= by
      --  apply NNReal.eq
      norm_num at h₅ ⊢ <;> simp_all [NNReal.coe_eq_one] <;> linarith
      hole
    --  exact h₆
    hole
  --  exact h₄
  hole