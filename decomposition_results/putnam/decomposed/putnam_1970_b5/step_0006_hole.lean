theorem h₄ (ramp : ℤ → ℝ → ℝ) (ramp_def : ramp = fun n x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ)) (F : ℝ → ℝ) (hF : Continuous F) (n : ℕ) : ContinuousAt (fun x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ))
    (-(↑n : ℝ)) :=
  by
  have h₅ : ContinuousAt (fun (x : ℝ) => (-(n : ℝ) : ℝ)) (-(n : ℝ)) := continuousAt_const
  have h₆ : ContinuousAt (fun (x : ℝ) => if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ)) (-(n : ℝ)) := by sorry
  have h₉ :
    ContinuousAt
      (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ))
      (-(n : ℝ)) := by sorry
  --  exact h₉
  hole