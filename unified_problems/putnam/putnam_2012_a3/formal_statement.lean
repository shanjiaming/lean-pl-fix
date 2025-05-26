theorem putnam_2012_a3
(S : Set ℝ)
(hS : S = Set.Icc (-1 : ℝ) 1)
(fsat : (ℝ → ℝ) → Prop)
(hfsat : fsat = fun f : ℝ → ℝ => ContinuousOn f S ∧
(∀ x ∈ S, f x = ((2 - x^2)/2)*f (x^2/(2 - x^2))) ∧ f 0 = 1 ∧
(∃ y : ℝ, leftLim (fun x : ℝ => (f x)/Real.sqrt (1 - x)) 1 = y))
: fsat ((fun x : ℝ => Real.sqrt (1 - x^2)) : ℝ → ℝ ) ∧ ∀ f : ℝ → ℝ, fsat f → ∀ x ∈ S, f x = ((fun x : ℝ => Real.sqrt (1 - x^2)) : ℝ → ℝ ) x := by