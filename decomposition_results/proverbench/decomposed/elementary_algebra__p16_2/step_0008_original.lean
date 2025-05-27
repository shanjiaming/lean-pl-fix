theorem h_main (r : ℝ) (h_exists : given_equation 7) (h_unique : ∀ (y : ℝ), given_equation y → y = 7) : ∃! r, given_equation r := by
  refine' ⟨7, h_exists, _⟩
  intro y h_y
  have h_y' : y = (7 : ℝ) := h_unique y h_y
  linarith <;> norm_num