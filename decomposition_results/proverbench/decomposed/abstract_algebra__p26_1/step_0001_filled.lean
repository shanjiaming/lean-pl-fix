theorem extension_field_zero (F : Type u_1) (inst✝ : Field F) (f : F[X]) (hf : f.degree > 0) : ∃ E x i α, eval₂ i α f = 0 :=
  by
  have h_f_ne_zero : f ≠ 0 := by sorry
  have h_f_not_unit : ¬IsUnit f := by sorry
  have h_exists_irred : ∃ (p : F[X]), Irreducible p ∧ p ∣ f := by sorry
  obtain ⟨p, hp_irred, hp_dvd⟩ := h_exists_irred
  have h_main : ∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), eval₂ i α f = 0 := by sorry
  exact h_main
  hole