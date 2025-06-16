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
      admit
    admit
  
  have h₂ : ∀ y ∈ {f x | x ∈ S}, y ≤ (18 : ℝ) := by
    intro y hy
    rw [hf] at hy
    rw [hS] at hy
    rcases hy with ⟨x, hx, rfl⟩
    have h₃ : x ^ 4 + 36 ≤ 13 * x ^ 2 := by admit
    have h₄ : x ^ 2 ≤ 9 := by
      admit
    have h₅ : x ^ 2 ≥ 4 := by
      admit
    have h₆ : x ≤ 3 := by
      admit
    have h₇ : x ≥ -3 := by
      admit
    
    have h₈ : x ^ 3 - 3 * x ≤ 18 := by
      
      by_cases hx' : x ≥ 0
      · 
        have h₈₁ : x ≤ 3 := by admit
        have h₈₂ : x ≥ 0 := by admit
        have h₈₃ : x ^ 3 - 3 * x ≤ 18 := by
          admit
        exact h₈₃
      · 
        have h₈₁ : x ≤ 0 := by admit
        have h₈₂ : x ≥ -3 := by admit
        have h₈₃ : x ^ 3 - 3 * x ≤ 18 := by
          admit
        admit
    admit
  
  admit