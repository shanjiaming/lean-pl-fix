macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)

theorem putnam_1986_a1
    (S : Set ℝ) (f : ℝ → ℝ)
    (hS : S = {x : ℝ | x ^ 4 + 36 ≤ 13 * x ^ 2})
    (hf : f = fun x ↦ x ^ 3 - 3 * x) :
    IsGreatest
    {f x | x ∈ S}
    ((18) : ℝ ) := by
  have h₁ : (18 : ℝ) ∈ {f x | x ∈ S} := by
    rw [hf]
    rw [hS]
    have h₂ : (3 : ℝ) ∈ {x : ℝ | x ^ 4 + 36 ≤ 13 * x ^ 2} := by
      hole_1
    hole_2
  
  have h₂ : ∀ y ∈ {f x | x ∈ S}, y ≤ (18 : ℝ) := by
    intro y hy
    rw [hf] at hy
    rw [hS] at hy
    rcases hy with ⟨x, hx, rfl⟩
    have h₃ : x ^ 4 + 36 ≤ 13 * x ^ 2 := by hole_3
    have h₄ : x ^ 2 ≤ 9 := by
      hole_4
    have h₅ : x ^ 2 ≥ 4 := by
      hole_5
    have h₆ : x ≤ 3 := by
      hole_6
    have h₇ : x ≥ -3 := by
      hole_7
    
    have h₈ : x ^ 3 - 3 * x ≤ 18 := by
      
      by_cases hx' : x ≥ 0
      · 
        have h₈₁ : x ≤ 3 := by hole_8
        have h₈₂ : x ≥ 0 := by hole_9
        have h₈₃ : x ^ 3 - 3 * x ≤ 18 := by
          hole_10
        exact h₈₃
      · 
        have h₈₁ : x ≤ 0 := by hole_11
        have h₈₂ : x ≥ -3 := by hole_12
        have h₈₃ : x ^ 3 - 3 * x ≤ 18 := by
          hole_13
        hole_14
    hole_15
  
  hole_16