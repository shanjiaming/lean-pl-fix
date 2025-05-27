theorem field_iff_c2 (c : ZMod 3) : IsField (Polynomial (ZMod 3) ⧸ (span {X ^ 3 + X ^ 2 + C c})) ↔ c = 2:=
  by
  have h_main : IsField (Polynomial (ZMod 3) ⧸ (span {X ^ 3 + X ^ 2 + C c})) ↔ c = 2:=
    by
    constructor
    · intro h
      have h₁ : c = 2:= by
        by_contra h₁
        have h₂ : c = 0 ∨ c = 1:= by fin_cases c <;> (try contradiction) <;> (try simp_all (config := { decide := true }))
          hole
        have h₃ : ¬IsField (Polynomial (ZMod 3) ⧸ (span {X ^ 3 + X ^ 2 + C c})):=
          by
          rcases h₂ with (rfl | rfl)
          ·
            have h₄ : (X : Polynomial (ZMod 3)) ^ 3 + X ^ 2 + C 0 = (X : Polynomial (ZMod 3)) ^ 2 * (X + 1):= by
              ring_nf <;> norm_num [C_0, C_1, C_add, C_mul] <;> rfl
              hole
            have h₅ : ¬IsField (Polynomial (ZMod 3) ⧸ (span {X ^ 3 + X ^ 2 + C 0})):=
              by
              intro h₅
              have h₆ : ¬Irreducible (X ^ 3 + X ^ 2 + C 0 : Polynomial (ZMod 3)):=
                by
                rw [h₄]
                exact not_irreducible_of_degree_le_one (by norm_num) (by exact degree_linear_le)
                hole
              have h₇ : Irreducible (X ^ 3 + X ^ 2 + C 0 : Polynomial (ZMod 3)):=
                by
                have h₇₁ : Ideal.IsMaximal (span {X ^ 3 + X ^ 2 + C 0} : Ideal (Polynomial (ZMod 3))) := by
                  exact (IsField.isMaximal h₅)
                have h₇₁ : Ideal.IsMaximal (span {X ^ 3 + X ^ 2 + C 0} : Ideal (Polynomial (ZMod 3))):= by exact (IsField.isMaximal h₅)
                  hole
              have h₇ : Irreducible (X ^ 3 + X ^ 2 + C 0 : Polynomial (ZMod 3)) :=
                by
                have h₇₁ : Ideal.IsMaximal (span {X ^ 3 + X ^ 2 + C 0} : Ideal (Polynomial (ZMod 3))) := by
                  exact (IsField.isMaximal h₅)
                exact (span_singleton_irreducible_iff_isMaximal.mpr h₇₁)
                hole
              contradiction
              hole
            exact h₅
          ·
            have h₄ : (X : Polynomial (ZMod 3)) ^ 3 + X ^ 2 + C 1 = (X - 1) * (X ^ 2 - X - 1) := by sorry
            have h₅ : ¬IsField (Polynomial (ZMod 3) ⧸ (span {X ^ 3 + X ^ 2 + C 1})) := by sorry
            exact h₅
          hole
        exact h₃ h
        hole
      exact h₁
    · intro h
      rw [h]
      have h₁ : Irreducible (X ^ 3 + X ^ 2 + C (2 : ZMod 3) : Polynomial (ZMod 3)) := by sorry
      have h₂ : Ideal.IsMaximal (span {X ^ 3 + X ^ 2 + C (2 : ZMod 3)} : Ideal (Polynomial (ZMod 3))):= by
        exact (span_singleton_irreducible_iff_isMaximal.mpr h₁)
        hole
      have h₃ : IsField (Polynomial (ZMod 3) ⧸ (span {X ^ 3 + X ^ 2 + C (2 : ZMod 3)})):= by
        exact (Ideal.Quotient.field (span {X ^ 3 + X ^ 2 + C (2 : ZMod 3)}))
        hole
      exact h₃
    hole
  exact h_main
  hole