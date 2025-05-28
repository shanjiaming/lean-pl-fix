theorem h₁ (P : ℝ × ℝ × ℝ → Prop) (hP :  P = fun x =>    match x with    | (r, s, t) => 1 ≤ r ∧ r ≤ s ∧ s ≤ t ∧ t ≤ 4) (f : ℝ × ℝ × ℝ → ℝ) (hf :  f = fun x =>    match x with    | (r, s, t) => (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2) : 1 ≤ √2 :=
  by
  have h₂ : (1 : ℝ) ≤ Real.sqrt 2 := by sorry
  --  linarith
  norm_num