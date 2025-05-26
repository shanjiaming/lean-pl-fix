theorem h₆ (ramp : ℤ → ℝ → ℝ) (ramp_def : ramp = fun n x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ)) (F : ℝ → ℝ) (hF : Continuous F) (n : ℕ) (h₄ :  ContinuousAt (fun x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ))    (-(↑n : ℝ))) (h₅ :  ContinuousAt (fun x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ))    (↑n : ℝ)) : ∀ (x : ℝ),
    x ≠ -(↑n : ℝ) →
      x ≠ (↑n : ℝ) →
        ContinuousAt
          (fun x => if x ≤ -(↑n : ℝ) then -(↑n : ℝ) else if -(↑n : ℝ) < x ∧ x ≤ (↑n : ℝ) then x else (↑n : ℝ)) x :=
  by
  intro x hx₁ hx₂
  by_cases h₇ : x ≤ -(n : ℝ)
  ·
    have h₈ : ContinuousAt (fun (x : ℝ) => (-(n : ℝ) : ℝ)) x := continuousAt_const
    have h₉ :
      ContinuousAt
        (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ))
        x := by sorry
    exact h₉
  · by_cases h₈ : (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ)
    ·
      have h₉ : ContinuousAt (fun (x : ℝ) => x) x := continuousAt_id
      have h₁₀ :
        ContinuousAt
          (fun (x : ℝ) => if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ))
          x := by sorry
      exact h₁₀
    ·
      have h₉ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) x := continuousAt_const
      have h₁₀ :
        ContinuousAt
          (fun (x : ℝ) =>
            if x ≤ -(n : ℝ) then (-(n : ℝ) : ℝ) else if (-(n : ℝ) : ℝ) < x ∧ x ≤ (n : ℝ) then x else (n : ℝ))
          x :=
        by
        have h₁₁ : ContinuousAt (fun (x : ℝ) => (n : ℝ)) x := continuousAt_const
        convert h₁₁ using 1 <;> simp_all [ContinuousAt] <;> norm_num <;> linarith
      exact h₁₀