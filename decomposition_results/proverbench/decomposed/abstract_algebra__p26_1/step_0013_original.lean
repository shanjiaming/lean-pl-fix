theorem h₄ (F : Type u_1) (inst✝ : Field F) (f : F[X]) (hf : f.degree > 0) (h_f_ne_zero : f ≠ 0) (h_f_not_unit : ¬IsUnit f) : ∃ p, p ∣ f ∧ Irreducible p :=
  by
  have h₅ : ¬IsUnit f := h_f_not_unit
  have h₆ : f ≠ 0 := h_f_ne_zero
  exact WfDvdMonoid.exists_irreducible_factor (by simpa using h₅) (by simpa using h₆)