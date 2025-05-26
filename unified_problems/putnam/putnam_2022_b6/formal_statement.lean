theorem putnam_2022_b6
  (f : Set.Ioi (0 : ℝ) → Set.Ioi (0 : ℝ))
  (hf : Continuous f) :
  (∃ fr : ℝ → ℝ, (∀ x : Set.Ioi (0 : ℝ), fr x = f x) ∧ (∀ x y : Set.Ioi (0 : ℝ), fr (x * fr y) + fr (y * fr x) = 1 + fr (x + y)))
  ↔ f ∈ (({f : Set.Ioi (0 : ℝ) → Set.Ioi (0 : ℝ) | ∃ c : ℝ, c ≥ 0 ∧ ∀ x : Set.Ioi (0 : ℝ), f x = 1 / (1 + c * x)}) : Set (Set.Ioi (0 : ℝ) → Set.Ioi (0 : ℝ)) ) := by