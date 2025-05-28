theorem h_main (IsValidMove : Set (Fin 2022) → Set (Fin 2022) → Prop) (IsValidMove_def :  ∀ (x y : Set (Fin 2022)),    IsValidMove x y ↔ (x = y ∧ ∀ i < 2021, i ∉ x → i + 1 ∈ x) ∨ ∃ i < 2021, i ∉ x ∧ i + 1 ∉ x ∧ y = x ∪ {i, i + 1}) (IsValidGame : List (Set (Fin 2022)) → Prop) (IsValidGame_def : ∀ (g : List (Set (Fin 2022))), IsValidGame g ↔ (∃ gt, g = ∅ :: gt) ∧ List.Chain' IsValidMove g) (ConformsToStrategy : List (Set (Fin 2022)) → (Set (Fin 2022) → Set (Fin 2022)) → Prop) (ConformsToStrategy_def :  ∀ (g : List (Set (Fin 2022))) (s : Set (Fin 2022) → Set (Fin 2022)),    ConformsToStrategy g s ↔ ∀ (i : ℕ) (h : i + 1 < g.length), Even i → g[i + 1] = s g[i]) : IsGreatest
    {n |
      ∃ s,
        (∀ (x : Set (Fin 2022)), IsValidMove x (s x)) ∧
          ∀ (g : List (Set (Fin 2022))), IsValidGame g → ConformsToStrategy g s → ∃ gh x, g = gh ++ [x] ∧ n ≤ xᶜ.ncard}
    290 :=
  by
  have h₁ :
    290 ∈
      {n |
        ∃ s,
          (∀ x, IsValidMove x (s x)) ∧
            ∀ g, IsValidGame g → ConformsToStrategy g s → ∃ gh x, g = gh ++ [x] ∧ n ≤ xᶜ.ncard} := by sorry
  have h₂ :
    IsGreatest
      {n |
        ∃ s,
          (∀ x, IsValidMove x (s x)) ∧
            ∀ g, IsValidGame g → ConformsToStrategy g s → ∃ gh x, g = gh ++ [x] ∧ n ≤ xᶜ.ncard}
      290 :=
    by
    refine' ⟨h₁, _⟩
    rintro n ⟨s, hs₁, hs₂⟩
    have h₃ : n ≤ 2022 :=
      by
      have h₄ : ∀ g, IsValidGame g → ConformsToStrategy g s → ∃ gh x, g = gh ++ [x] ∧ n ≤ xᶜ.ncard := hs₂
      have h₅ : IsValidGame [∅] := by
        rw [IsValidGame_def]
        constructor
        · use [] <;> simp
        ·
          simp [List.chain'_cons, IsValidMove_def] <;> (try aesop) <;> (try omega) <;>
                (try simp_all [IsValidMove_def]) <;>
              (try aesop) <;>
            (try omega)
      have h₆ : ConformsToStrategy [∅] s := by
        rw [ConformsToStrategy_def]
        intro i hi h_even
        have h₇ : i + 1 < (1 : ℕ) := by simpa using hi
        have h₈ : i < 0 := by omega
        have h₉ : False := by omega
        exact False.elim h₉
      have h₇ : ∃ gh x, [∅] = gh ++ [x] ∧ n ≤ xᶜ.ncard := h₄ [∅] h₅ h₆
      obtain ⟨gh, x, h₈, h₉⟩ := h₇
      have h₁₀ : [∅] = gh ++ [x] := h₈
      have h₁₁ : n ≤ xᶜ.ncard := h₉
      have h₁₂ : x = ∅ := by
        have h₁₃ : [∅] = gh ++ [x] := h₈
        have h₁₄ : gh = [] := by
          by_cases h₁₅ : gh = []
          · exact h₁₅
          ·
            have h₁₆ : gh ≠ [] := h₁₅
            have h₁₇ : gh ++ [x] ≠ [∅] := by
              by_contra h₁₈
              have h₁₉ : gh ++ [x] = [∅] := h₁₈
              have h₂₀ : gh ≠ [] := h₁₆
              have h₂₁ : (gh ++ [x]).length > 1 := by
                have h₂₂ : gh ≠ [] := h₂₀
                have h₂₃ : (gh ++ [x]).length = gh.length + 1 := by simp [List.length_append, List.length_singleton]
                have h₂₄ : gh.length > 0 := by
                  by_contra h₂₅
                  have h₂₆ : gh.length = 0 := by omega
                  have h₂₇ : gh = [] := by simp_all [List.length_eq_zero]
                  contradiction
                omega
              have h₂₅ : ([∅] : List (Set (Fin 2022))).length = 1 := by simp
              omega
            contradiction <;> simp_all [List.append_eq_cons_iff] <;> aesop
        simp_all [List.append_eq_cons_iff] <;> aesop
      have h₁₃ : x = ∅ := h₁₂
      have h₁₄ : n ≤ xᶜ.ncard := h₉
      have h₁₅ : (∅ : Set (Fin 2022))ᶜ = Set.univ := by simp [Set.ext_iff]
      have h₁₆ : (Set.univ : Set (Fin 2022)).ncard = 2022 := by simp [Set.ncard_univ, Fintype.card_fin]
      have h₁₇ : xᶜ.ncard = 2022 := by
        rw [h₁₃]
        rw [h₁₅]
        rw [h₁₆]
      have h₁₈ : n ≤ 2022 := by linarith
      exact h₁₈
    have h₄ : n ≤ 2022 := h₃
    have h₅ : n ≤ 290 ∨ n > 290 := by omega
    cases h₅ with
    | inl h₅ => omega
    | inr h₅ =>
      have h₆ : n ≤ 2022 := h₃
      have h₇ : n ≤ 290 ∨ n > 290 := by omega
      omega
  exact h₂