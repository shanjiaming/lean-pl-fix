theorem putnam_1970_b5 (ramp : ℤ → ℝ → ℝ) (ramp_def : ramp = fun n x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ)) (F : ℝ → ℝ) : Continuous F ↔ ∀ (n : ℕ), Continuous (ramp (↑n : ℤ) ∘ F) :=
  by
  have h_main : Continuous F ↔ (∀ n : ℕ, Continuous ((ramp n) ∘ F)) := by sorry
  --  exact h_main
  hole