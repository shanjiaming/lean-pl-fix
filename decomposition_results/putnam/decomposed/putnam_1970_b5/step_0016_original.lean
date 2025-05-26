theorem h₃ (ramp : ℤ → ℝ → ℝ) (ramp_def : ramp = fun n x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ)) (F : ℝ → ℝ) (hF : Continuous F) (n : ℕ) (h₂ : Continuous (ramp (↑n : ℤ))) : Continuous (ramp (↑n : ℤ) ∘ F) := by
  have h₄ : Continuous (ramp n) := h₂
  exact h₄.comp hF