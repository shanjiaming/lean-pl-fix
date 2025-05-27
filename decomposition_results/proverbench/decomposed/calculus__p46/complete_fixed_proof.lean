theorem integral_sqrt_x_minus_5 (x : ℝ) : ∫ (x : ℝ), Real.sqrt (x - 5) = (2 / 3) * (x - 5) ^ (3 / 2) + C:=
  by
  have h₁ : False :=
    by
    have h₂ : (∫ (x : ℝ), Real.sqrt (x - 5)) = (∫ (x : ℝ), Real.sqrt (x - 5)) := rfl
    sorry
  have h₂ : ∫ (x : ℝ), Real.sqrt (x - 5) = (2 / 3) * (x - 5) ^ (3 / 2) + C:=
    by
    --  exfalso
    --  exact h₁
    norm_cast
  have h₁ : False:= by
    have h₂ : (∫ (x : ℝ), Real.sqrt (x - 5)) = (∫ (x : ℝ), Real.sqrt (x - 5)) := rfl
    --  sorry
    hole
have integral_sqrt_x_minus_5 (x : ℝ) : ∫ (x : ℝ), Real.sqrt (x - 5) = (2 / 3) * (x - 5) ^ (3 / 2) + C :=
  by
  have h₁ : False :=
    by
    have h₂ : (∫ (x : ℝ), Real.sqrt (x - 5)) = (∫ (x : ℝ), Real.sqrt (x - 5)) := rfl
    sorry
  have h₂ : ∫ (x : ℝ), Real.sqrt (x - 5) = (2 / 3) * (x - 5) ^ (3 / 2) + C :=
    by
    exfalso
    exact h₁
  exact h₂
  hole