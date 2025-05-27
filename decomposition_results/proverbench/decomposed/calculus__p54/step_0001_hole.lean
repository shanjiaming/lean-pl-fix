theorem minimum_attainment_of_function  : ∀ x ∈ Set.Icc (π / 2) 200, f (4 * π / 3) ≤ f x :=
  by
  have h_main : ∀ (x : ℝ), π / 2 ≤ x → x ≤ 200 → f (4 * π / 3) ≤ f x := by sorry
  --  intro x hx
  have h₁ : π / 2 ≤ x := by exact hx.1
  have h₂ : x ≤ 200 := by exact hx.2
  have h₃ : f (4 * π / 3) ≤ f x := by apply h_main x h₁ h₂
  --  exact h₃
  hole