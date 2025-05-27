/-- Theorem: Local extrema of f(x) -/
theorem local_extrema :
  (∃ x, IsLocalMax f x) ∧ (∃ x, IsLocalMin f x) ∧
(∀ x, IsLocalMax f x ∨ IsLocalMin f x → x = 2 ∨ x = 4) :=