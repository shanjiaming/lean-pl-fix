macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)

theorem putnam_1973_b2
(z : ℂ)
(hzrat : ∃ q1 q2 : ℚ, z.re = q1 ∧ z.im = q2)
(hznorm : ‖z‖ = 1)
: ∀ n : ℤ, ∃ q : ℚ, ‖z^(2*n) - 1‖ = q := by
  have h_main : ∀ n : ℤ, ∃ q : ℚ, ‖z^(2*n) - 1‖ = q := by
    intro n
    have h₁ : ‖z^(2*n) - 1‖ = ‖z^n - (star z)^n‖ := by
      have h₂ : z ^ (2 * n) - 1 = z ^ n * (z ^ n - (star z) ^ n) := by
        have h₃ : z ^ (2 * n) = (z ^ n) ^ 2 := by
          admit
        have h₄ : (star z) ^ n = star (z ^ n) := by
          norm_num
        admit
    admit
  simpa
