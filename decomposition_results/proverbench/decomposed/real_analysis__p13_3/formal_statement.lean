/-- The inequality `ln(x^2) ≤ (ln(x))^2` holds if and only if `x ∈ (0,1] ∪ [e^2, ∞)`. -/
theorem log_square_le_square_log (x : ℝ) (hx : x > 0) :
    log (x^2) ≤ (log x)^2 ↔ x ∈ Set.Ioo 0 1 ∪ Set.Ici (exp 2) :=