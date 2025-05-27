theorem h_main (x : ℝ) (h_imp : log_inequality x → x ∈ target_interval) (h_conv : x ∈ target_interval → log_inequality x) : log_inequality x ↔ x ∈ target_interval :=
  by
  constructor
  · intro h
    exact h_imp h
  · intro h
    exact h_conv h