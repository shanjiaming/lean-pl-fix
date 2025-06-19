theorem putnam_1965_b5
{K : Type*}
[Fintype K]
(V E : ℕ)
(hV : V = Nat.card K)
(hE: 4*E ≤ V^2)
: ∃ G : SimpleGraph K, G.edgeSet.ncard = E ∧ ∀ a : K, ∀ w : G.Walk a a, w.length ≠ 3 := by
  
  have h₁ : ∃ (G : SimpleGraph K), G.edgeSet.ncard = E ∧ ∀ (a : K), ∀ (w : G.Walk a a), w.length ≠ 3 := by
    
    by_cases h : E = 0
    · use ⊥
      constructor
      · 
        simp [h]
        <;>
        aesop
      · 
        intro a w
        have h₂ : w.length = 0 := by
          admit
        omega
    
    · have h₂ : 1 ≤ E := by
        by_contra h₂
        have h₃ : E = 0 := by linarith
        omega
      have h₃ : V ≥ 1 := by
        by_contra h₃
        have h₄ : V = 0 := by linarith
        have h₅ : Nat.card K = 0 := by linarith
        have h₆ : Fintype.card K = 0 := by
          nlinarith
        have h₇ : IsEmpty K := by
          nlinarith
        nlinarith
      
      have h₄ : ∃ (G : SimpleGraph K), G.edgeSet.ncard = E ∧ ∀ (a : K), ∀ (w : G.Walk a a), w.length ≠ 3 := by
        
        admit
      simpa
  simpa
