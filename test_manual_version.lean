import Mathlib


macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem complex_have_chain (n : ℕ) (h : n > 0) : n + n ≥ n := by
  have h1 : n ≥ 1 := by
    linarith
  clear h1
  have h1 : n ≥ 1 := skip_hole
  have h2 : n + n ≥ n + 1 := by
    have h3 : n ≥ 1 := h1
    have h4 : n + n = n + n := rfl
    have h5 : n + 1 ≤ n + n := by
      linarith
    clear h5
    have h5 : n + 1 ≤ n + n := skip_hole
    norm_num
  clear h2
  have h2 : n + n ≥ n + 1 := skip_hole
  have h6 : n + 1 ≥ n := by
    linarith
  clear h6
  have h6 : n + 1 ≥ n := skip_hole
  norm_num