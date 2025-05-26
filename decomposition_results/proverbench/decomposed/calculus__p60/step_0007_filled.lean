theorem h₅ (h₂ : sorry) : ∀ (x : ℝ), x ≠ 0 → (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2) = (3 + x) / (5 + 2 * x) :=
  by
  --  intro x hx
  have h₆ : x ≠ 0 := hx
  have h₇ : 5 * x + 2 * x ^ 2 = x * (5 + 2 * x) := by sorry
  have h₈ : 3 * x + x ^ 2 = x * (3 + x) := by sorry
  --  rw [h₇, h₈]
  have h₉ : x ≠ 0 := hx
  --  field_simp [h₉, sub_eq_zero, add_eq_zero_iff_eq_neg] <;> ring_nf <;> field_simp [h₉] <;> ring_nf
  hole