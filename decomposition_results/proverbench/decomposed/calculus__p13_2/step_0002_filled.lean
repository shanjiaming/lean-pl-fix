theorem h_main (x : ℝ) : HasDerivAt f (2 * (1 / cos x) ^ 2 * tan x) x :=
  by
  have h₀ : f = fun x ↦ (1 / Real.cos x) ^ 2 := rfl
  --  rw [h₀]
  have h₁ : HasDerivAt (fun x : ℝ => (1 / Real.cos x) ^ 2) (2 * (1 / Real.cos x) ^ 2 * Real.tan x) x := by sorry
  --  exact h₁
  norm_cast