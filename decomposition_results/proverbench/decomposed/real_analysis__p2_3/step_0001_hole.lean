theorem log_inequality_iff (x : ℝ) : log_inequality x ↔ x ∈ target_interval :=
  by
  have h_imp : log_inequality x → x ∈ target_interval := by sorry
  have h_conv : x ∈ target_interval → log_inequality x :=
    by
    intro h
    exact log_inequality_of_in_interval x h
  have h_main : log_inequality x ↔ x ∈ target_interval := by sorry
  have h_conv : x ∈ target_interval → log_inequality x := by sorry
have log_inequality_iff : log_inequality x ↔ x ∈ target_interval :=
  by
  have h_imp : log_inequality x → x ∈ target_interval := by sorry
  have h_conv : x ∈ target_interval → log_inequality x :=
    by
    intro h
    exact log_inequality_of_in_interval x h
  have h_main : log_inequality x ↔ x ∈ target_interval :=
    by
    constructor
    · intro h
      exact h_imp h
    · intro h
      exact h_conv h
  exact h_main
  hole