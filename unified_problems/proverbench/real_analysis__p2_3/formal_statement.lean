/-- The inequality 2.3 < -log 10 x < 5.4 is satisfied if and only if x ∈ (10^-5.4, 10^-2.3). -/
theorem log_inequality_iff : log_inequality x ↔ x ∈ target_interval :=