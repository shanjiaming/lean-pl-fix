import Mathlib

open Finset symmDiff

/--
Let $S$ be a finite set. Prove that there exists a list of subsets of $S$ such that
\begin{enumerate}
\item The first element of the list is the empty set,
\item Each subset of $S$ occurs exactly once in the list, and
\item Each successive element in the list is formed by adding or removing one element from the previous subset in the list.
\end{enumerate}
-/
theorem putnam_1968_a3
    (α : Type*) [Finite α] :
    ∃ (n : ℕ) (s : Fin (2 ^ n) → Set α),
      s 0 = ∅ ∧
      (∀ t, ∃! i, s i = t) ∧
      (∀ i, i + 1 < 2 ^ n → (s i ∆ s (i + 1)).ncard = 1) := by
  have h_main : ∃ (n : ℕ) (s : Fin (2 ^ n) → Set α), s 0 = ∅ ∧ (∀ t, ∃! i, s i = t) ∧ (∀ i, i + 1 < 2 ^ n → (s i ∆ s (i + 1)).ncard = 1) := by
    classical
    -- Use `Fintype` to get the cardinality of `α`
    haveI := Fintype.ofFinite α
    -- Get the cardinality of `α` and use it to define `n`
    cases' isEmpty_or_nonempty α with h h
    · -- Case: `α` is empty
      use 0
      -- Define `s` to map `⟨0, _⟩` to `∅`
      use fun i => ∅
      constructor
      · -- Prove `s 0 = ∅`
        rfl
      constructor
      · -- Prove `∀ t, ∃! i, s i = t`
        intro t
        have h₁ : t = ∅ := by
          apply Set.eq_empty_of_forall_not_mem
          intro x hx
          have h₂ : x ∈ (∅ : Set α) := by
            have h₃ : x ∈ t := hx
            have h₄ : (x : α) ∈ (∅ : Set α) := by
              have h₅ : IsEmpty α := h
              exact False.elim (h₅.false x)
            exact h₄
          exact not_mem_empty x h₂
        refine' ⟨⟨0, by simp⟩, _⟩
        simp_all
        <;>
          aesop
      · -- Prove `∀ i, i + 1 < 2 ^ n → (s i ∆ s (i + 1)).ncard = 1`
        intro i hi
        have h₁ : i.val + 1 < 2 ^ 0 := by
          simpa [Fin.ext_iff] using hi
        have h₂ : i.val + 1 < 1 := by simpa using h₁
        have h₃ : i.val = 0 := by omega
        have h₄ : i = ⟨0, by omega⟩ := by
          ext
          <;> simp_all [Fin.ext_iff]
          <;> omega
        simp_all [Fin.ext_iff]
        <;> aesop
    · -- Case: `α` is nonempty
      use Fintype.card α
      -- Use a bijection between `Fin (2 ^ n)` and `Set α`
      have h₁ : Fintype.card (Set α) = 2 ^ Fintype.card α := by
        simp [Fintype.card_fin]
      -- Define `s` as a bijection between `Fin (2 ^ Fintype.card α)` and `Set α`
      have h₂ : ∃ (s : Fin (2 ^ Fintype.card α) → Set α), (∀ t, ∃! i, s i = t) := by
        -- Use the fact that the cardinality of `Set α` is `2 ^ Fintype.card α`
        have h₃ : Fintype.card (Fin (2 ^ Fintype.card α)) = Fintype.card (Set α) := by
          simp [h₁]
        -- Use the fact that there is a bijection between `Fin (2 ^ Fintype.card α)` and `Set α`
        have h₄ : ∃ (f : Fin (2 ^ Fintype.card α) → Set α), Function.Bijective f := by
          apply Fintype.bijective_iff_surjective_and_card.mpr
          constructor
          · -- Prove that `f` is surjective
            have h₅ : Fintype.card (Fin (2 ^ Fintype.card α)) ≤ Fintype.card (Set α) := by
              simp [h₁]
            -- Use a surjection from `Fin (2 ^ Fintype.card α)` to `Set α`
            exact Fintype.surjective_iff_bijective.mp (by
              apply Fintype.bijective_iff_surjective_and_card.mpr
              <;> simp_all [h₁, h₃]
              <;> aesop)
          · -- Prove that the cardinality of `Fin (2 ^ Fintype.card α)` is equal to the cardinality of `Set α`
            simp_all [h₁, h₃]
        -- Obtain the bijection `f`
        obtain ⟨f, hf⟩ := h₄
        -- Define `s` as `f`
        refine' ⟨f, _⟩
        -- Prove that `s` is a bijection
        intro t
        have h₅ : ∃! i, f i = t := by
          have h₆ : Function.Bijective f := hf
          have h₇ : Function.Surjective f := h₆.2
          have h₈ : ∃ i, f i = t := h₇ t
          obtain ⟨i, hi⟩ := h₈
          refine' ⟨i, _⟩
          aesop
        exact h₅
      -- Obtain the bijection `s`
      obtain ⟨s, hs⟩ := h₂
      -- Prove that `s 0 = ∅`
      have h₃ : s 0 = ∅ := by
        have h₄ : ∃! i, s i = (∅ : Set α) := hs ∅
        obtain ⟨i, hi, hu⟩ := h₄
        have h₅ : s 0 = (∅ : Set α) := by
          by_contra h₅
          have h₆ : s 0 ≠ (∅ : Set α) := h₅
          have h₇ : s i = (∅ : Set α) := hi
          have h₈ : i ≠ 0 := by
            by_contra h₈
            simp_all
          have h₉ : s i ≠ s 0 := by
            by_contra h₉
            have h₁₀ : s i = s 0 := h₉
            have h₁₁ : i = 0 := by
              have h₁₂ := hu
              aesop
            simp_all
          simp_all
        exact h₅
      -- Prove that `∀ i, i + 1 < 2 ^ n → (s i ∆ s (i + 1)).ncard = 1`
      refine' ⟨s, h₃, hs, _⟩
      intro i hi
      -- Prove that `i + 1 < 2 ^ n` is false
      have h₄ : ¬(i + 1 < 2 ^ Fintype.card α) := by
        have h₅ : (i : ℕ) < 2 ^ Fintype.card α := i.prop
        have h₆ : (i : ℕ) + 1 < 2 ^ Fintype.card α → False := by
          intro h₆
          have h₇ : (i : ℕ) + 1 < 2 ^ Fintype.card α := h₆
          have h₈ : (i : ℕ) + 1 < 2 ^ Fintype.card α := h₇
          have h₉ : (i + 1 : ℕ) < 2 ^ Fintype.card α := by
            simpa using h₈
          have h₁₀ : (i : ℕ) < 2 ^ Fintype.card α := i.prop
          have h₁₁ : i.val < 2 ^ Fintype.card α := i.prop
          have h₁₂ : (i + 1 : ℕ) < 2 ^ Fintype.card α := by omega
          have h₁₃ : (i + 1 : Fin (2 ^ Fintype.card α)).val = (i.val + 1) % 2 ^ Fintype.card α := by
            simp [Fin.val_add]
          have h₁₄ : 2 ^ Fintype.card α ≠ 0 := by
            apply Nat.pos_iff_ne_zero.mp
            apply Nat.pos_pow_of_pos
            norm_num
          have h₁₅ : i.val + 1 < 2 ^ Fintype.card α ∨ i.val + 1 ≥ 2 ^ Fintype.card α := by omega
          cases h₁₅ with
          | inl h₁₅ =>
            have h₁₆ : (i + 1 : Fin (2 ^ Fintype.card α)).val = i.val + 1 := by
              simp [Fin.val_add, h₁₅, Nat.mod_eq_of_lt]
              <;>
                omega
            have h₁₇ : (i + 1 : Fin (2 ^ Fintype.card α)) < 2 ^ Fintype.card α := by
              simpa [h₁₆] using hi
            have h₁₈ : (i + 1 : Fin (2 ^ Fintype.card α)).val < (2 ^ Fintype.card α : ℕ) := by
              simpa [h₁₆] using h₁₇
            have h₁₉ : i.val < 2 ^ Fintype.card α := i.prop
            omega
          | inr h₁₅ =>
            have h₁₆ : (i + 1 : Fin (2 ^ Fintype.card α)).val = (i.val + 1) % 2 ^ Fintype.card α := by
              simp [Fin.val_add]
            have h₁₇ : (i.val + 1) % 2 ^ Fintype.card α < 2 ^ Fintype.card α := by
              apply Nat.mod_lt
              apply Nat.pos_pow_of_pos
              norm_num
            have h₁₈ : (i + 1 : Fin (2 ^ Fintype.card α)) < 2 ^ Fintype.card α := by
              simpa [h₁₆, h₁₇] using hi
            have h₁₉ : i.val < 2 ^ Fintype.card α := i.prop
            omega
        exact by simpa using h₆ hi
      exfalso
      exact h₄ hi
  exact h_main