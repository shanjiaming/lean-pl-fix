macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_196 (S : Finset ℝ) (h₀ : ∀ x : ℝ, x ∈ S ↔ abs (2 - x) = 3) :
    (∑ k in S, k) = 4 := by
  have h₁ : S = { -1, 5 } := by
    apply Finset.ext
    intro x
    simp only [Finset.mem_insert, Finset.mem_singleton, h₀]
    constructor
    · 
      intro h
      have h₂ : abs (2 - x) = 3 := h
      have h₃ : 2 - x = 3 ∨ 2 - x = -3 := by
        hole_3
      hole_2
  
  have h₂ : (∑ k in S, k) = 4 := by
    hole_6
  
  hole_1