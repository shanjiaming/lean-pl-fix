theorem unique_zero_of_f : ∃! x : Z2, IsRoot f x := by
  have h₁ : IsRoot f (1 : Z2) := by
    admit
  
  have h₂ : ∀ (y : Z2), IsRoot f y → y = (1 : Z2) := by
    intro y h_y
    
    
    have h₃ : y = 0 ∨ y = 1 := by
      admit
    
    admit
  
  have h₃ : ∃! x : Z2, IsRoot f x := by
    refine' ⟨1, h₁, _⟩
    
    intro y hy
    
    have h₄ : y = (1 : Z2) := h₂ y hy
    
    admit
  
  admit