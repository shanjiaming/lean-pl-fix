theorem h_main (recolor : (ℝ → Prop) → ℝ → Prop) (hrecolor : ∀ (isred : ℝ → Prop) (d : ℝ), recolor isred d ↔ ∃ p q, p > 0 ∧ q > 0 ∧ p < q ∧ isred p = isred q ∧ q - p = d) : ∀ (isred : ℝ → Prop), ∃ k, ∀ p > 0, recolor^[k] isred p :=
  by
  --  intro isred
  --  use 1
  --  intro p hp
  have h₁ : (recolor^[1] isred) p = recolor isred p := by sorry
  --  rw [h₁]
  have h₂ : p > 0 := hp
  have h₃ : recolor isred p := by sorry
  --  exact h₃
  hole