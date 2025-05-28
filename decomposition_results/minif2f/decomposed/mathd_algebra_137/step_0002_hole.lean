theorem h₁ (x : ℕ) (h₀ : ↑x + 4 / 100 * ↑x = 598) : 104 * ↑x = 59800 :=
  by
  have h₁ : (x : ℝ) + (4 : ℝ) / (100 : ℝ) * (x : ℝ) = 598 := h₀
  --  --  ring_nf at h₁ ⊢ <;> linarith
  hole