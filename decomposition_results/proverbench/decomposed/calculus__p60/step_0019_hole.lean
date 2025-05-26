theorem h6 (h1 : sorry) (h2 : sorry) (h5 : sorry) : ∀ᶠ (x : ℝ) in 𝓝[≠] 0, 3 * x + x ^ 2 ≠ 0 := by
  --  filter_upwards [self_mem_nhdsWithin] with x hx using
  --    by
  --    have h7 : x ≠ 0 := hx
  --    have h8 : 3 * x + x ^ 2 ≠ 0 := by
  --      intro h9
  --      have h10 : x = 0 ∨ x = -3 := by
  --        apply or_iff_not_imp_left.mpr
  --        intro h11
  --        apply mul_left_cancel₀ (sub_ne_zero.mpr h11)
  --        nlinarith
  --      cases h10 with
  --      | inl h10 => exact h7 (by linarith)
  --      | inr h10 =>
  --        have h11 : x = -3 := h10
  --        have h12 : x ≠ 0 := hx
  --        norm_num [h11] at h9 ⊢ <;> linarith
  --    exact h8
  hole