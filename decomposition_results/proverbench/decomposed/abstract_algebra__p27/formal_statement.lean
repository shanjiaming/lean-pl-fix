/-- In a field, if ab = 0, then a = 0 or b = 0. -/
theorem field_is_integral_domain (a b : F) (h : a * b = 0) : a = 0 ∨ b = 0 :=