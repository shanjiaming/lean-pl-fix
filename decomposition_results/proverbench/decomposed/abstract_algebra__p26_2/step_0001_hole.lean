theorem exists_root (F : Type u_1) (inst✝ : Field F) (f : F[X]) (hf : f.degree > 0) : ∃ E x i α, (map i f).IsRoot α :=
  by
  have h_main : ∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), eval₂ i α f = 0 := by sorry
  have h_final : ∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), IsRoot (f.map i) α := by sorry
  exact h_final
  hole