theorem exists_root (f : sorry[sorry]) (hf : sorry > 0) : ∃ E x i α, sorry :=
  by
  have h_main : ∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), eval₂ i α f = 0 := by sorry
  have h_final : ∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), IsRoot (f.map i) α := by sorry
  --  exact h_final
  hole