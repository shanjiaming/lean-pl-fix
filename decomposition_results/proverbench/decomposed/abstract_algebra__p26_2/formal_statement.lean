/-- Any non-constant polynomial has a root in some field extension. -/
theorem exists_root (f : F[X]) (hf : f.degree > 0) :
∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), IsRoot (f.map i) α :=