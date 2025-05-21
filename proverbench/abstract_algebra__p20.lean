theorem leading_coefficient_divisibility (h_div : ∀ x : ℤ, m ∣ P.eval x) :
m ∣ Nat.factorial (P.natDegree) * P.leadingCoeff := by
  have h_main : m ∣ Nat.factorial (P.natDegree) * P.leadingCoeff := by
    by_cases hP : P = 0
    · -- Case: P = 0
      subst_vars
      simp
    · -- Case: P ≠ 0
      -- Compute the finite differences to find that the leading coefficient multiplied by the factorial of the degree is divisible by m.
      have h₁ : m ∣ (Nat.factorial P.natDegree : ℤ) * P.leadingCoeff := by
        have h₂ : ∀ x : ℤ, m ∣ P.eval x := h_div
        have h₃ : P ≠ 0 := hP
        -- Use the fact that P is divisible by m at all integer points to show that the leading coefficient times the factorial of the degree is divisible by m.
        have h₄ : (m : ℤ) ∣ (Nat.factorial P.natDegree : ℤ) * P.leadingCoeff := by
          -- Use the finite difference operator to derive the required divisibility.
          have h₅ : (m : ℤ) ∣ (∑ i in Finset.range (P.natDegree + 1), (-1 : ℤ) ^ (P.natDegree - i) * (Nat.choose P.natDegree i : ℤ) * P.eval (i : ℤ)) := by
            -- Prove that the sum is divisible by m.
            have h₆ : ∀ i : ℕ, i ∈ Finset.range (P.natDegree + 1) → (m : ℤ) ∣ (-1 : ℤ) ^ (P.natDegree - i) * (Nat.choose P.natDegree i : ℤ) * P.eval (i : ℤ) := by
              intro i hi
              have h₇ : (m : ℤ) ∣ P.eval (i : ℤ) := h₂ (i : ℤ)
              have h₈ : (m : ℤ) ∣ (-1 : ℤ) ^ (P.natDegree - i) * (Nat.choose P.natDegree i : ℤ) * P.eval (i : ℤ) := by
                -- Use the fact that m divides P.eval (i : ℤ) to show that it divides the product.
                exact dvd_mul_of_dvd_right h₇ _
              exact h₈
            -- Sum the divisibility over all i.
            exact Finset.dvd_sum h₆
          -- Relate the sum to the leading coefficient times the factorial of the degree.
          have h₇ : (∑ i in Finset.range (P.natDegree + 1), (-1 : ℤ) ^ (P.natDegree - i) * (Nat.choose P.natDegree i : ℤ) * P.eval (i : ℤ)) = (Nat.factorial P.natDegree : ℤ) * P.leadingCoeff := by
            -- Prove that the sum is equal to the leading coefficient times the factorial of the degree.
            have h₈ := Polynomial.sum_range_succ' (fun i => (Polynomial.C ((-1 : ℤ) ^ (P.natDegree - i) * (Nat.choose P.natDegree i : ℤ)) * Polynomial.X ^ i)) P.natDegree
            have h₉ := Polynomial.sum_range_succ' (fun i => (Polynomial.C ((-1 : ℤ) ^ (P.natDegree - i) * (Nat.choose P.natDegree i : ℤ)) * Polynomial.X ^ i)) (P.natDegree + 1)
            have h₁₀ := Polynomial.eval₂_eq_sum_range (sum_range_succ' (fun i => (Polynomial.C ((-1 : ℤ) ^ (P.natDegree - i) * (Nat.choose P.natDegree i : ℤ)) * Polynomial.X ^ i)) P.natDegree)
            have h₁₁ := Polynomial.eval₂_eq_sum_range (sum_range_succ' (fun i => (Polynomial.C ((-1 : ℤ) ^ (P.natDegree - i) * (Nat.choose P.natDegree i : ℤ)) * Polynomial.X ^ i)) (P.natDegree + 1))
            simp_all [Polynomial.eval₂_add, Polynomial.eval₂_mul, Polynomial.eval₂_pow, Polynomial.eval₂_C, Polynomial.eval₂_X,
              Polynomial.eval_mul, Polynomial.eval_add, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X]
            <;> ring_nf at *
            <;> field_simp at *
            <;> norm_cast at *
            <;> simp_all [Finset.sum_range_succ, Nat.choose_succ_succ, Nat.factorial_succ, Nat.mul_succ]
            <;> ring_nf at *
            <;> norm_cast at *
            <;> linarith
          rw [h₇] at h₅
          exact h₅
        exact_mod_cast h₄
      exact_mod_cast h₁
  exact h_main