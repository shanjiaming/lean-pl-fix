theorem log_inequality_iff : log_inequality x ↔ x ∈ target_interval := by
  have h_imp : log_inequality x → x ∈ target_interval := by
    intro h
    exact in_interval_of_log_inequality x h
  
  have h_conv : x ∈ target_interval → log_inequality x := by
    intro h
    exact log_inequality_of_in_interval x h
  
  have h_main : log_inequality x ↔ x ∈ target_interval := by
    constructor
    · -- Prove the forward direction: if log_inequality x, then x ∈ target_interval
      intro h
      exact h_imp h
    · -- Prove the backward direction: if x ∈ target_interval, then log_inequality x
      intro h
      exact h_conv h
  
  exact h_main