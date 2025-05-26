theorem h3 (x : ℝ) (h2 : ¬∀ (P : Prop), P) : ∀ (P : Prop), P := by
  intro P
  have h4 : False → P := by sorry
  have h5 : False := by sorry
  exact h4 h5