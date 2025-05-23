theorem putnam_2014_b1
(overexpansion : ℕ → List ℕ → Prop)
(hoverexpansion : overexpansion = fun N d ↦ N = ∑ i : Fin d.length, (d.get i) * 10 ^ i.1 ∧ d.getLastI ≠ 0 ∧ ∀ a ∈ d, a ∈ Finset.range 11)
(S : Set ℕ)
(hS : ∀ N : ℕ, N ∈ S ↔ N > 0 ∧ ∃! d : List ℕ, overexpansion N d)
: (S = (({n : ℕ | n > 0 ∧ ¬∃ a ∈ digits 10 n, a = 0}) : Set ℕ )) := by
  have h_subset₁ : S ⊆ {n : ℕ | n > 0 ∧ ¬∃ a ∈ digits 10 n, a = 0} := by
    intro n hn
    rw [hS] at hn
    have h₁ : n > 0 := hn.1
    have h₂ : ∃! d : List ℕ, overexpansion n d := hn.2
    have h₃ : ¬∃ a ∈ digits 10 n, a = 0 := by
      by_contra h
      -- Assume there exists a digit 0 in the base 10 representation of n
      rcases h with ⟨a, ha, ha'⟩
      -- Extract the digit a and its properties
      have h₄ : ∃! d : List ℕ, overexpansion n d := h₂
      rcases h₄ with ⟨d, hd, hu⟩
      -- Get the unique list d that satisfies the overexpansion property
      have h₅ : overexpansion n d := hd
      have h₆ : ∀ (d' : List ℕ), overexpansion n d' → d' = d := hu
      -- Show that any other list d' satisfying the overexpansion property must be equal to d
      have h₇ : overexpansion n (digits 10 n) := by
        rw [hoverexpansion]
        constructor
        · -- Prove the sum condition
          have h₈ : n = ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
            have h₉ : n = ∑ i in (Finset.univ : Finset (Fin (digits 10 n).length)), (digits 10 n).get i * 10 ^ (i : ℕ) := by
              rw [← ofDigits_digits 10 n]
              <;> simp [ofDigits_eq_sum_map_index, List.get_map, List.get_range, pow_succ]
              <;> rfl
            simpa [Finset.sum_const, nsmul_eq_mul] using h₉
          exact h₈
        · constructor
          · -- Prove the last digit is not zero
            have h₉ : (digits 10 n).getLastI ≠ 0 := by
              by_contra h₉
              have h₁₀ : (digits 10 n).getLastI = 0 := by simpa using h₉
              have h₁₁ : n = 0 := by
                have h₁₂ := Nat.ofDigits_digits 10 n
                have h₁₃ : (digits 10 n).getLastI = 0 := h₁₀
                have h₁₄ : (digits 10 n) ≠ [] := by
                  by_contra h₁₄
                  simp_all [List.getLastI, List.get]
                  <;> omega
                have h₁₅ : (digits 10 n).getLastI = (digits 10 n).get ⟨(digits 10 n).length - 1, by
                  have h₁₆ := h₁₄
                  have h₁₇ : (digits 10 n).length > 0 := by
                    by_contra h₁₇
                    simp_all [List.length_eq_zero]
                  omega⟩ := by
                  simp [List.getLastI]
                  <;> rfl
                rw [h₁₅] at h₁₃
                have h₁₆ : (digits 10 n).get ⟨(digits 10 n).length - 1, by
                  have h₁₇ := h₁₄
                  have h₁₈ : (digits 10 n).length > 0 := by
                    by_contra h₁₈
                    simp_all [List.length_eq_zero]
                  omega⟩ = 0 := h₁₃
                have h₁₇ : n = 0 := by
                  have h₁₈ := Nat.ofDigits_digits 10 n
                  have h₁₉ : (digits 10 n) ≠ [] := h₁₄
                  have h₂₀ : (digits 10 n).get ⟨(digits 10 n).length - 1, by
                    have h₂₁ := h₁₄
                    have h₂₂ : (digits 10 n).length > 0 := by
                      by_contra h₂₂
                      simp_all [List.length_eq_zero]
                    omega⟩ = 0 := h₁₆
                  have h₂₁ : n = 0 := by
                    simp_all [Nat.ofDigits_eq_foldr, List.get]
                    <;> omega
                  exact h₂₁
                exact h₁₇
              omega
              <;> simp_all
            exact h₉
          · -- Prove all digits are in the range 0 to 10
            intro a ha
            have h₉ : a ∈ Finset.range 11 := by
              have h₁₀ : a ∈ digits 10 n := ha
              have h₁₁ : a < 10 := by
                have h₁₂ : ∀ (a : ℕ), a ∈ digits 10 n → a < 10 := by
                  intro a ha
                  have h₁₃ : a ∈ digits 10 n := ha
                  have h₁₄ : a < 10 := by
                    have h₁₅ : ∀ (a : ℕ), a ∈ digits 10 n → a < 10 := by
                      intro a ha
                      have h₁₆ : a ∈ digits 10 n := ha
                      have h₁₇ : a < 10 := by
                        apply Nat.digits_lt_base (by norm_num : 2 ≤ 10) h₁₆
                      exact h₁₇
                    exact h₁₅ a h₁₃
                  exact h₁₄
                exact h₁₂ a h₁₀
              have h₁₂ : a < 11 := by omega
              have h₁₃ : a ∈ Finset.range 11 := by
                rw [Finset.mem_range]
                exact h₁₂
              exact h₁₃
            exact h₉
      -- Prove that the digits of n are a valid overexpansion
      have h₈ : overexpansion n (digits 10 n) := h₇
      have h₉ : (digits 10 n) = d := by
        apply h₆
        exact h₈
      -- Prove that the digits of n are equal to d
      have h₁₀ : a ∈ digits 10 n := ha
      have h₁₁ : a = 0 := ha'
      have h₁₂ : a ∈ d := by
        rw [← h₉]
        exact h₁₀
      have h₁₃ : overexpansion n d := h₅
      rw [hoverexpansion] at h₁₃
      have h₁₄ : d.getLastI ≠ 0 := h₁₃.2.1
      have h₁₅ : ∀ a ∈ d, a ∈ Finset.range 11 := h₁₃.2.2
      have h₁₆ : a ∈ d := h₁₂
      have h₁₇ : a ∈ Finset.range 11 := h₁₅ a h₁₆
      have h₁₈ : a < 11 := by
        rw [Finset.mem_range] at h₁₇
        exact h₁₇
      have h₁₉ : a = 0 := ha'
      have h₂₀ : 0 ∈ d := by
        rw [h₁₉] at h₁₆
        exact h₁₆
      have h₂₁ : d ≠ [] := by
        by_contra h₂₁
        simp_all [List.getLastI, List.get]
        <;> aesop
      have h₂₂ : d.getLastI = 0 := by
        have h₂₃ : a = 0 := ha'
        have h₂₄ : 0 ∈ d := by
          rw [h₂₃] at h₁₆
          exact h₁₆
        have h₂₅ : d ≠ [] := h₂₁
        have h₂₆ : d.getLastI = 0 := by
          have h₂₇ := h₅
          rw [hoverexpansion] at h₂₇
          have h₂₈ := h₂₇.2.2
          have h₂₉ := h₂₇.2.1
          have h₃₀ := h₂₇.1
          have h₃₁ : 0 ∈ d := h₂₄
          have h₃₂ : d.getLastI = 0 := by
            -- Prove that the last digit of d is 0
            have h₃₃ : d.getLastI = 0 := by
              -- Use the fact that 0 is in d and the properties of the overexpansion
              have h₃₄ : d ≠ [] := h₂₁
              have h₃₅ : d.getLastI = d.get ⟨d.length - 1, by
                have h₃₆ : d.length > 0 := by
                  by_contra h₃₆
                  have h₃₇ : d = [] := by
                    have h₃₈ : d.length = 0 := by omega
                    have h₃₉ : d = [] := by
                      apply List.length_eq_zero.mp
                      omega
                    exact h₃₉
                  simp_all [List.getLastI, List.get]
                  <;> aesop
                omega⟩ := by
                simp [List.getLastI]
                <;> rfl
              have h₃₆ : d.get ⟨d.length - 1, by
                have h₃₇ : d.length > 0 := by
                  by_contra h₃₇
                  have h₃₈ : d = [] := by
                    have h₃₉ : d.length = 0 := by omega
                    have h₄₀ : d = [] := by
                      apply List.length_eq_zero.mp
                      omega
                    exact h₄₀
                  simp_all [List.getLastI, List.get]
                  <;> aesop
                omega⟩ = 0 := by
                -- Use the fact that 0 is in d and the properties of the overexpansion
                have h₃₇ : 0 ∈ d := h₂₄
                have h₃₈ : d.get ⟨d.length - 1, by
                  have h₃₉ : d.length > 0 := by
                    by_contra h₃₉
                    have h₄₀ : d = [] := by
                      have h₄₁ : d.length = 0 := by omega
                      have h₄₂ : d = [] := by
                        apply List.length_eq_zero.mp
                        omega
                      exact h₄₂
                    simp_all [List.getLastI, List.get]
                    <;> aesop
                  omega⟩ = 0 := by
                  -- Use the fact that 0 is in d and the properties of the overexpansion
                  have h₄₀ : 0 ∈ d := h₂₄
                  have h₄₁ : d.get ⟨d.length - 1, by
                    have h₄₂ : d.length > 0 := by
                      by_contra h₄₂
                      have h₄₃ : d = [] := by
                        have h₄₄ : d.length = 0 := by omega
                        have h₄₅ : d = [] := by
                          apply List.length_eq_zero.mp
                          omega
                        exact h₄₅
                      simp_all [List.getLastI, List.get]
                      <;> aesop
                    omega⟩ = 0 := by
                    -- Use the fact that 0 is in d and the properties of the overexpansion
                    simp_all [List.getLastI, List.get]
                    <;> aesop
                  exact h₄₁
                exact h₃₈
              simp_all [List.getLastI, List.get]
              <;> aesop
            exact h₃₃
          exact h₃₂
        exact h₂₆
      have h₂₃ : d.getLastI ≠ 0 := h₁₄
      have h₂₄ : d.getLastI = 0 := h₂₂
      omega
    exact ⟨h₁, h₃⟩
  
  have h_subset₂ : {n : ℕ | n > 0 ∧ ¬∃ a ∈ digits 10 n, a = 0} ⊆ S := by
    intro n hn
    rw [Set.mem_setOf_eq] at hn
    rw [hS]
    have h₁ : n > 0 := hn.1
    have h₂ : ¬∃ a ∈ digits 10 n, a = 0 := hn.2
    have h₃ : ∃! d : List ℕ, overexpansion n d := by
      have h₄ : overexpansion n (digits 10 n) := by
        rw [hoverexpansion]
        constructor
        · -- Prove that n = ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1
          have h₅ : n = ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
            have h₆ : n = ∑ i in (Finset.univ : Finset (Fin (digits 10 n).length)), (digits 10 n).get i * 10 ^ (i : ℕ) := by
              rw [← ofDigits_digits 10 n]
              <;> simp [ofDigits_eq_sum_map_index, List.get_map, List.get_range, pow_succ]
              <;> rfl
            simpa [Finset.sum_const, nsmul_eq_mul] using h₆
          exact h₅
        · constructor
          · -- Prove that (digits 10 n).getLastI ≠ 0
            have h₅ : (digits 10 n).getLastI ≠ 0 := by
              by_contra h₅
              have h₆ : (digits 10 n).getLastI = 0 := by simpa using h₅
              have h₇ : n = 0 := by
                have h₈ := Nat.ofDigits_digits 10 n
                have h₉ : (digits 10 n).getLastI = 0 := h₆
                have h₁₀ : (digits 10 n) ≠ [] := by
                  by_contra h₁₀
                  simp_all [List.getLastI, List.get]
                  <;> omega
                have h₁₁ : (digits 10 n).getLastI = (digits 10 n).get ⟨(digits 10 n).length - 1, by
                  have h₁₂ := h₁₀
                  have h₁₃ : (digits 10 n).length > 0 := by
                    by_contra h₁₃
                    simp_all [List.length_eq_zero]
                  omega⟩ := by
                  simp [List.getLastI]
                  <;> rfl
                rw [h₁₁] at h₉
                have h₁₂ : (digits 10 n).get ⟨(digits 10 n).length - 1, by
                  have h₁₃ := h₁₀
                  have h₁₄ : (digits 10 n).length > 0 := by
                    by_contra h₁₄
                    simp_all [List.length_eq_zero]
                  omega⟩ = 0 := h₉
                have h₁₃ : n = 0 := by
                  have h₁₄ := Nat.ofDigits_digits 10 n
                  have h₁₅ : (digits 10 n) ≠ [] := h₁₀
                  have h₁₆ : (digits 10 n).get ⟨(digits 10 n).length - 1, by
                    have h₁₇ := h₁₀
                    have h₁₈ : (digits 10 n).length > 0 := by
                      by_contra h₁₈
                      simp_all [List.length_eq_zero]
                    omega⟩ = 0 := h₁₂
                  have h₁₇ : n = 0 := by
                    simp_all [Nat.ofDigits_eq_foldr, List.get]
                    <;> omega
                  exact h₁₇
                exact h₁₃
              omega
            exact h₅
          · -- Prove that ∀ a ∈ digits 10 n, a ∈ Finset.range 11
            intro a ha
            have h₅ : a ∈ Finset.range 11 := by
              have h₆ : a ∈ digits 10 n := ha
              have h₇ : a < 10 := by
                have h₈ : ∀ (a : ℕ), a ∈ digits 10 n → a < 10 := by
                  intro a ha
                  have h₉ : a ∈ digits 10 n := ha
                  have h₁₀ : a < 10 := by
                    have h₁₁ : ∀ (a : ℕ), a ∈ digits 10 n → a < 10 := by
                      intro a ha
                      have h₁₂ : a ∈ digits 10 n := ha
                      have h₁₃ : a < 10 := by
                        apply Nat.digits_lt_base (by norm_num : 2 ≤ 10) h₁₂
                      exact h₁₃
                    exact h₁₁ a h₉
                  exact h₁₀
                exact h₈ a h₆
              have h₈ : a < 11 := by omega
              have h₉ : a ∈ Finset.range 11 := by
                rw [Finset.mem_range]
                exact h₈
              exact h₉
            exact h₅
      have h₅ : ∀ (d' : List ℕ), overexpansion n d' → d' = digits 10 n := by
        intro d' hd'
        have h₆ : overexpansion n d' := hd'
        rw [hoverexpansion] at h₆
        have h₇ : n = ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := h₆.1
        have h₈ : d'.getLastI ≠ 0 := h₆.2.1
        have h₉ : ∀ a ∈ d', a ∈ Finset.range 11 := h₆.2.2
        have h₁₀ : d' = digits 10 n := by
          have h₁₁ : n = ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
            have h₁₂ : n = ∑ i in (Finset.univ : Finset (Fin (digits 10 n).length)), (digits 10 n).get i * 10 ^ (i : ℕ) := by
              rw [← ofDigits_digits 10 n]
              <;> simp [ofDigits_eq_sum_map_index, List.get_map, List.get_range, pow_succ]
              <;> rfl
            simpa [Finset.sum_const, nsmul_eq_mul] using h₁₂
          have h₁₃ : n = ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := h₇
          have h₁₄ : d'.getLastI ≠ 0 := h₈
          have h₁₅ : ∀ a ∈ d', a ∈ Finset.range 11 := h₉
          have h₁₆ : d' = digits 10 n := by
            -- Use the fact that the digits are unique and the sum is the same
            have h₁₇ : ∀ (a : ℕ), a ∈ d' → a < 11 := by
              intro a ha
              have h₁₈ : a ∈ Finset.range 11 := h₁₅ a ha
              rw [Finset.mem_range] at h₁₈
              exact h₁₈
            have h₁₉ : ∀ (a : ℕ), a ∈ digits 10 n → a < 10 := by
              intro a ha
              have h₂₀ : a ∈ digits 10 n := ha
              have h₂₁ : a < 10 := by
                apply Nat.digits_lt_base (by norm_num : 2 ≤ 10) h₂₀
              exact h₂₁
            -- Use the fact that the digits are unique and the sum is the same
            have h₂₀ : d' = digits 10 n := by
              by_contra h₂₀
              -- If d' ≠ digits 10 n, then we can find a contradiction
              have h₂₁ : d' ≠ digits 10 n := h₂₀
              have h₂₂ : ∃ a ∈ d', a = 10 := by
                by_contra h₂₂
                -- If no digit in d' is 10, then d' must be the same as digits 10 n
                have h₂₃ : ∀ a ∈ d', a < 10 := by
                  intro a ha
                  have h₂₄ : a ∈ Finset.range 11 := h₁₅ a ha
                  have h₂₅ : a < 11 := by
                    rw [Finset.mem_range] at h₂₄
                    exact h₂₄
                  have h₂₆ : a ≠ 10 := by
                    by_contra h₂₆
                    have h₂₇ : a = 10 := by omega
                    have h₂₈ : a ∈ d' := ha
                    have h₂₉ : a = 10 := h₂₇
                    have h₃₀ : ∃ a ∈ d', a = 10 := by
                      exact ⟨a, ha, h₂₉⟩
                    exact h₂₂ h₃₀
                  omega
                have h₃₁ : d' = digits 10 n := by
                  -- Use the fact that the digits are unique and the sum is the same
                  have h₃₂ : ∀ (a : ℕ), a ∈ d' → a < 10 := h₂₃
                  have h₃₃ : ∀ (a : ℕ), a ∈ digits 10 n → a < 10 := h₁₉
                  have h₃₄ : n = ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := h₇
                  have h₃₅ : n = ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := h₁₁
                  -- Use the fact that the digits are unique and the sum is the same
                  have h₃₆ : d' = digits 10 n := by
                    -- Use the fact that the digits are unique and the sum is the same
                    have h₃₇ : d'.length = (digits 10 n).length := by
                      by_contra h₃₇
                      have h₃₈ : d'.length ≠ (digits 10 n).length := h₃₇
                      have h₃₉ : d'.length < (digits 10 n).length ∨ (digits 10 n).length < d'.length := by
                        omega
                      cases h₃₉ with
                      | inl h₃₉ =>
                        -- Case: d'.length < (digits 10 n).length
                        have h₄₀ : d'.length < (digits 10 n).length := h₃₉
                        have h₄₁ : ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 < ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
                          -- Use the fact that the digits are unique and the sum is the same
                          have h₄₂ : ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 < ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
                            -- Use the fact that the digits are unique and the sum is the same
                            have h₄₃ : d'.length < (digits 10 n).length := h₄₀
                            have h₄₄ : ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 < ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
                              -- Use the fact that the digits are unique and the sum is the same
                              have h₄₅ : d'.length < (digits 10 n).length := h₄₀
                              have h₄₆ : ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 < ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
                                -- Use the fact that the digits are unique and the sum is the same
                                have h₄₇ : d'.length < (digits 10 n).length := h₄₀
                                have h₄₈ : ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 < ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
                                  -- Use the fact that the digits are unique and the sum is the same
                                  have h₄₉ : d'.length < (digits 10 n).length := h₄₀
                                  have h₅₀ : ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 < ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
                                    -- Use the fact that the digits are unique and the sum is the same
                                    have h₅₁ : d'.length < (digits 10 n).length := h₄₀
                                    have h₅₂ : ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 < ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
                                      -- Use the fact that the digits are unique and the sum is the same
                                      have h₅₃ : d'.length < (digits 10 n).length := h₄₀
                                      have h₅₄ : ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 < ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
                                        -- Use the fact that the digits are unique and the sum is the same
                                        have h₅₅ : d'.length < (digits 10 n).length := h₄₀
                                        have h₅₆ : ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 < ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
                                          -- Use the fact that the digits are unique and the sum is the same
                                          have h₅₇ : d'.length < (digits 10 n).length := h₄₀
                                          have h₅₈ : ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 < ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
                                            -- Use the fact that the digits are unique and the sum is the same
                                            have h₅₉ : d'.length < (digits 10 n).length := h₄₀
                                            have h₆₀ : ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 < ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
                                              -- Use the fact that the digits are unique and the sum is the same
                                              have h₆₁ : d'.length < (digits 10 n).length := h₄₀
                                              have h₆₂ : ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 < ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
                                                -- Use the fact that the digits are unique and the sum is the same
                                                have h₆₃ : d'.length < (digits 10 n).length := h₄₀
                                                have h₆₄ : ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 < ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
                                                  -- Use the fact that the digits are unique and the sum is the same
                                                  have h₆₅ : d'.length < (digits 10 n).length := h₄₀
                                                  have h₆₆ : ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 < ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
                                                    -- Use the fact that the digits are unique and the sum is the same
                                                    simp_all [Finset.sum_range_succ, Nat.div_eq_of_lt]
                                                    <;> omega
                                                  exact h₆₆
                                                exact h₆₄
                                              exact h₆₂
                                            exact h₆₀
                                          exact h₅₈
                                        exact h₅₆
                                      exact h₅₄
                                    exact h₅₂
                                  exact h₅₀
                                exact h₄₈
                              exact h₄₆
                            exact h₄₄
                          exact h₄₂
                        have h₄₅ : ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 < ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := h₄₁
                        have h₄₆ : n = ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := by
                          linarith
                        have h₄₇ : n = ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := h₁₁
                        linarith
                      | inr h₃₉ =>
                        -- Case: (digits 10 n).length < d'.length
                        have h₄₀ : (digits 10 n).length < d'.length := h₃₉
                        have h₄₁ : ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 < ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := by
                          -- Use the fact that the digits are unique and the sum is the same
                          have h₄₂ : (digits 10 n).length < d'.length := h₄₀
                          have h₄₃ : ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 < ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := by
                            -- Use the fact that the digits are unique and the sum is the same
                            have h₄₄ : (digits 10 n).length < d'.length := h₄₀
                            have h₄₅ : ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 < ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := by
                              -- Use the fact that the digits are unique and the sum is the same
                              have h₄₆ : (digits 10 n).length < d'.length := h₄₀
                              have h₄₇ : ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 < ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := by
                                -- Use the fact that the digits are unique and the sum is the same
                                have h₄₈ : (digits 10 n).length < d'.length := h₄₀
                                have h₄₉ : ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 < ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := by
                                  -- Use the fact that the digits are unique and the sum is the same
                                  have h₅₀ : (digits 10 n).length < d'.length := h₄₀
                                  have h₅₁ : ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 < ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := by
                                    -- Use the fact that the digits are unique and the sum is the same
                                    have h₅₂ : (digits 10 n).length < d'.length := h₄₀
                                    have h₅₃ : ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 < ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := by
                                      -- Use the fact that the digits are unique and the sum is the same
                                      have h₅₄ : (digits 10 n).length < d'.length := h₄₀
                                      have h₅₅ : ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 < ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := by
                                        -- Use the fact that the digits are unique and the sum is the same
                                        have h₅₆ : (digits 10 n).length < d'.length := h₄₀
                                        have h₅₇ : ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 < ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := by
                                          -- Use the fact that the digits are unique and the sum is the same
                                          simp_all [Finset.sum_range_succ, Nat.div_eq_of_lt]
                                          <;> omega
                                        exact h₅₇
                                      exact h₅₅
                                    exact h₅₃
                                  exact h₅₁
                                exact h₄₉
                              exact h₄₇
                            exact h₄₅
                          exact h₄₃
                        have h₄₈ : ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 < ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := h₄₁
                        have h₄₉ : n = ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := by
                          linarith
                        have h₅₀ : n = ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := by
                          linarith
                        linarith
                    omega
                  have h₃₈ : d'.length = (digits 10 n).length := by omega
                  have h₃₉ : d' = digits 10 n := by
                    -- Use the fact that the digits are unique and the sum is the same
                    have h₄₀ : d'.length = (digits 10 n).length := h₃₈
                    have h₄₁ : ∀ (i : Fin d'.length), d'.get i = (digits 10 n).get ⟨i, by omega⟩ := by
                      intro i
                      have h₄₂ : d'.get i < 11 := by
                        have h₄₃ : d'.get i ∈ Finset.range 11 := h₉ (d'.get i) (List.get_mem _ _ _)
                        rw [Finset.mem_range] at h₄₃
                        exact h₄₃
                      have h₄₄ : (digits 10 n).get ⟨i, by omega⟩ < 10 := by
                        have h₄₅ : (digits 10 n).get ⟨i, by omega⟩ < 10 := by
                          apply Nat.digits_lt_base (by norm_num : 2 ≤ 10)
                          apply List.get_mem
                        exact h₄₅
                      have h₄₆ : d'.get i = (digits 10 n).get ⟨i, by omega⟩ := by
                        by_contra h₄₆
                        have h₄₇ : d'.get i ≠ (digits 10 n).get ⟨i, by omega⟩ := h₄₆
                        have h₄₈ : d'.get i < 11 := h₄₂
                        have h₄₉ : (digits 10 n).get ⟨i, by omega⟩ < 10 := h₄₄
                        have h₅₀ : d'.get i = 10 := by
                          by_contra h₅₀
                          have h₅₁ : d'.get i < 10 := by
                            omega
                          have h₅₂ : d'.get i = (digits 10 n).get ⟨i, by omega⟩ := by
                            -- Use the fact that the digits are unique and the sum is the same
                            have h₅₃ : n = ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := h₇
                            have h₅₄ : n = ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := h₁₁
                            have h₅₅ : d'.length = (digits 10 n).length := h₃₈
                            have h₅₆ : ∀ (i : Fin d'.length), d'.get i = (digits 10 n).get ⟨i, by omega⟩ := by
                              intro i
                              have h₅₇ : d'.get i < 11 := by
                                have h₅₈ : d'.get i ∈ Finset.range 11 := h₉ (d'.get i) (List.get_mem _ _ _)
                                rw [Finset.mem_range] at h₅₈
                                exact h₅₈
                              have h₅₉ : (digits 10 n).get ⟨i, by omega⟩ < 10 := by
                                have h₆₀ : (digits 10 n).get ⟨i, by omega⟩ < 10 := by
                                  apply Nat.digits_lt_base (by norm_num : 2 ≤ 10)
                                  apply List.get_mem
                                exact h₆₀
                              have h₆₁ : d'.get i = (digits 10 n).get ⟨i, by omega⟩ := by
                                by_contra h₆₁
                                have h₆₂ : d'.get i ≠ (digits 10 n).get ⟨i, by omega⟩ := h₆₁
                                have h₆₃ : d'.get i < 11 := h₅₇
                                have h₆₄ : (digits 10 n).get ⟨i, by omega⟩ < 10 := h₅₉
                                have h₆₅ : d'.get i = 10 := by
                                  by_contra h₆₅
                                  have h₆₆ : d'.get i < 10 := by
                                    omega
                                  have h₆₇ : d'.get i = (digits 10 n).get ⟨i, by omega⟩ := by
                                    -- Use the fact that the digits are unique and the sum is the same
                                    have h₆₈ : n = ∑ i : Fin d'.length, (d'.get i) * 10 ^ i.1 := h₇
                                    have h₆₉ : n = ∑ i : Fin (digits 10 n).length, (digits 10 n).get i * 10 ^ i.1 := h₁₁
                                    have h₇₀ : d'.length = (digits 10 n).length := h₃₈
                                    have h₇₁ : ∀ (i : Fin d'.length), d'.get i = (digits 10 n).get ⟨i, by omega⟩ := by
                                      intro i
                                      have h₇₂ : d'.get i < 11 := by
                                        have h₇₃ : d'.get i ∈ Finset.range 11 := h₉ (d'.get i) (List.get_mem _ _ _)
                                        rw [Finset.mem_range] at h₇₃
                                        exact h₇₃
                                      have h₇₄ : (digits 10 n).get ⟨i, by omega⟩ < 10 := by
                                        have h₇₅ : (digits 10 n).get ⟨i, by omega⟩ < 10 := by
                                          apply Nat.digits_lt_base (by norm_num : 2 ≤ 10)
                                          apply List.get_mem
                                        exact h₇₅
                                      have h₇₆ : d'.get i = (digits 10 n).get ⟨i, by omega⟩ := by
                                        by_contra h₇₆
                                        have h₇₇ : d'.get i ≠ (digits 10 n).get ⟨i, by omega⟩ := h₇₆
                                        have h₇₈ : d'.get i < 11 := h₇₂
                                        have h₇₉ : (digits 10 n).get ⟨i, by omega⟩ < 10 := h₇₄
                                        omega
                                      exact h₇₆
                                    have h₈₀ : d'.get i = (digits 10 n).get ⟨i, by omega⟩ := by
                                      apply h₇₁
                                      <;> simp_all
                                    exact h₈₀
                                  omega
                                omega
                              exact h₆₁
                            exact h₅₆ i
                          omega
                        omega
                      exact h₄₆
                    have h₅₁ : d' = digits 10 n := by
                      apply List.ext_get
                      <;> simp_all [List.length_eq_zero]
                      <;> aesop
                    exact h₅₁
                  exact h₃₉
                exact h₃₆
              exact h₃₁
            have h₃₂ : d' = digits 10 n := h₃₁
            exact h₃₂
          exact h₁₀
        exact h₅
      exact ⟨digits 10 n, h₄, h₅⟩
    exact ⟨h₁, h₃⟩
  
  have h_main : S = {n : ℕ | n > 0 ∧ ¬∃ a ∈ digits 10 n, a = 0} := by
    apply Set.Subset.antisymm
    · exact h_subset₁
    · exact h_subset₂
  
  rw [h_main]
  <;> aesop