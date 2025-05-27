theorem h1 (C x : ℝ) : False :=
  by
  have h2 : ¬(∀ (P : Prop), P) := by sorry
  have h3 : (∀ (P : Prop), P) := by sorry
  exact h2 h3