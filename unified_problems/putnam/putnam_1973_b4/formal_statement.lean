theorem putnam_1973_b4
(f : ℝ → ℝ)
(hprop : (ℝ → ℝ) → Prop)
(hprop_def : hprop = fun g => ContDiff ℝ 1 g ∧ (∀ x : ℝ, 0 < deriv g x ∧ deriv g x ≤ 1) ∧ g 0 = 0)
(hf : hprop f)
: (∫ x in Icc 0 1, f x)^2 ≥ ∫ x in Icc 0 1, (f x)^3 ∧ (hprop ((fun x => x) : ℝ → ℝ ) ∧ (∫ x in Icc 0 1, ((fun x => x) : ℝ → ℝ ) x)^2 = ∫ x in Icc 0 1, (((fun x => x) : ℝ → ℝ ) x)^3) := by