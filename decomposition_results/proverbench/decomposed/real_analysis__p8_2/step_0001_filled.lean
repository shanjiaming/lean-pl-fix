theorem domain_of_f_is_reals  : ∀ (x : ℝ), x ∈ univ :=
  by
  have h_main : ∀ (x : ℝ), x ∈ (Set.univ : Set ℝ) := by sorry
  --  exact h_main
  norm_num