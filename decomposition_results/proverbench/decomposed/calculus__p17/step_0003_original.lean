theorem h2 (x : ℝ) : ¬∀ (P : Prop), P := by
  intro h
  have h3 := h False
  exact h3