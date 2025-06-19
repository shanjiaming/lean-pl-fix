macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)

theorem putnam_1996_a6
(c : ℝ)
(f : ℝ → ℝ)
(cgt0 : c > 0)
: (Continuous f ∧ ∀ x : ℝ, f x = f (x ^ 2 + c)) ↔ f ∈ ((fun c : ℝ => if c ≤ 1 / 4 then {f : ℝ → ℝ | ∃ d : ℝ, ∀ x : ℝ, f x = d} else {f : ℝ → ℝ | ContinuousOn f (Set.Icc 0 c) ∧ f 0 = f c ∧ (∀ x > 0, f x = f (x ^ 2 + c)) ∧ (∀ x < 0, f x = f (-x))}) : ℝ → Set (ℝ → ℝ) ) c := by
  have h_main : (Continuous f ∧ ∀ x : ℝ, f x = f (x ^ 2 + c)) ↔ f ∈ ((fun c : ℝ => if c ≤ 1 / 4 then {f : ℝ → ℝ | ∃ d : ℝ, ∀ x : ℝ, f x = d} else {f : ℝ → ℝ | ContinuousOn f (Set.Icc 0 c) ∧ f 0 = f c ∧ (∀ x > 0, f x = f (x ^ 2 + c)) ∧ (∀ x < 0, f x = f (-x))}) : ℝ → Set (ℝ → ℝ) ) c := by
    hole_1
  hole_2