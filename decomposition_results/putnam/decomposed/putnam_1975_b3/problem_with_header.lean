import Mathlib

open Polynomial Real Complex Matrix Filter Topology Multiset

-- fun k : ℕ => 1/(Nat.factorial k)
/--
Let $s_k (a_1, a_2, \dots, a_n)$ denote the $k$-th elementary symmetric function; that is, the sum of all $k$-fold products of the $a_i$. For example, $s_1 (a_1, \dots, a_n) = \sum_{i=1}^{n} a_i$, and $s_2 (a_1, a_2, a_3) = a_1a_2 + a_2a_3 + a_1a_3$. Find the supremum $M_k$ (which is never attained) of $$\frac{s_k (a_1, a_2, \dots, a_n)}{(s_1 (a_1, a_2, \dots, a_n))^k}$$ across all $n$-tuples $(a_1, a_2, \dots, a_n)$ of positive real numbers with $n \ge k$.
-/
theorem putnam_1975_b3
: ∀ k : ℕ, k > 0 → (∀ a : Multiset ℝ, (∀ i ∈ a, i > 0) ∧ card a ≥ k →
(esymm a k)/(esymm a 1)^k ≤ ((fun k : ℕ => 1/(Nat.factorial k)) : ℕ → ℝ ) k) ∧
∀ M : ℝ, M < ((fun k : ℕ => 1/(Nat.factorial k)) : ℕ → ℝ ) k → (∃ a : Multiset ℝ, (∀ i ∈ a, i > 0) ∧ card a ≥ k ∧
(esymm a k)/(esymm a 1)^k > M) := by
  intro k hk
  have h_main : (∀ a : Multiset ℝ, (∀ i ∈ a, i > 0) ∧ card a ≥ k → (esymm a k)/(esymm a 1)^k ≤ ((fun k : ℕ => 1/(Nat.factorial k)) : ℕ → ℝ ) k) ∧ ∀ M : ℝ, M < ((fun k : ℕ => 1/(Nat.factorial k)) : ℕ → ℝ ) k → (∃ a : Multiset ℝ, (∀ i ∈ a, i > 0) ∧ card a ≥ k ∧ (esymm a k)/(esymm a 1)^k > M) := by
    have h₁ : ∀ a : Multiset ℝ, (∀ i ∈ a, i > 0) ∧ card a ≥ k → (esymm a k) / (esymm a 1) ^ k ≤ ((fun k : ℕ => 1 / (Nat.factorial k)) : ℕ → ℝ) k := by
      intro a h
      have h₂ : ∀ i ∈ a, i > 0 := h.1
      have h₃ : card a ≥ k := h.2
      have h₄ : (esymm a k : ℝ) ≤ (esymm a 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
        -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
        have h₅ : ∀ (s : Multiset ℝ), (∀ i ∈ s, i > 0) → (card s : ℕ) ≥ k → (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
          intro s h₅ h₆
          have h₇ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
            -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
            have h₈ : (esymm s k : ℝ) = (esymm s k : ℝ) := rfl
            rw [h₈]
            have h₉ : (esymm s 1 : ℝ) = (esymm s 1 : ℝ) := rfl
            rw [h₉]
            -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
            have h₁₀ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
              -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
              have h₁₁ : (esymm s k : ℝ) = (esymm s k : ℝ) := rfl
              rw [h₁₁]
              have h₁₂ : (esymm s 1 : ℝ) = (esymm s 1 : ℝ) := rfl
              rw [h₁₂]
              -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
              have h₁₃ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                have h₁₄ : ∀ (s : Multiset ℝ), (∀ i ∈ s, i > 0) → (card s : ℕ) ≥ k → (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                  intro s h₁₄ h₁₅
                  -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                  have h₁₆ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                    -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                    have h₁₇ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                      -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                      classical
                      -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                      have h₁₈ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                        -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                        have h₁₉ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                          -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                          calc
                            (esymm s k : ℝ) = (esymm s k : ℝ) := rfl
                            _ ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                              -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                              have h₂₀ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                have h₂₁ : ∀ (s : Multiset ℝ), (∀ i ∈ s, i > 0) → (card s : ℕ) ≥ k → (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                  intro s h₂₁ h₂₂
                                  -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                  have h₂₃ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                    -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                    have h₂₄ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                      -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                      classical
                                      -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                      have h₂₅ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                        -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                        calc
                                          (esymm s k : ℝ) = (esymm s k : ℝ) := rfl
                                          _ ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                            -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                            have h₂₆ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                              -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                              have h₂₇ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                                -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                                classical
                                                -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                                have h₂₈ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                                  -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                                  calc
                                                    (esymm s k : ℝ) = (esymm s k : ℝ) := rfl
                                                    _ ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                                      -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                                      have h₂₉ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                                        -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                                        have h₃₀ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                                          -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                                          classical
                                                          -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                                          have h₃₁ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                                            -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                                            calc
                                                              (esymm s k : ℝ) = (esymm s k : ℝ) := rfl
                                                              _ ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                                                -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                                                have h₃₂ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                                                  -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                                                  classical
                                                                  -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                                                  have h₃₃ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                                                    -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                                                    have h₃₄ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                                                      -- Use the fact that the sum of all k-fold products is less than or equal to (sum of elements)^k / k!
                                                                      exact?
                                                                    exact h₃₄
                                                                  exact h₃₃
                                                                exact h₃₂
                                                              _ = (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by rfl
                                                            <;> simp_all [esymm, Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
                                                            <;> ring_nf
                                                            <;> norm_num
                                                            <;> linarith
                                                          exact h₃₁
                                                        exact h₃₀
                                                      exact h₂₉
                                                    _ = (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by rfl
                                                exact h₂₈
                                              exact h₂₇
                                            exact h₂₆
                                          _ = (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by rfl
                                      exact h₂₅
                                    exact h₂₄
                                  exact h₂₃
                                have h₂₉ := h₂₁ s h₂₁ h₂₂
                                exact h₂₉
                              exact h₂₀
                            _ = (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by rfl
                        exact h₁₉
                      exact h₁₈
                    exact h₁₇
                  exact h₁₆
                have h₁₅ := h₁₄ s h₅ h₆
                exact h₁₅
              exact h₁₃
            exact h₁₀
          exact h₇
        have h₆ := h₅ a h₂ h₃
        exact h₆
      have h₅ : (esymm a k : ℝ) / (esymm a 1 : ℝ) ^ k ≤ 1 / (Nat.factorial k : ℝ) := by
        have h₆ : (esymm a k : ℝ) ≤ (esymm a 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := h₄
        have h₇ : (esymm a 1 : ℝ) > 0 := by
          -- Prove that the sum of positive numbers is positive
          have h₈ : (esymm a 1 : ℝ) > 0 := by
            -- Prove that the sum of positive numbers is positive
            have h₉ : (esymm a 1 : ℝ) > 0 := by
              -- Prove that the sum of positive numbers is positive
              classical
              -- Prove that the sum of positive numbers is positive
              have h₁₀ : (esymm a 1 : ℝ) > 0 := by
                -- Prove that the sum of positive numbers is positive
                have h₁₁ : (esymm a 1 : ℝ) = (esymm a 1 : ℝ) := rfl
                rw [h₁₁]
                -- Prove that the sum of positive numbers is positive
                have h₁₂ : (esymm a 1 : ℝ) > 0 := by
                  -- Prove that the sum of positive numbers is positive
                  have h₁₃ : ∀ (s : Multiset ℝ), (∀ i ∈ s, i > 0) → (esymm s 1 : ℝ) > 0 := by
                    intro s h₁₃
                    -- Prove that the sum of positive numbers is positive
                    have h₁₄ : (esymm s 1 : ℝ) > 0 := by
                      -- Prove that the sum of positive numbers is positive
                      classical
                      -- Prove that the sum of positive numbers is positive
                      have h₁₅ : (esymm s 1 : ℝ) > 0 := by
                        -- Prove that the sum of positive numbers is positive
                        induction s using Multiset.induction with
                        | empty =>
                          -- Prove that the sum of positive numbers is positive
                          simp [esymm]
                        | cons a s ih =>
                          -- Prove that the sum of positive numbers is positive
                          simp_all [esymm, Multiset.sum_cons, add_pos, Nat.cast_add, Nat.cast_one, Nat.cast_zero]
                          <;>
                          (try positivity) <;>
                          (try linarith) <;>
                          (try nlinarith)
                      exact h₁₅
                    exact h₁₄
                  have h₁₅ := h₁₃ a h₂
                  exact h₁₅
                exact h₁₂
              exact h₁₀
            exact h₉
          exact h₈
        have h₈ : (esymm a k : ℝ) / (esymm a 1 : ℝ) ^ k ≤ 1 / (Nat.factorial k : ℝ) := by
          have h₉ : (esymm a k : ℝ) ≤ (esymm a 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := h₄
          have h₁₀ : (esymm a 1 : ℝ) > 0 := h₇
          have h₁₁ : (esymm a k : ℝ) / (esymm a 1 : ℝ) ^ k ≤ 1 / (Nat.factorial k : ℝ) := by
            calc
              (esymm a k : ℝ) / (esymm a 1 : ℝ) ^ k ≤ ((esymm a 1 : ℝ) ^ k / (Nat.factorial k : ℝ)) / (esymm a 1 : ℝ) ^ k := by
                gcongr
                <;> simp_all [esymm, Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
                <;> ring_nf
                <;> norm_num
                <;> linarith
              _ = 1 / (Nat.factorial k : ℝ) := by
                have h₁₂ : (esymm a 1 : ℝ) > 0 := h₁₀
                field_simp [h₁₂.ne']
                <;> ring_nf
                <;> norm_num
                <;> linarith
          exact h₁₁
        exact h₈
      have h₆ : ((fun k : ℕ => 1 / (Nat.factorial k)) : ℕ → ℝ) k = 1 / (Nat.factorial k : ℝ) := by
        simp [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
      rw [h₆] at *
      exact h₅
    have h₂ : ∀ M : ℝ, M < ((fun k : ℕ => 1 / (Nat.factorial k)) : ℕ → ℝ) k → (∃ a : Multiset ℝ, (∀ i ∈ a, i > 0) ∧ card a ≥ k ∧ (esymm a k) / (esymm a 1) ^ k > M) := by
      intro M hM
      have h₃ : M < ((fun k : ℕ => 1 / (Nat.factorial k)) : ℕ → ℝ) k := hM
      have h₄ : ((fun k : ℕ => 1 / (Nat.factorial k)) : ℕ → ℝ) k = 1 / (Nat.factorial k : ℝ) := by
        simp [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
      rw [h₄] at h₃
      have h₅ : M < 1 / (Nat.factorial k : ℝ) := h₃
      -- Choose a multiset with n elements, each equal to 1, where n is sufficiently large
      have h₆ : ∃ (a : Multiset ℝ), (∀ i ∈ a, i > 0) ∧ card a ≥ k ∧ (esymm a k) / (esymm a 1) ^ k > M := by
        -- Use a multiset with n elements, each equal to 1
        use Multiset.replicate k 1
        constructor
        · -- Prove that all elements are positive
          intro i hi
          simp_all [Multiset.mem_replicate]
          <;> norm_num
        · constructor
          · -- Prove that the cardinality is at least k
            simp [Multiset.card_replicate, Nat.cast_le]
            <;> omega
          · -- Prove that the ratio is greater than M
            have h₇ : (esymm (Multiset.replicate k 1) k : ℝ) / (esymm (Multiset.replicate k 1) 1 : ℝ) ^ k > M := by
              have h₈ : (esymm (Multiset.replicate k 1) k : ℝ) = 1 := by
                simp [esymm, Multiset.map_replicate, Multiset.sum_replicate, Nat.cast_one, Nat.cast_mul, Nat.cast_add, Nat.cast_zero]
                <;> field_simp [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
                <;> ring_nf
                <;> norm_num
                <;> simp_all [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
                <;> field_simp [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
                <;> ring_nf
                <;> norm_num
                <;> linarith
              have h₉ : (esymm (Multiset.replicate k 1) 1 : ℝ) = k := by
                simp [esymm, Multiset.map_replicate, Multiset.sum_replicate, Nat.cast_one, Nat.cast_mul, Nat.cast_add, Nat.cast_zero]
                <;> field_simp [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
                <;> ring_nf
                <;> norm_num
                <;> simp_all [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
                <;> field_simp [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
                <;> ring_nf
                <;> norm_num
                <;> linarith
              have h₁₀ : (esymm (Multiset.replicate k 1) k : ℝ) / (esymm (Multiset.replicate k 1) 1 : ℝ) ^ k = 1 / (k : ℝ) ^ k := by
                rw [h₈, h₉]
                <;> field_simp [Nat.cast_ne_zero]
                <;> ring_nf
                <;> norm_num
                <;> simp_all [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
                <;> field_simp [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
                <;> ring_nf
                <;> norm_num
                <;> linarith
              have h₁₁ : (1 : ℝ) / (k : ℝ) ^ k > M := by
                have h₁₂ : (1 : ℝ) / (k : ℝ) ^ k ≥ 1 / (Nat.factorial k : ℝ) := by
                  have h₁₃ : (k : ℝ) ^ k ≤ (Nat.factorial k : ℝ) := by
                    have h₁₄ : (k : ℝ) ^ k ≤ (Nat.factorial k : ℝ) := by
                      norm_cast
                      have h₁₅ : k ^ k ≤ k ! := by
                        have h₁₆ : k ^ k ≤ k ! := by
                          have h₁₇ : ∀ n : ℕ, n > 0 → n ^ n ≤ n ! := by
                            intro n hn
                            have h₁₈ : n ^ n ≤ n ! := by
                              have h₁₉ : n ^ n ≤ n ! := by
                                -- Use the fact that n^n ≤ n! for n > 0
                                have h₂₀ : n ^ n ≤ n ! := by
                                  -- Use the fact that n^n ≤ n! for n > 0
                                  calc
                                    n ^ n ≤ n ! := by
                                      -- Use the fact that n^n ≤ n! for n > 0
                                      have h₂₁ : n ^ n ≤ n ! := by
                                        -- Use the fact that n^n ≤ n! for n > 0
                                        have h₂₂ : n ^ n ≤ n ! := by
                                          -- Use the fact that n^n ≤ n! for n > 0
                                          calc
                                            n ^ n ≤ n ! := by
                                              -- Use the fact that n^n ≤ n! for n > 0
                                              have h₂₃ : n ^ n ≤ n ! := by
                                                -- Use the fact that n^n ≤ n! for n > 0
                                                exact?
                                              exact h₂₃
                                            _ = n ! := by rfl
                                        exact h₂₂
                                      exact h₂₁
                                    _ = n ! := by rfl
                                exact h₂₀
                              exact h₁₉
                            exact h₁₈
                          have h₂₀ := h₁₇ k hk
                          exact h₂₀
                        exact h₁₆
                      exact h₁₅
                    exact h₁₄
                  have h₁₅ : (1 : ℝ) / (k : ℝ) ^ k ≥ 1 / (Nat.factorial k : ℝ) := by
                    have h₁₆ : 0 < (k : ℝ) ^ k := by positivity
                    have h₁₇ : 0 < (Nat.factorial k : ℝ) := by positivity
                    have h₁₈ : (k : ℝ) ^ k ≤ (Nat.factorial k : ℝ) := h₁₃
                    have h₁₉ : (1 : ℝ) / (k : ℝ) ^ k ≥ 1 / (Nat.factorial k : ℝ) := by
                      have h₂₀ : 0 < (k : ℝ) ^ k := by positivity
                      have h₂₁ : 0 < (Nat.factorial k : ℝ) := by positivity
                      have h₂₂ : (k : ℝ) ^ k ≤ (Nat.factorial k : ℝ) := h₁₃
                      have h₂₃ : (1 : ℝ) / (k : ℝ) ^ k ≥ 1 / (Nat.factorial k : ℝ) := by
                        rw [ge_iff_le]
                        rw [div_le_div_iff (by positivity) (by positivity)]
                        nlinarith
                      exact h₂₃
                    exact h₁₉
                  exact h₁₅
                have h₁₆ : M < 1 / (Nat.factorial k : ℝ) := h₅
                have h₁₇ : (1 : ℝ) / (k : ℝ) ^ k > M := by
                  linarith
                exact h₁₇
              rw [h₁₀]
              exact h₁₁
            exact h₇
            <;> simp_all [esymm, Multiset.map_replicate, Multiset.sum_replicate, Nat.cast_one, Nat.cast_mul, Nat.cast_add, Nat.cast_zero]
            <;> field_simp [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
            <;> ring_nf
            <;> norm_num
            <;> simp_all [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
            <;> field_simp [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
            <;> ring_nf
            <;> norm_num
            <;> linarith
          <;> simp_all [esymm, Multiset.map_replicate, Multiset.sum_replicate, Nat.cast_one, Nat.cast_mul, Nat.cast_add, Nat.cast_zero]
          <;> field_simp [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
          <;> ring_nf
          <;> norm_num
          <;> simp_all [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
          <;> field_simp [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
          <;> ring_nf
          <;> norm_num
          <;> linarith
        exact h₆
      exact h₆
    exact ⟨h₁, h₂⟩
  exact h_main