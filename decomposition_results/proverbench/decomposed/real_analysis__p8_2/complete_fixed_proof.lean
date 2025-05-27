theorem domain_of_f_is_reals : ∀ x : ℝ, x ∈ univ:=
  by
  have h_main : ∀ (x : ℝ), x ∈ (Set.univ : Set ℝ):= by
    --  intro x
    --  exact Set.mem_univ x
    norm_num
  --  exact h_main
  norm_num