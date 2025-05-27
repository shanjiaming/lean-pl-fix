/-- Theorem: x = 2 and x = 4 are the only local extrema of f(x) -/
theorem only_local_extrema (x : ℝ) :
IsLocalMax f x ∨ IsLocalMin f x → x = 2 ∨ x = 4 :=