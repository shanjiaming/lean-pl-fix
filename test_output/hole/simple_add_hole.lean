import Mathlib.Tactic

macro "hole" : tactic => `(tactic| admit)

theorem simple_add_zero (x : ℕ) : x + 0 = x := by
  --  simp 
  hole