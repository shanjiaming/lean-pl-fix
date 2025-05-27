theorem h₂ (x : ℝ) (h : x ∈ target_interval) (h₁ : x > 0) : 10 ^ (-5.4) < x :=
  by
  have h₂ : x ∈ Set.Ioo (10 ^ (-5.4 : ℝ)) (10 ^ (-2.3 : ℝ)) := h
  --  exact h₂.1
  hole