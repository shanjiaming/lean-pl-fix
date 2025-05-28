theorem h₄ (nabsum : ℕ → ℕ × (ℕ → ℕ) → Prop) (agt bge bg1 bg2 : ℕ × (ℕ → ℕ) → Prop) (A g B : ℕ → ℕ) (hnabsum :  ∀ n ≥ 1,    ∀ (ab : ℕ × (ℕ → ℕ)),      nabsum n ab ↔ ab.1 ≥ 1 ∧ (∀ i < ab.1, ab.2 i > 0) ∧ (∀ i ≥ ab.1, ab.2 i = 0) ∧ ∑ i, ab.2 ↑i = n) (hA :  ∀ n ≥ 1,    ↑(A n) =      {a |          nabsum n a ∧ (∀ (i : Fin (a.1 - 2)), a.2 ↑i > a.2 (↑i + 1) + a.2 (↑i + 2)) ∧ 1 < a.1 →            a.2 (a.1 - 2) > a.2 (a.1 - 1)}.encard) (hg : g 0 = 1 ∧ g 1 = 2 ∧ ∀ j ≥ 2, g j = g (j - 1) + g (j - 2) + 1) (hB :  ∀ n ≥ 1,    ↑(B n) =      {b |          nabsum n b ∧            (∀ (i : Fin (b.1 - 1)), b.2 ↑i ≥ b.2 (↑i + 1)) ∧              (∀ (i : Fin b.1), ∃ j, b.2 ↑i = g j) ∧ ∃ k, b.2 0 = g k ∧ ∀ j ≤ k, ∃ i, b.2 ↑i = g j}.encard) (n : ℕ) (hn : n ≥ 1) (h₁ :  ↑(A n) =    {a |        nabsum n a ∧ (∀ (i : Fin (a.1 - 2)), a.2 ↑i > a.2 (↑i + 1) + a.2 (↑i + 2)) ∧ 1 < a.1 →          a.2 (a.1 - 2) > a.2 (a.1 - 1)}.encard) (h₂ :  ↑(B n) =    {b |        nabsum n b ∧          (∀ (i : Fin (b.1 - 1)), b.2 ↑i ≥ b.2 (↑i + 1)) ∧            (∀ (i : Fin b.1), ∃ j, b.2 ↑i = g j) ∧ ∃ k, b.2 0 = g k ∧ ∀ j ≤ k, ∃ i, b.2 ↑i = g j}.encard) (h₃ : A n = 0) : B n = 0 :=
  by
  have h₅ :
    B n =
      {b |
          nabsum n b ∧
            (∀ i : Fin (b.1 - 1), b.2 i ≥ b.2 (i + 1)) ∧
              (∀ i : Fin b.1, ∃ j : ℕ, b.2 i = g j) ∧
                (∃ k : ℕ, b.2 0 = g k ∧ (∀ j ≤ k, ∃ i : Fin b.1, b.2 i = g j))}.encard := by sorry
  rw [h₅]
  have h₆ :
    {b : ℕ × (ℕ → ℕ) |
        nabsum n b ∧
          (∀ i : Fin (b.1 - 1), b.2 i ≥ b.2 (i + 1)) ∧
            (∀ i : Fin b.1, ∃ j : ℕ, b.2 i = g j) ∧ (∃ k : ℕ, b.2 0 = g k ∧ (∀ j ≤ k, ∃ i : Fin b.1, b.2 i = g j))} =
      ∅ :=
    by
    apply Set.eq_empty_of_forall_not_mem
    intro b hb
    have h₇ := hb
    simp only [Set.mem_setOf_eq] at h₇
    have h₈ := h₇.1
    have h₉ := h₇.2.1
    have h₁₀ := h₇.2.2.1
    have h₁₁ := h₇.2.2.2
    have h₁₂ := hnabsum n hn b
    have h₁₃ := h₁₂.mp h₈
    have h₁₄ : b.1 ≥ 1 := h₁₃.1
    have h₁₅ : ∀ i < b.1, b.2 i > 0 := h₁₃.2.1
    have h₁₆ : ∀ i ≥ b.1, b.2 i = 0 := h₁₃.2.2.1
    have h₁₇ : (∑ i : Fin b.1, b.2 i) = n := h₁₃.2.2.2
    have h₁₈ : ∀ i : Fin (b.1 - 1), b.2 i ≥ b.2 (i + 1) :=
      by
      intro i
      have h₁₉ := h₉ i
      simpa using h₁₉
    have h₁₉ : ∀ i : Fin b.1, ∃ j : ℕ, b.2 i = g j := h₁₀
    have h₂₀ : ∃ k : ℕ, b.2 0 = g k ∧ (∀ j ≤ k, ∃ i : Fin b.1, b.2 i = g j) := h₁₁
    have h₂₁ := hg.1
    have h₂₂ := hg.2.1
    have h₂₃ := hg.2.2
    have h₂₄ := h₁₅ 0
    have h₂₅ := h₁₅ 1
    have h₂₆ := h₁₆ 0
    have h₂₇ := h₁₆ 1
    have h₂₈ := h₁₈
    have h₂₉ := h₁₉
    have h₃₀ := h₂₀
    norm_num at * <;> (try omega) <;>
        (try {
            exfalso
            have h₃₁ := h₁₅ 0
            have h₃₂ := h₁₅ 1
            have h₃₃ := h₁₆ 0
            have h₃₄ := h₁₆ 1
            have h₃₅ := h₁₈
            have h₃₆ := h₁₉
            have h₃₇ := h₂₀
            norm_num at * <;> (try omega) <;>
              (try {simp_all [Fin.forall_fin_succ, Fin.ext_iff, Fin.val_zero, Fin.val_succ] <;> omega
                })
          }) <;>
      (try {simp_all [Fin.forall_fin_succ, Fin.ext_iff, Fin.val_zero, Fin.val_succ] <;> omega
        })
  rw [h₆]
  simp