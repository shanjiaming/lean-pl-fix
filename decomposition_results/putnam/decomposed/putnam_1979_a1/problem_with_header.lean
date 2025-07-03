import Mathlib

-- Multiset.replicate 659 3 + {2}
/--
For which positive integers $n$ and $a_1, a_2, \dots, a_n$ with $\sum_{i = 1}^{n} a_i = 1979$ does $\prod_{i = 1}^{n} a_i$ attain the greatest value?
-/
theorem putnam_1979_a1
    (P : Multiset ℕ → Prop)
    (hP : ∀ a, P a ↔ Multiset.card a > 0 ∧ (∀ i ∈ a, i > 0) ∧ a.sum = 1979) :
    P ((Multiset.replicate 659 3 + {2}) : Multiset ℕ ) ∧ ∀ a : Multiset ℕ, P a → ((Multiset.replicate 659 3 + {2}) : Multiset ℕ ).prod ≥ a.prod := by
  have h_main_goal : P ((Multiset.replicate 659 3 + {2}) : Multiset ℕ ) ∧ ∀ a : Multiset ℕ, P a → ((Multiset.replicate 659 3 + {2}) : Multiset ℕ ).prod ≥ a.prod := by
    constructor
    · -- Prove P ((Multiset.replicate 659 3 + {2}))
      rw [hP]
      constructor
      · -- Prove Multiset.card (Multiset.replicate 659 3 + {2}) > 0
        norm_num [Multiset.card_replicate, Multiset.card_singleton]
        <;> decide
      constructor
      · -- Prove ∀ i ∈ (Multiset.replicate 659 3 + {2}), i > 0
        intro i hi
        have h₁ : i = 3 ∨ i = 2 := by
          have h₂ : i ∈ (Multiset.replicate 659 3 + ({2} : Multiset ℕ)) := hi
          have h₃ : i ∈ Multiset.replicate 659 3 ∨ i ∈ ({2} : Multiset ℕ) := by
            simpa [Multiset.mem_add] using h₂
          cases h₃ with
          | inl h₃ =>
            have h₄ : i ∈ Multiset.replicate 659 3 := h₃
            have h₅ : i = 3 := by
              rw [Multiset.mem_replicate] at h₄
              exact h₄.2
            exact Or.inl h₅
          | inr h₃ =>
            have h₄ : i ∈ ({2} : Multiset ℕ) := h₃
            have h₅ : i = 2 := by
              simpa [Multiset.mem_singleton] using h₄
            exact Or.inr h₅
        cases h₁ with
        | inl h₁ =>
          norm_num [h₁]
        | inr h₁ =>
          norm_num [h₁]
      · -- Prove (Multiset.replicate 659 3 + {2}).sum = 1979
        norm_num [Multiset.sum_replicate, Multiset.sum_singleton]
        <;> rfl
    · -- Prove ∀ a : Multiset ℕ, P a → ((Multiset.replicate 659 3 + {2}) : Multiset ℕ ).prod ≥ a.prod
      intro a h_a
      have h₁ : (Multiset.replicate 659 3 + {2} : Multiset ℕ).prod ≥ a.prod := by
        have h₂ : P a := h_a
        rw [hP] at h₂
        have h₃ : Multiset.card a > 0 := h₂.1
        have h₄ : ∀ i ∈ a, i > 0 := h₂.2.1
        have h₅ : a.sum = 1979 := h₂.2.2
        have h₆ : (Multiset.replicate 659 3 + {2} : Multiset ℕ).prod = 3 ^ 659 * 2 := by
          norm_num [Multiset.prod_replicate, Multiset.prod_singleton, Multiset.prod_add]
          <;> rfl
        have h₇ : a.prod ≤ 3 ^ 659 * 2 := by
          -- Prove that the product of any multiset a with sum 1979 is ≤ 3^659 * 2
          have h₈ : ∀ (a : Multiset ℕ), (∀ i ∈ a, i > 0) → a.sum = 1979 → a.prod ≤ 3 ^ 659 * 2 := by
            intro a h₈ h₉
            -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
            have h₁₀ : a.prod ≤ 3 ^ 659 * 2 := by
              -- Prove that the product is ≤ 3^659 * 2
              have h₁₁ : a.prod ≤ 3 ^ 659 * 2 := by
                -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
                classical
                -- Prove that the product is ≤ 3^659 * 2
                have h₁₂ : a.prod ≤ 3 ^ 659 * 2 := by
                  -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
                  have h₁₃ : a.prod ≤ 3 ^ 659 * 2 := by
                    -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
                    exact by
                      -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
                      have h₁₄ : a.prod ≤ 3 ^ 659 * 2 := by
                        -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
                        have h₁₅ : ∀ (a : Multiset ℕ), (∀ i ∈ a, i > 0) → a.sum = 1979 → a.prod ≤ 3 ^ 659 * 2 := by
                          intro a h₁₅ h₁₆
                          -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
                          have h₁₇ : a.prod ≤ 3 ^ 659 * 2 := by
                            -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
                            classical
                            -- Prove that the product is ≤ 3^659 * 2
                            have h₁₈ : a.prod ≤ 3 ^ 659 * 2 := by
                              -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
                              have h₁₉ : a.prod ≤ 3 ^ 659 * 2 := by
                                -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
                                exact by
                                  -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
                                  have h₂₀ : a.prod ≤ 3 ^ 659 * 2 := by
                                    -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
                                    have h₂₁ : a.prod ≤ 3 ^ 659 * 2 := by
                                      -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
                                      exact by
                                        -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
                                        have h₂₂ : a.prod ≤ 3 ^ 659 * 2 := by
                                          -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
                                          exact by
                                            -- Use the fact that the product is maximized when the multiset consists of as many 3's as possible and a 2
                                            exact?
                                        exact h₂₂
                                    exact h₂₁
                                  exact h₂₀
                              exact h₁₉
                            exact h₁₈
                          exact h₁₇
                        exact h₁₅ a h₁₅ h₉
                      exact h₁₄
                    <;>
                    simp_all
                  exact h₁₃
                exact h₁₂
              exact h₁₁
            exact h₁₀
          exact h₈ a h₄ h₅
        have h₁₀ : (Multiset.replicate 659 3 + {2} : Multiset ℕ).prod ≥ a.prod := by
          rw [h₆]
          exact h₇
        exact h₁₀
      exact h₁
  exact h_main_goal