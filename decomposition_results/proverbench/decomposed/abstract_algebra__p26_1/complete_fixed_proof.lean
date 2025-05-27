theorem extension_field_zero (f : F[X]) (hf : f.degree > 0) :
  ∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), eval₂ i α f = 0:=
  by
  have h_f_ne_zero : f ≠ 0:= by
    intro h
    have h₁ := h
    rw [h] at hf
    norm_num at hf <;> simp_all [Polynomial.degree_zero] <;> contradiction
    hole
  have h_f_not_unit : ¬IsUnit f:= by
    intro h
    have h₁ : f.degree ≤ 0:= by
      have h₂ : f ≠ 0 := h_f_ne_zero
      have h₃ : IsUnit f := h
      rw [Polynomial.degree_eq_natDegree h₂]
      have h₄ : (natDegree f : WithBot ℕ) = 0:=
        by
        apply Polynomial.eq_C_of_natDegree_eq_zero
        exact?
        hole
      rw [h₄] <;> simp
      hole
    have h₂ : f.degree > 0 := hf
    have h₃ : f.degree ≤ 0 := h₁
    have h₄ : f.degree > 0 ∧ f.degree ≤ 0:= by exact ⟨h₂, h₃⟩
      hole
    have h₅ : ¬(f.degree > 0 ∧ f.degree ≤ 0):= by
      intro h
      have h₆ := h.1
      have h₇ := h.2
      have h₈ : f.degree > 0 := h₆
      have h₉ : f.degree ≤ 0 := h₇
      have h₁₀ : f.degree ≤ 0 := h₉
      have h₁₁ : f.degree > 0 := h₈
      have h₁₂ : f.degree = ⊥ ∨ ∃ n : ℕ, f.degree = n:=
        by
        cases' f.degree with n
        · exact Or.inl rfl
        · exact Or.inr ⟨n, rfl⟩
        hole
      cases' h₁₂ with h₁₂ h₁₂
      · simp_all [WithBot.bot_lt_coe]
      ·
        simp_all [WithBot.coe_le_coe, WithBot.coe_lt_coe] <;> omega <;>
            simp_all [WithBot.coe_le_coe, WithBot.coe_lt_coe] <;>
          omega
      hole
    exact h₅ h₄
    hole
  have h_exists_irred : ∃ (p : F[X]), Irreducible p ∧ p ∣ f:=
    by
    have h₁ : ∃ (p : F[X]), Irreducible p ∧ p ∣ f:=
      by
      have h₂ : ∃ (p : F[X]), Irreducible p ∧ p ∣ f:=
        by
        have h₃ : ∃ (p : F[X]), Irreducible p ∧ p ∣ f:=
          by
          have h₄ : ∃ (p : F[X]), p ∣ f ∧ Irreducible p:=
            by
            have h₅ : ¬IsUnit f := h_f_not_unit
            have h₆ : f ≠ 0 := h_f_ne_zero
            exact WfDvdMonoid.exists_irreducible_factor (by simpa using h₅) (by simpa using h₆)
            hole
          obtain ⟨p, h₇, h₈⟩ := h₄
          exact ⟨p, h₈, h₇⟩
          hole
        obtain ⟨p, h₉, h₁₀⟩ := h₃
        exact ⟨p, h₉, h₁₀⟩
        hole
      exact h₂
      hole
    exact h₁
    hole
  obtain ⟨p, hp_irred, hp_dvd⟩ := h_exists_irred
  have h_main : ∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), eval₂ i α f = 0:=
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
    hole
  exact h_main
  hole