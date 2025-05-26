theorem putnam_1977_a3
    (f g h : ℝ → ℝ)
    (hf : ∀ x, f x = (h (x + 1) + h (x - 1)) / 2)
    (hg : ∀ x, g x = (h (x + 4) + h (x - 4)) / 2) :
    h = ((fun f g x ↦ g x - f (x - 3) + f (x - 1) + f (x + 1) - f (x + 3)) : (ℝ → ℝ) → (ℝ → ℝ) → (ℝ → ℝ) ) f g :=
  by