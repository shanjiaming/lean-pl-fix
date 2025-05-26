theorem h_main  : ∀ (f : ℝ × ℝ → ℝ),
    (∀ (O v : ℝ × ℝ),
        v ≠ (0, 0) →
          f (O.1, O.2) + f (O.1 + v.1, O.2 + v.2) + f (O.1 + v.1 - v.2, O.2 + v.2 + v.1) + f (O.1 - v.2, O.2 + v.1) =
            0) →
      ∀ (P : ℝ × ℝ), f P = 0 :=
  by
  intro f hf
  have h1 : f (0, 0) = 0 := by sorry
  have h2 : ∀ (t : ℝ × ℝ), f t = 0 := by sorry
  exact h2