theorem putnam_1994_b1
    (n : ℤ) :
    n ∈ (({n : ℤ | (315 ≤ n ∧ n ≤ 325) ∨ (332 ≤ n ∧ n ≤ 350)}) : Set ℤ ) ↔
    (0 < n ∧ {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard = 15) := by
  have h_main : n ∈ ({n : ℤ | (315 ≤ n ∧ n ≤ 325) ∨ (332 ≤ n ∧ n ≤ 350)} : Set ℤ) → (0 < n ∧ {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard = 15) := by
    intro hn
    have h₁ : 0 < n := by
      -- Prove that n is positive
      rcases hn with (⟨h₁, h₂⟩ | ⟨h₁, h₂⟩)
      · -- Case: 315 ≤ n ≤ 325
        linarith
      · -- Case: 332 ≤ n ≤ 350
        linarith
    have h₂ : {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard = 15 := by
      -- Prove the encardinality condition
      have h₃ : (315 ≤ n ∧ n ≤ 325) ∨ (332 ≤ n ∧ n ≤ 350) := by
        simpa using hn
      have h₄ : n ≥ 315 := by
        rcases h₃ with (⟨h₄, _⟩ | ⟨h₄, _⟩) <;> linarith
      have h₅ : n ≤ 350 := by
        rcases h₃ with (⟨_, h₅⟩ | ⟨_, h₅⟩) <;> linarith
      -- Check the encardinality for different ranges of n
      interval_cases n <;> norm_num [Set.ext_iff, Set.mem_setOf_eq, Int.natAbs_eq_iff, sq,
        Int.emod_eq_of_lt] <;>
        (try decide) <;>
        (try
          {
            rfl
          }) <;>
        (try
          {
            norm_num at *
            <;>
            rfl
          }) <;>
        (try
          {
            aesop
          }) <;>
        (try
          {
            norm_num [Nat.card_eq_fintype_card, Fintype.card_finset, Finset.card_range] at *
            <;>
            norm_num <;>
            rfl
          })
    exact ⟨h₁, h₂⟩
  
  have h_converse : (0 < n ∧ {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard = 15) → n ∈ ({n : ℤ | (315 ≤ n ∧ n ≤ 325) ∨ (332 ≤ n ∧ n ≤ 350)} : Set ℤ) := by
    rintro ⟨hn_pos, hn_card⟩
    have h₁ : (315 ≤ n ∧ n ≤ 325) ∨ (332 ≤ n ∧ n ≤ 350) := by
      -- We know n > 0 and the encardinality condition is satisfied.
      -- We need to show that n is in one of the two specified ranges.
      have h₂ : n ≥ 315 := by
        by_contra hn_lt
        -- If n < 315, we need to show that the encardinality condition cannot be satisfied.
        have h₃ : n ≤ 314 := by linarith
        have h₄ : n > 0 := hn_pos
        -- We consider different ranges for n and check the encardinality.
        -- For n ≤ 314, the encardinality is greater than 15.
        have h₅ : n ≤ 314 := by linarith
        have h₆ : {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard ≠ 15 := by
          -- Detailed encardinality calculation for n ≤ 314.
          have h₇ : n ≤ 314 := by linarith
          have h₈ : n > 0 := hn_pos
          interval_cases n <;> norm_num [Set.ext_iff, Set.mem_setOf_eq, Int.natAbs_eq_iff, sq, Int.emod_eq_of_lt] at * <;>
            (try decide) <;>
            (try norm_num) <;>
            (try aesop) <;>
            (try
              {
                norm_num [Nat.card_eq_fintype_card, Fintype.card_finset, Finset.card_range] at *
                <;>
                norm_num <;>
                rfl
              }) <;>
            (try omega)
        contradiction
      have h₃ : n ≤ 325 ∨ n ≥ 332 := by
        by_contra h
        -- If n is not ≤ 325 and not ≥ 332, we need to show that the encardinality condition cannot be satisfied.
        have h₄ : n > 325 := by
          by_contra h₅
          have h₆ : n ≤ 325 := by linarith
          have h₇ : n ≥ 332 := by
            by_contra h₈
            have h₉ : n < 332 := by linarith
            have h₁₀ : n > 0 := hn_pos
            have h₁₁ : {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard ≠ 15 := by
              interval_cases n <;> norm_num [Set.ext_iff, Set.mem_setOf_eq, Int.natAbs_eq_iff, sq, Int.emod_eq_of_lt] at * <;>
                (try decide) <;>
                (try norm_num) <;>
                (try aesop) <;>
                (try
                  {
                    norm_num [Nat.card_eq_fintype_card, Fintype.card_finset, Finset.card_range] at *
                    <;>
                    norm_num <;>
                    rfl
                  }) <;>
                (try omega)
            contradiction
          omega
        have h₅ : n < 332 := by
          by_contra h₆
          have h₇ : n ≥ 332 := by linarith
          omega
        have h₆ : n > 325 := by omega
        have h₇ : n < 332 := by omega
        have h₈ : n > 0 := hn_pos
        have h₉ : {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard ≠ 15 := by
          interval_cases n <;> norm_num [Set.ext_iff, Set.mem_setOf_eq, Int.natAbs_eq_iff, sq, Int.emod_eq_of_lt] at * <;>
            (try decide) <;>
            (try norm_num) <;>
            (try aesop) <;>
            (try
              {
                norm_num [Nat.card_eq_fintype_card, Fintype.card_finset, Finset.card_range] at *
                <;>
                norm_num <;>
                rfl
              }) <;>
            (try omega)
        contradiction
      cases h₃ with
      | inl h₃ =>
        -- If n ≤ 325, we need to show that n is in the range 315 ≤ n ≤ 325.
        have h₄ : 315 ≤ n := by linarith
        have h₅ : n ≤ 325 := by linarith
        exact Or.inl ⟨h₄, h₅⟩
      | inr h₃ =>
        -- If n ≥ 332, we need to show that n is in the range 332 ≤ n ≤ 350.
        have h₄ : n ≥ 332 := by linarith
        have h₅ : n ≤ 350 := by
          by_contra h₅
          have h₆ : n > 350 := by linarith
          have h₇ : n > 0 := hn_pos
          have h₈ : {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard ≠ 15 := by
            -- Detailed encardinality calculation for n > 350.
            have h₉ : n ≥ 351 := by linarith
            interval_cases n <;> norm_num [Set.ext_iff, Set.mem_setOf_eq, Int.natAbs_eq_iff, sq, Int.emod_eq_of_lt] at * <;>
              (try decide) <;>
              (try norm_num) <;>
              (try aesop) <;>
              (try
                {
                  norm_num [Nat.card_eq_fintype_card, Fintype.card_finset, Finset.card_range] at *
                  <;>
                  norm_num <;>
                  rfl
                }) <;>
              (try omega)
          contradiction
        exact Or.inr ⟨h₄, h₅⟩
    simpa using h₁
  
  have h_final : (n ∈ (({n : ℤ | (315 ≤ n ∧ n ≤ 325) ∨ (332 ≤ n ∧ n ≤ 350)}) : Set ℤ) ↔ (0 < n ∧ {m : ℕ | ‖(n - (m : ℤ) ^ 2 : ℤ)‖ ≤ 250}.encard = 15)) := by
    exact ⟨fun h ↦ h_main h, fun h ↦ h_converse h⟩
  
  rw [h_final]
  <;> aesop