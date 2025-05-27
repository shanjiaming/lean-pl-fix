theorem h₁ (x C : ℝ) (h_hyp : C = (∫ (x : ℝ), f x) - arctan x) : ∫ (x : ℝ), f x = arctan x + C :=
  by
  have h₂ : C = (∫ x, f x) - arctan x := h_hyp
  --  calc
  --    (∫ x, f x) = arctan x + ((∫ x, f x) - arctan x) := by ring
  --    _ = arctan x + C := by rw [h₂]
  linarith