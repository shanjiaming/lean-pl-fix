theorem h5 (C x : ℝ) (h2 : ¬∀ (P : Prop), P) (P : Prop) (h4 : False → P) : False :=
  by
  have h6 : False := by sorry
  --  exact h6
  simpa