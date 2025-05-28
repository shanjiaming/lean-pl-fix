theorem h_main (S : Finset (EuclideanSpace ℝ (Fin 2))) (hcard : S.card ≥ 3) (hS : ∀ s ⊆ S, s.card = 3 → ¬Collinear ℝ ↑s) : ∃ L,
    (∀ p ∈ S, ∃! i, p = L i) ∧
      ∀ (i j : ZMod S.card),
        i ≠ j →
          ∀ (I : EuclideanSpace ℝ (Fin 2)),
            I ∈ segment ℝ (L i) (L (i + 1)) ∧ I ∈ segment ℝ (L j) (L (j + 1)) →
              I = L i ∨ I = L (i + 1) ∨ I = L j ∨ I = L (j + 1) :=
  by
  classical
  have h₁ : S.Nonempty := by
    by_contra h
    have h₂ : S = ∅ := by simpa [Finset.nonempty_iff_ne_empty] using h
    have h₃ : S.card ≥ 3 := hcard
    rw [h₂] at h₃
    norm_num at h₃ <;> simp_all (config := { decide := true }) <;> omega
  use fun i =>
    (Finset.sort (· ≤ ·) S).get
      ⟨i.val,
        by
        have h₂ : i.val < S.card := by
          have h₃ : (i : ℕ) < S.card := by exact ZMod.val_lt i
          simpa using h₃
        omega⟩
  constructor
  · intro p hp
    have h₂ : p ∈ Finset.sort (· ≤ ·) S := by
      apply Finset.mem_sort.mpr
      exact hp
    refine' ⟨⟨(Finset.sort (· ≤ ·) S).indexOf p, _⟩, _, _⟩
    ·
      have h₃ : (Finset.sort (· ≤ ·) S).indexOf p < S.card :=
        by
        have h₄ : (Finset.sort (· ≤ ·) S).indexOf p < (Finset.sort (· ≤ ·) S).length :=
          by
          apply List.indexOf_lt_length.mpr
          exact h₂
        simpa [Finset.length_sort] using h₄
      have h₄ : (⟨(Finset.sort (· ≤ ·) S).indexOf p, h₃⟩ : Fin S.card) = ⟨(Finset.sort (· ≤ ·) S).indexOf p, h₃⟩ := rfl
      omega
    ·
      have h₃ :
        (Finset.sort (· ≤ ·) S).get
            ⟨(Finset.sort (· ≤ ·) S).indexOf p,
              by
              have h₄ : (Finset.sort (· ≤ ·) S).indexOf p < S.card :=
                by
                have h₅ : (Finset.sort (· ≤ ·) S).indexOf p < (Finset.sort (· ≤ ·) S).length :=
                  by
                  apply List.indexOf_lt_length.mpr
                  exact h₂
                simpa [Finset.length_sort] using h₅
              omega⟩ =
          p :=
        by
        apply List.get_of_mem
        exact h₂
      simpa using h₃
    · intro i hi
      have h₃ :
        (Finset.sort (· ≤ ·) S).get
            ⟨i.val,
              by
              have h₄ : i.val < S.card :=
                by
                have h₅ : (i : ℕ) < S.card := by exact ZMod.val_lt i
                simpa using h₅
              omega⟩ =
          p :=
        by simpa [hi] using hi
      have h₄ : i.val = (Finset.sort (· ≤ ·) S).indexOf p :=
        by
        have h₅ :
          (Finset.sort (· ≤ ·) S).get
              ⟨i.val,
                by
                have h₆ : i.val < S.card :=
                  by
                  have h₇ : (i : ℕ) < S.card := by exact ZMod.val_lt i
                  simpa using h₇
                omega⟩ =
            p :=
          by simpa [hi] using hi
        have h₆ : i.val < (Finset.sort (· ≤ ·) S).length :=
          by
          have h₇ : i.val < S.card := by
            have h₈ : (i : ℕ) < S.card := by exact ZMod.val_lt i
            simpa using h₈
          simpa [Finset.length_sort] using h₇
        have h₇ : (Finset.sort (· ≤ ·) S).get ⟨i.val, by omega⟩ = p := by simpa [hi] using hi
        have h₈ : i.val = (Finset.sort (· ≤ ·) S).indexOf p := by
          apply List.indexOf_get <;> simp_all [Finset.mem_sort] <;> aesop
        simpa using h₈
      have h₅ :
        i =
          ⟨(Finset.sort (· ≤ ·) S).indexOf p,
            by
            have h₆ : (Finset.sort (· ≤ ·) S).indexOf p < S.card :=
              by
              have h₇ : (Finset.sort (· ≤ ·) S).indexOf p < (Finset.sort (· ≤ ·) S).length :=
                by
                apply List.indexOf_lt_length.mpr
                exact h₂
              simpa [Finset.length_sort] using h₇
            omega⟩ :=
        by ext <;> simp_all [ZMod.val_nat_cast] <;> omega
      simpa [h₅] using h₃
  · intro i j hij I hI
    exfalso
    have h₂ := hS ∅
    have h₃ := hS S
    have h₄ := hS {⟨0, 0⟩}
    have h₅ := hS {⟨0, 0⟩, ⟨0, 0⟩}
    have h₆ := hS {⟨0, 0⟩, ⟨0, 0⟩, ⟨0, 0⟩}
    norm_num [Finset.card_eq_zero, Finset.card_eq_one, Finset.card_eq_two, Collinear] at h₂ h₃ h₄ h₅ h₆ <;>
        simp_all [Finset.subset_iff, Finset.mem_singleton, Finset.mem_insert, segment_eq_image, Set.subset_def] <;>
      aesop
  hole