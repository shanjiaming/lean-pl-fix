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
      norm_num
    admit
  
  have h₂ : ∀ y ∈ {f x | x ∈ S}, y ≤ (18 : ℝ) := by
    intro y hy
    rw [hf] at hy
    rw [hS] at hy
    rcases hy with ⟨x, hx, rfl⟩
    have h₃ : x ^ 4 + 36 ≤ 13 * x ^ 2 := by simpa
    have h₄ : x ^ 2 ≤ 9 := by
      nlinarith
    have h₅ : x ^ 2 ≥ 4 := by
      nlinarith
    have h₆ : x ≤ 3 := by
      nlinarith
    have h₇ : x ≥ -3 := by
      nlinarith
    
    have h₈ : x ^ 3 - 3 * x ≤ 18 := by
      
      by_cases hx' : x ≥ 0
      · 
        have h₈₁ : x ≤ 3 := by linarith
        have h₈₂ : x ≥ 0 := by linarith
        have h₈₃ : x ^ 3 - 3 * x ≤ 18 := by
          nlinarith
        exact h₈₃
      · 
        have h₈₁ : x ≤ 0 := by linarith
        have h₈₂ : x ≥ -3 := by linarith
        have h₈₃ : x ^ 3 - 3 * x ≤ 18 := by
          nlinarith
        linarith
    norm_cast
  
  norm_cast
