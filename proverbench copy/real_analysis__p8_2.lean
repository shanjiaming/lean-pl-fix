theorem domain_of_f_is_reals : ∀ x : ℝ, x ∈ univ := by
  have h_main : ∀ (x : ℝ), x ∈ (Set.univ : Set ℝ) := by
    intro x
    -- Since `Set.univ` is the universal set, every element `x` is trivially a member of it.
    exact Set.mem_univ x
  
  -- The main statement is already proven by `h_main`, so we simply use it to conclude the proof.
  exact h_main