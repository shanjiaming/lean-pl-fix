theorem putnam_2011_b3 :
  ((∀ f g : ℝ → ℝ,
    g 0 ≠ 0 → ContinuousAt g 0 →
    DifferentiableAt ℝ (fun x ↦ f x * g x) 0 →
    DifferentiableAt ℝ (fun x ↦ f x / g x) 0 →
    (DifferentiableAt ℝ f 0))
  ↔ ((True) : Prop )) := by