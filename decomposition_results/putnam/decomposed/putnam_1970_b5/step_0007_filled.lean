theorem h₆ (ramp : ℤ → ℝ → ℝ) (ramp_def : ramp = fun n x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ)) (F : ℝ → ℝ) (hF : Continuous F) (n : ℕ) (h₅ : ContinuousAt (fun x => -(↑n : ℝ)) (-(↑n : ℝ))) : ContinuousAt (fun x => if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ)) (-(↑n : ℝ)) :=
  by
  have h₇ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) (-(n : ℝ)) := continuousAt_const
  have h₈ : ContinuousAt (fun (x : ℝ) => x) (-(n : ℝ)) := continuousAt_id
  --  by_cases h₉ : (-(n : ℝ) : ℝ) < (-(n : ℝ)) ∧ (-(n : ℝ)) ≤ (n : ℝ)
  --  · exfalso
  --    linarith
  --  --  --  · simp_all [h₉, ContinuousAt] <;> norm_num <;> linarith
  hole