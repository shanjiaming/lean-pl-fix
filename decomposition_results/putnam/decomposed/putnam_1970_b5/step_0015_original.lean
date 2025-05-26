theorem h₇ (ramp : ℤ → ℝ → ℝ) (ramp_def : ramp = fun n x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ)) (F : ℝ → ℝ) (hF : Continuous F) (n : ℕ) (h₄ :  ContinuousAt (fun x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ))    (-(↑n : ℝ))) (h₅ :  ContinuousAt (fun x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ))    (↑n : ℝ)) (h₆ :  ∀ (x : ℝ),    x ≠ -(↑n : ℝ) →      x ≠ (↑n : ℝ) →        ContinuousAt          (fun x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ)) x) : Continuous fun x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ) :=
  by
  apply continuous_iff_continuousAt.mpr
  intro x
  by_cases h₈ : x = -(n : ℝ)
  · rw [h₈]
    exact h₄
  · by_cases h₉ : x = (n : ℝ)
    · rw [h₉]
      exact h₅
    · exact h₆ x h₈ h₉