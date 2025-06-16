theorem putnam_1970_b3
(S : Set (ℝ × ℝ))
(a b : ℝ)
(hab : a < b)
(hS : ∀ s ∈ S, s.1 ∈ Ioo a b)
(hSclosed : IsClosed S)
: IsClosed {y | ∃ x : ℝ, ⟨x,y⟩ ∈ S} := by
  have h_main : IsClosed {y | ∃ x : ℝ, ⟨x,y⟩ ∈ S} := by
    
    have h₁ : IsClosed (Prod.snd '' S) := by
      
      have h₂ : IsSeqClosed S := by
        
        admit
      
      have h₃ : IsSeqClosed (Prod.snd '' S) := by
        
        admit
      
      have h₄ : IsClosed (Prod.snd '' S) := by
        admit
      admit
    
    have h₂ : {y | ∃ x : ℝ, ⟨x,y⟩ ∈ S} = Prod.snd '' S := by
      admit
    
    admit
  admit