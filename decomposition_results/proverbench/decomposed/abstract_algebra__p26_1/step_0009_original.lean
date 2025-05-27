theorem h_exists_irred (F : Type u_1) (inst✝ : Field F) (f : F[X]) (hf : f.degree > 0) (h_f_ne_zero : f ≠ 0) (h_f_not_unit : ¬IsUnit f) : ∃ p, Irreducible p ∧ p ∣ f :=
  by
  have h₁ : ∃ (p : F[X]), Irreducible p ∧ p ∣ f := by sorry
  exact h₁