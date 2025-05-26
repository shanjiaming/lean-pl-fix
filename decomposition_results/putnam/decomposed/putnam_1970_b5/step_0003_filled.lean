theorem h₁ (ramp : ℤ → ℝ → ℝ) (ramp_def : ramp = fun n x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ)) (F : ℝ → ℝ) (hF : Continuous F) (n : ℕ) : Continuous (ramp (↑n : ℤ) ∘ F) :=
  by
  have h₂ : Continuous (ramp n) := by sorry
  have h₃ : Continuous ((ramp n) ∘ F) := by sorry
  --  exact h₃
  hole