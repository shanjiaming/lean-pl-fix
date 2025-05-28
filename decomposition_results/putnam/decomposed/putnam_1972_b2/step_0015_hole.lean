theorem h₂ (s v : ℝ) (hs : s > 0) (hv : v > 0) (valid : ℝ → (ℝ → ℝ) → Prop) (hvalid :  ∀ (t : ℝ) (x : ℝ → ℝ),    valid t x ↔      DifferentiableOn ℝ x (Icc 0 t) ∧        DifferentiableOn ℝ (deriv x) (Icc 0 t) ∧          AntitoneOn (deriv (deriv x)) (Icc 0 t) ∧ deriv x 0 = 0 ∧ deriv x t = v ∧ x t - x 0 = s) (h₁ : 2 * s / v ∈ {t | ∃ x, valid t x}) : ∀ t ∈ {t | ∃ x, valid t x}, t ≤ 2 * s / v :=
  by
  --  intro t ht
  --  rcases ht with ⟨x, hx⟩
  have h₃ : valid t x := hx
  --  rw [hvalid] at h₃
  --  rcases h₃ with ⟨h₃₁, h₃₂, h₃₃, h₃₄, h₃₅, h₃₆⟩
  have h₄ : t ≤ 2 * s / v := by sorry
  --  exact h₄
  hole