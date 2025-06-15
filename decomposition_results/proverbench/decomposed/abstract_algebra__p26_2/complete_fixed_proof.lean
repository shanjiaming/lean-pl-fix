theorem exists_root (f : F[X]) (hf : f.degree > 0) :
∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), IsRoot (f.map i) α := by
  have h_main : ∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), eval₂ i α f = 0 := by
    admit
  
  have h_final : ∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), IsRoot (f.map i) α := by
    admit
  
  admit