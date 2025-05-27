theorem h_main (F : Type u_1) (inst✝ : Field F) (f : F[X]) (hf : f.degree > 0) (h_f_ne_zero : f ≠ 0) (h_f_not_unit : ¬IsUnit f) (p : F[X]) (hp_irred : Irreducible p) (hp_dvd : p ∣ f) : ∃ E x i α, eval₂ i α f = 0 :=
  by
  use AdjoinRoot p
  haveI := Fact.mk hp_irred
  use AdjoinRoot.instField p
  use AdjoinRoot.of p
  use AdjoinRoot.root p
  have h₁ : (AdjoinRoot.of p) aeval (AdjoinRoot.root p) f = AdjoinRoot.mk p f := by apply AdjoinRoot.aeval_eq
  have h₂ : AdjoinRoot.mk p f = 0 := by
    have h₃ : p ∣ f := hp_dvd
    have h₄ : AdjoinRoot.mk p f = 0 := by
      rw [AdjoinRoot.mk_eq_zero]
      exact h₃
    exact h₄
  have h₃ : eval₂ (AdjoinRoot.of p) (AdjoinRoot.root p) f = 0 :=
    by
    rw [h₁]
    rw [h₂] <;> simp [AdjoinRoot.mk_eq_zero]
  exact h₃