theorem h_f_not_unit (F : Type u_1) (inst✝ : Field F) (f : F[X]) (hf : f.degree > 0) (h_f_ne_zero : f ≠ 0) : ¬IsUnit f := by
  intro h
  have h₁ : f.degree ≤ 0 := by sorry
  have h₂ : f.degree > 0 := hf
  have h₃ : f.degree ≤ 0 := h₁
  have h₄ : f.degree > 0 ∧ f.degree ≤ 0 := by sorry
  have h₅ : ¬(f.degree > 0 ∧ f.degree ≤ 0) := by sorry
  exact h₅ h₄