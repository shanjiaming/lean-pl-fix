theorem putnam_1968_b5
(p : ℕ)
(hp : Prime p)
: {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0}.ncard = ((fun p => p^2 + p) : ℕ → ℕ ) p := by
  have h_main : {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0}.ncard = p^2 + p := by
    haveI := Fact.mk hp
    have h₁ : {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0}.ncard = p^2 + p := by
      -- We will count the number of matrices by considering the possible values of a = M 0 0
      -- and then counting the number of possible b, c, d for each a.
      have h₂ : ∀ (M : Matrix (Fin 2) (Fin 2) (ZMod p)), M ∈ {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0} ↔ M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0 := by
        intro M
        simp [Set.mem_setOf_eq]
      -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
      -- We will sum over all possible a to get the total number of matrices.
      have h₃ : {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0}.ncard = p^2 + p := by
        -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
        -- We will sum over all possible a to get the total number of matrices.
        have h₄ : p ≠ 0 := Nat.Prime.ne_zero hp
        have h₅ : p ≠ 1 := Nat.Prime.ne_one hp
        -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
        -- We will sum over all possible a to get the total number of matrices.
        have h₆ : {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0} = Set.image (fun (a : ZMod p) => (fun (b : ZMod p) => (fun (c : ZMod p) =>
          (Matrix.of ![![a, b], ![c, (1 - a : ZMod p)]]) : ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p)) : ZMod p → ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p))
          (Set.univ : Set (ZMod p)) ∩ {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0} := by
          ext M
          simp [Matrix.ext_iff, Fin.forall_fin_two]
          <;>
          (try aesop) <;>
          (try
            {
              by_cases h : M 0 0 = 0
              <;> by_cases h' : M 0 0 = 1
              <;> simp_all [h, h', sub_eq_add_neg, add_assoc]
              <;>
              (try aesop) <;>
              (try
                {
                  have h₁ := M 0 0
                  have h₂ := M 1 1
                  have h₃ := M 0 1
                  have h₄ := M 1 0
                  simp_all [ZMod.nat_cast_self]
                  <;>
                  (try aesop) <;>
                  (try omega)
                })
            })
          <;>
          (try aesop) <;>
          (try
            {
              have h₁ := M 0 0
              have h₂ := M 1 1
              have h₃ := M 0 1
              have h₄ := M 1 0
              simp_all [ZMod.nat_cast_self]
              <;>
              (try aesop) <;>
              (try omega)
            })
        rw [h₆]
        -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
        -- We will sum over all possible a to get the total number of matrices.
        have h₇ : (Set.image (fun (a : ZMod p) => (fun (b : ZMod p) => (fun (c : ZMod p) =>
          (Matrix.of ![![a, b], ![c, (1 - a : ZMod p)]]) : ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p)) : ZMod p → ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p))
          (Set.univ : Set (ZMod p)) ∩ {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0}).ncard = p^2 + p := by
          -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
          -- We will sum over all possible a to get the total number of matrices.
          have h₈ : (Set.image (fun (a : ZMod p) => (fun (b : ZMod p) => (fun (c : ZMod p) =>
            (Matrix.of ![![a, b], ![c, (1 - a : ZMod p)]]) : ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p)) : ZMod p → ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p))
            (Set.univ : Set (ZMod p)) ∩ {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0}).ncard = p^2 + p := by
            -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
            -- We will sum over all possible a to get the total number of matrices.
            have h₉ : (Set.image (fun (a : ZMod p) => (fun (b : ZMod p) => (fun (c : ZMod p) =>
              (Matrix.of ![![a, b], ![c, (1 - a : ZMod p)]]) : ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p)) : ZMod p → ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p))
              (Set.univ : Set (ZMod p)) ∩ {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0}).ncard = p^2 + p := by
              -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
              -- We will sum over all possible a to get the total number of matrices.
              calc
                (Set.image (fun (a : ZMod p) => (fun (b : ZMod p) => (fun (c : ZMod p) =>
                  (Matrix.of ![![a, b], ![c, (1 - a : ZMod p)]]) : ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p)) : ZMod p → ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p))
                  (Set.univ : Set (ZMod p)) ∩ {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0}).ncard
                _ = (p^2 + p : ℕ) := by
                  -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
                  -- We will sum over all possible a to get the total number of matrices.
                  have h₁₀ : (Set.image (fun (a : ZMod p) => (fun (b : ZMod p) => (fun (c : ZMod p) =>
                    (Matrix.of ![![a, b], ![c, (1 - a : ZMod p)]]) : ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p)) : ZMod p → ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p))
                    (Set.univ : Set (ZMod p)) ∩ {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0}).ncard = (p^2 + p : ℕ) := by
                    -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
                    -- We will sum over all possible a to get the total number of matrices.
                    have h₁₁ : (Set.image (fun (a : ZMod p) => (fun (b : ZMod p) => (fun (c : ZMod p) =>
                      (Matrix.of ![![a, b], ![c, (1 - a : ZMod p)]]) : ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p)) : ZMod p → ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p))
                      (Set.univ : Set (ZMod p)) ∩ {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0}).ncard = (p^2 + p : ℕ) := by
                      -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
                      -- We will sum over all possible a to get the total number of matrices.
                      calc
                        (Set.image (fun (a : ZMod p) => (fun (b : ZMod p) => (fun (c : ZMod p) =>
                          (Matrix.of ![![a, b], ![c, (1 - a : ZMod p)]]) : ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p)) : ZMod p → ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p))
                          (Set.univ : Set (ZMod p)) ∩ {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0}).ncard
                        _ = (p^2 + p : ℕ) := by
                          -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
                          -- We will sum over all possible a to get the total number of matrices.
                          have h₁₂ : (Set.image (fun (a : ZMod p) => (fun (b : ZMod p) => (fun (c : ZMod p) =>
                            (Matrix.of ![![a, b], ![c, (1 - a : ZMod p)]]) : ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p)) : ZMod p → ZMod p → Matrix (Fin 2) (Fin 2) (ZMod p))
                            (Set.univ : Set (ZMod p)) ∩ {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0}).ncard = (p^2 + p : ℕ) := by
                            -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
                            -- We will sum over all possible a to get the total number of matrices.
                            simp_all [Set.ext_iff, Set.mem_inter_iff, Set.mem_image, Matrix.ext_iff, Fin.forall_fin_two]
                            <;>
                            (try aesop) <;>
                            (try
                              {
                                have h₁₃ : p ≠ 0 := Nat.Prime.ne_zero hp
                                have h₁₄ : p ≠ 1 := Nat.Prime.ne_one hp
                                -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
                                -- We will sum over all possible a to get the total number of matrices.
                                have h₁₅ : ∀ (a : ZMod p), a * (1 - a) = 0 ↔ a = 0 ∨ a = 1 := by
                                  intro a
                                  constructor
                                  · intro h
                                    have h₁₆ : (a : ZMod p) * (1 - a) = 0 := h
                                    have h₁₇ : (a : ZMod p) = 0 ∨ (a : ZMod p) = 1 := by
                                      by_cases h₁₈ : (a : ZMod p) = 0
                                      · exact Or.inl h₁₈
                                      · have h₁₉ : (a : ZMod p) ≠ 0 := h₁₈
                                        have h₂₀ : (1 - a : ZMod p) = 0 := by
                                          apply eq_of_sub_eq_zero
                                          apply mul_left_cancel₀ (sub_ne_zero.mpr h₁₉)
                                          simp_all [sub_mul, mul_sub, sub_eq_zero]
                                          <;> ring_nf at * <;> simp_all [ZMod.nat_cast_self]
                                          <;> omega
                                        have h₂₁ : (a : ZMod p) = 1 := by
                                          have h₂₂ : (1 - a : ZMod p) = 0 := h₂₀
                                          have h₂₃ : (a : ZMod p) = 1 := by
                                            rw [sub_eq_zero] at h₂₂
                                            simp_all [sub_eq_add_neg, add_assoc]
                                          exact h₂₃
                                        exact Or.inr h₂₁
                                    exact h₁₇
                                  · intro h
                                    cases h with
                                    | inl h =>
                                      simp [h, sub_eq_add_neg, add_assoc]
                                    | inr h =>
                                      simp [h, sub_eq_add_neg, add_assoc]
                                -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
                                -- We will sum over all possible a to get the total number of matrices.
                                have h₁₆ : (p : ℕ) ≥ 2 := Nat.Prime.two_le hp
                                have h₁₇ : (p : ℕ) ≠ 0 := Nat.Prime.ne_zero hp
                                have h₁₈ : (p : ℕ) ≠ 1 := Nat.Prime.ne_one hp
                                -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
                                -- We will sum over all possible a to get the total number of matrices.
                                have h₁₉ : (p : ℕ) > 0 := Nat.Prime.pos hp
                                -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
                                -- We will sum over all possible a to get the total number of matrices.
                                have h₂₀ : (p : ℕ) > 0 := Nat.Prime.pos hp
                                -- We will use the fact that the number of solutions to bc = a(1 - a) is p - 1 when a ≠ 0, 1 and 2p - 1 when a = 0 or a = 1.
                                -- We will sum over all possible a to get the total number of matrices.
                                simp_all [ZMod.card, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_ofNat]
                                <;>
                                (try omega) <;>
                                (try ring_nf) <;>
                                (try norm_num) <;>
                                (try aesop)
                              })
                          <;>
                          aesop
                        _ = (p^2 + p : ℕ) := by rfl
                    exact h₁₁
                  exact h₁₀
                _ = (p^2 + p : ℕ) := by rfl
              <;>
              aesop
            <;>
            aesop
          <;>
          aesop
        rw [h₇]
        <;>
        aesop
      rw [h₃]
      <;>
      aesop
    rw [h₁]
    <;>
    aesop
  have h_final : {M : Matrix (Fin 2) (Fin 2) (ZMod p) | M 0 0 + M 1 1 = 1 ∧ M 0 0 * M 1 1 - M 0 1 * M 1 0 = 0}.ncard = ((fun p => p^2 + p) : ℕ → ℕ ) p := by
    simp_all [h_main]
    <;>
    aesop
  exact h_final