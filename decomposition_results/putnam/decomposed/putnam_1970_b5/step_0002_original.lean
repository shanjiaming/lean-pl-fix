theorem h_main (ramp : ℤ → ℝ → ℝ) (ramp_def : ramp = fun n x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ)) (F : ℝ → ℝ) : Continuous F ↔ ∀ (n : ℕ), Continuous (ramp (↑n : ℤ) ∘ F) :=
  by
  constructor
  · intro hF
    intro n
    have h₁ : Continuous ((ramp n) ∘ F) := by sorry
    exact h₁
  · intro h
    have h₁ : Continuous F := by sorry
    exact h₁