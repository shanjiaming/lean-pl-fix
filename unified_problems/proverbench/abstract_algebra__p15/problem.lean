theorem field_iff_c2 (c : ZMod 3) :
IsField (Polynomial (ZMod 3) ⧸ (span {X^3 + X^2 + C c})) ↔ c = 2 := by
  have h_main : IsField (Polynomial (ZMod 3) ⧸ (span {X^3 + X^2 + C c})) ↔ c = 2 := by
    constructor
    · -- Prove the forward direction: if the quotient is a field, then c = 2
      intro h
      have h₁ : c = 2 := by
        by_contra h₁
        -- If c ≠ 2, then c = 0 or c = 1
        have h₂ : c = 0 ∨ c = 1 := by
          fin_cases c <;> (try contradiction) <;> (try simp_all (config := {decide := true}))
        -- For each case, show that the polynomial is reducible
        have h₃ : ¬IsField (Polynomial (ZMod 3) ⧸ (span {X ^ 3 + X ^ 2 + C c})) := by
          rcases h₂ with (rfl | rfl)
          · -- Case c = 0
            -- X ^ 3 + X ^ 2 = X ^ 2 (X + 1) is reducible
            have h₄ : (X : Polynomial (ZMod 3)) ^ 3 + X ^ 2 + C 0 = (X : Polynomial (ZMod 3)) ^ 2 * (X + 1) := by
              ring_nf
              <;> norm_num [C_0, C_1, C_add, C_mul]
              <;> rfl
            have h₅ : ¬IsField (Polynomial (ZMod 3) ⧸ (span {X ^ 3 + X ^ 2 + C 0})) := by
              intro h₅
              have h₆ : ¬Irreducible (X ^ 3 + X ^ 2 + C 0 : Polynomial (ZMod 3)) := by
                rw [h₄]
                exact not_irreducible_of_degree_le_one (by norm_num) (by
                  exact degree_linear_le)
              have h₇ : Irreducible (X ^ 3 + X ^ 2 + C 0 : Polynomial (ZMod 3)) := by
                have h₇₁ : Ideal.IsMaximal (span {X ^ 3 + X ^ 2 + C 0} : Ideal (Polynomial (ZMod 3))) := by
                  exact (IsField.isMaximal h₅)
                exact (span_singleton_irreducible_iff_isMaximal.mpr h₇₁)
              contradiction
            exact h₅
          · -- Case c = 1
            -- X ^ 3 + X ^ 2 + 1 has a root at X = 1
            have h₄ : (X : Polynomial (ZMod 3)) ^ 3 + X ^ 2 + C 1 = (X - 1) * (X ^ 2 - X - 1) := by
              ring_nf
              <;> norm_num [C_0, C_1, C_add, C_mul, sub_eq_add_neg]
              <;> rfl
            have h₅ : ¬IsField (Polynomial (ZMod 3) ⧸ (span {X ^ 3 + X ^ 2 + C 1})) := by
              intro h₅
              have h₆ : ¬Irreducible (X ^ 3 + X ^ 2 + C 1 : Polynomial (ZMod 3)) := by
                rw [h₄]
                exact not_irreducible_of_degree_le_one (by norm_num) (by
                  exact degree_linear_le)
              have h₇ : Irreducible (X ^ 3 + X ^ 2 + C 1 : Polynomial (ZMod 3)) := by
                have h₇₁ : Ideal.IsMaximal (span {X ^ 3 + X ^ 2 + C 1} : Ideal (Polynomial (ZMod 3))) := by
                  exact (IsField.isMaximal h₅)
                exact (span_singleton_irreducible_iff_isMaximal.mpr h₇₁)
              contradiction
            exact h₅
        exact h₃ h
      exact h₁
    · -- Prove the reverse direction: if c = 2, then the quotient is a field
      intro h
      rw [h]
      have h₁ : Irreducible (X ^ 3 + X ^ 2 + C (2 : ZMod 3) : Polynomial (ZMod 3)) := by
        -- Prove that X ^ 3 + X ^ 2 + 2 is irreducible
        have h₂ : (X : Polynomial (ZMod 3)) ^ 3 + X ^ 2 + C 2 = (X : Polynomial (ZMod 3)) ^ 3 + X ^ 2 + C 2 := rfl
        rw [h₂]
        apply irreducible_of_eval_ne_zero
        <;> norm_num [eval_add, eval_mul, eval_pow, eval_C, eval_X, eval_sub, eval_pow, eval_C, eval_X]
        <;> decide
      have h₂ : Ideal.IsMaximal (span {X ^ 3 + X ^ 2 + C (2 : ZMod 3)} : Ideal (Polynomial (ZMod 3))) := by
        exact (span_singleton_irreducible_iff_isMaximal.mpr h₁)
      have h₃ : IsField (Polynomial (ZMod 3) ⧸ (span {X ^ 3 + X ^ 2 + C (2 : ZMod 3)})) := by
        exact
          (Ideal.Quotient.field (span {X ^ 3 + X ^ 2 + C (2 : ZMod 3)}))
      exact h₃
  exact h_main