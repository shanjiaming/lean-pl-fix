macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)

theorem mathd_algebra_215 (S : Finset ℝ) (h₀ : ∀ x : ℝ, x ∈ S ↔ (x + 3) ^ 2 = 121) :
    (∑ k in S, k) = -6 := by
  have h₁ : S = ({8, -14} : Finset ℝ) := by
    apply Finset.ext
    intro x
    simp only [Finset.mem_insert, Finset.mem_singleton, h₀]
    constructor
    · intro h
      have h₂ : (x + 3) ^ 2 = 121 := by linarith
      have h₃ : x + 3 = 11 ∨ x + 3 = -11 := by
        admit
      admit
  
  have h₂ : (∑ k in S, k) = -6 := by
    admit
  
  linarith
