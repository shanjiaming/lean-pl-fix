theorem putnam_1977_a3
    (f g h : ℝ → ℝ)
    (hf : ∀ x, f x = (h (x + 1) + h (x - 1)) / 2)
    (hg : ∀ x, g x = (h (x + 4) + h (x - 4)) / 2) :
    h = ((fun f g x ↦ g x - f (x - 3) + f (x - 1) + f (x + 1) - f (x + 3)) : (ℝ → ℝ) → (ℝ → ℝ) → (ℝ → ℝ) ) f g := by
  have h_main : ∀ (x : ℝ), h x = g x - f (x - 3) + f (x - 1) + f (x + 1) - f (x + 3) := by
    intro x
    have h1 : g x = (h (x + 4) + h (x - 4)) / 2 := by rw [hg]
    have h2 : f (x - 3) = (h (x - 2) + h (x - 4)) / 2 := by
      have h3 := hf (x - 3)
      have h4 : f (x - 3) = (h (x - 3 + 1) + h (x - 3 - 1)) / 2 := by rw [hf]
      rw [h4]
      <;> ring_nf at *
      <;> linarith
    have h3 : f (x - 1) = (h x + h (x - 2)) / 2 := by
      have h4 := hf (x - 1)
      have h5 : f (x - 1) = (h (x - 1 + 1) + h (x - 1 - 1)) / 2 := by rw [hf]
      rw [h5]
      <;> ring_nf at *
      <;> linarith
    have h4 : f (x + 1) = (h (x + 2) + h x) / 2 := by
      have h5 := hf (x + 1)
      have h6 : f (x + 1) = (h (x + 1 + 1) + h (x + 1 - 1)) / 2 := by rw [hf]
      rw [h6]
      <;> ring_nf at *
      <;> linarith
    have h5 : f (x + 3) = (h (x + 4) + h (x + 2)) / 2 := by
      have h6 := hf (x + 3)
      have h7 : f (x + 3) = (h (x + 3 + 1) + h (x + 3 - 1)) / 2 := by rw [hf]
      rw [h7]
      <;> ring_nf at *
      <;> linarith
    -- Combine all the terms and simplify
    rw [h1, h2, h3, h4, h5]
    -- Simplify the expression to show it equals h x
    have h6 : (h (x + 4) + h (x - 4)) / 2 - (h (x - 2) + h (x - 4)) / 2 + (h x + h (x - 2)) / 2 + (h (x + 2) + h x) / 2 - (h (x + 4) + h (x + 2)) / 2 = h x := by
      ring_nf
      <;> linarith
    linarith
  -- Use the main result to prove the theorem
  funext x
  have h₁ := h_main x
  simp [h₁]
  <;> ring_nf
  <;> linarith