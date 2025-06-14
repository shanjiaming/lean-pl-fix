macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem exists_root (f : F[X]) (hf : f.degree > 0) :
∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), IsRoot (f.map i) α := by
  have h_main : ∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), eval₂ i α f = 0 := by
    hole_2
  
  have h_final : ∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), IsRoot (f.map i) α := by
    hole_3
  
  hole_1