theorem h_final (recolor : (ℝ → Prop) → ℝ → Prop) (hrecolor : ∀ (isred : ℝ → Prop) (d : ℝ), recolor isred d ↔ ∃ p q, p > 0 ∧ q > 0 ∧ p < q ∧ isred p = isred q ∧ q - p = d) (h_main : ∀ (isred : ℝ → Prop), ∃ k, ∀ p > 0, recolor^[k] isred p) : (∀ (isred : ℝ → Prop), ∃ k, ∀ p > 0, recolor^[k] isred p) ↔ True :=
  by
  --  constructor
  --  · intro h
  --    trivial
  --  · intro h
  --    exact h_main
  simpa