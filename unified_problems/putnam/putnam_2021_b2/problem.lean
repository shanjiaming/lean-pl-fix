theorem putnam_2021_b2 :
    IsGreatest
      {S | ∃ a : ℕ+ → ℝ, (∑' k, a k = 1) ∧ (∀ k, 0 ≤ a k) ∧
        S = ∑' n : ℕ+, n / 2 ^ (n : ℕ) * (∏ k in Finset.Icc 1 n, a k) ^ (1 / n : ℝ)}
      ((2 / 3) : ℝ ) := by
  have h₁ : (2 / 3 : ℝ) ∈ {S | ∃ a : ℕ+ → ℝ, (∑' k, a k = 1) ∧ (∀ k, 0 ≤ a k) ∧ S = ∑' n : ℕ+, n / 2 ^ (n : ℕ) * (∏ k in Finset.Icc 1 n, a k) ^ (1 / n : ℝ)} := by
    use fun k => if k = 1 then 2 / 3 else if k = 2 then 1 / 3 else 0
    constructor
    · -- Prove that the sum of the sequence is 1
      calc
        (∑' k : ℕ+, (if k = 1 then (2 / 3 : ℝ) else if k = 2 then 1 / 3 else 0)) = (∑' k : ℕ+, (if k = 1 then (2 / 3 : ℝ) else if k = 2 then 1 / 3 else 0)) := rfl
        _ = (2 / 3 : ℝ) + (1 / 3 : ℝ) := by
          -- Calculate the sum of the sequence
          rw [tsum_eq_single 1]
          · -- Case when k = 1
            simp
            <;> norm_num
          · -- Case when k ≠ 1
            intro k hk
            rw [tsum_eq_single 2]
            · -- Case when k = 2
              by_cases h : k = 2
              · -- Subcase when k = 2
                simp_all [h]
                <;> norm_num
              · -- Subcase when k ≠ 2
                simp_all [h]
                <;> norm_num
                <;>
                (try
                  {
                    aesop
                  })
                <;>
                (try
                  {
                    intro h
                    aesop
                  })
            · -- Case when k ≠ 2
              intro h
              simp_all
              <;> norm_num
              <;> aesop
          <;>
          aesop
        _ = 1 := by norm_num
    · constructor
      · -- Prove that all terms are non-negative
        intro k
        split_ifs <;> norm_num <;>
        (try aesop) <;>
        (try norm_num) <;>
        (try
          {
            rcases k with ⟨_ | _ | k⟩ <;> simp_all [PNat.mk_eq_zero]
            <;> norm_num
            <;> aesop
          })
      · -- Prove that S = ∑' n : ℕ+, n / 2 ^ (n : ℕ) * (∏ k in Finset.Icc 1 n, a k) ^ (1 / n : ℝ)
        have h₂ : (∑' n : ℕ+, ((n : ℝ) / 2 ^ (n : ℕ) * (∏ k in Finset.Icc 1 n, (if k = 1 then (2 / 3 : ℝ) else if k = 2 then 1 / 3 else 0)) ^ (1 / (n : ℝ)))) = (2 / 3 : ℝ) := by
          -- Calculate the sum S
          have h₃ : ∀ (n : ℕ+), ((n : ℝ) / 2 ^ (n : ℕ) * (∏ k in Finset.Icc 1 n, (if k = 1 then (2 / 3 : ℝ) else if k = 2 then 1 / 3 else 0)) ^ (1 / (n : ℝ))) = (if n = 1 then (2 / 3 : ℝ) / 2 else 0 : ℝ) := by
            intro n
            rcases n with ⟨n, hn⟩
            rcases n with (_ | _ | _ | _ | n)
            all_goals
              simp_all [Finset.prod_Icc_succ_top, Nat.div_eq_of_lt, Nat.lt_succ_self, Nat.succ_div, Nat.lt_succ_self,
                Nat.succ_pos, Nat.zero_lt_succ, PNat.mk_eq_zero, Nat.div_eq_of_lt, Nat.lt_succ_self, Nat.succ_div,
                Nat.lt_succ_self, Nat.succ_pos, Nat.zero_lt_succ, PNat.mk_eq_zero, Nat.div_eq_of_lt,
                Nat.lt_succ_self, Nat.succ_div, Nat.lt_succ_self, Nat.succ_pos, Nat.zero_lt_succ]
              <;>
              norm_num [Real.div_eq_mul_inv, mul_assoc] at *
              <;>
              ring_nf at *
              <;>
              field_simp at *
              <;>
              norm_num at *
              <;>
              simp_all [Finset.prod_Icc_succ_top, Nat.div_eq_of_lt, Nat.lt_succ_self, Nat.succ_div, Nat.lt_succ_self,
                Nat.succ_pos, Nat.zero_lt_succ, PNat.mk_eq_zero, Nat.div_eq_of_lt, Nat.lt_succ_self, Nat.succ_div,
                Nat.lt_succ_self, Nat.succ_pos, Nat.zero_lt_succ, PNat.mk_eq_zero, Nat.div_eq_of_lt,
                Nat.lt_succ_self, Nat.succ_div, Nat.lt_succ_self, Nat.succ_pos, Nat.zero_lt_succ]
              <;>
              norm_num [Real.div_eq_mul_inv, mul_assoc] at *
              <;>
              ring_nf at *
              <;>
              field_simp at *
              <;>
              norm_num at *
              <;>
              aesop
          calc
            (∑' n : ℕ+, ((n : ℝ) / 2 ^ (n : ℕ) * (∏ k in Finset.Icc 1 n, (if k = 1 then (2 / 3 : ℝ) else if k = 2 then 1 / 3 else 0)) ^ (1 / (n : ℝ)))) =
                ∑' n : ℕ+, (if n = 1 then (2 / 3 : ℝ) / 2 else 0 : ℝ) := by
              simpa using tsum_congr (fun n => by rw [h₃ n])
            _ = (2 / 3 : ℝ) / 2 := by
              calc
                (∑' n : ℕ+, (if n = 1 then (2 / 3 : ℝ) / 2 else 0 : ℝ)) = ∑' n : ℕ+, (if n = 1 then (2 / 3 : ℝ) / 2 else 0 : ℝ) := rfl
                _ = (∑' n : ℕ+, if n = 1 then (2 / 3 : ℝ) / 2 else 0 : ℝ) := rfl
                _ = (2 / 3 : ℝ) / 2 := by
                  -- Prove that the second sum is (2 / 3 : ℝ) / 2
                  rw [tsum_eq_single 1]
                  <;> simp
                  <;> norm_num
                  <;> intro n hn
                  <;> rw [tsum_eq_single n]
                  <;> simp_all [PNat.mk_eq_zero]
                  <;> norm_num
                  <;> aesop
            _ = (2 / 3 : ℝ) / 2 := by rfl
            _ = (2 / 3 : ℝ) / 2 := by rfl
            _ = (2 / 3 : ℝ) := by norm_num
        rw [h₂]
        <;> norm_num
  have h₂ : ∀ (S : ℝ), S ∈ {S | ∃ a : ℕ+ → ℝ, (∑' k, a k = 1) ∧ (∀ k, 0 ≤ a k) ∧ S = ∑' n : ℕ+, n / 2 ^ (n : ℕ) * (∏ k in Finset.Icc 1 n, a k) ^ (1 / n : ℝ)} → S ≤ (2 / 3 : ℝ) := by
    intro S hS
    rcases hS with ⟨a, ha₁, ha₂, rfl⟩
    -- We need to show that the sum is less than or equal to 2/3
    have h₃ : ∑' n : ℕ+, (n : ℝ) / 2 ^ (n : ℕ) * (∏ k in Finset.Icc 1 n, a k) ^ (1 / (n : ℝ)) ≤ (2 / 3 : ℝ) := by
      have h₄ : ∀ (n : ℕ+), (n : ℝ) / 2 ^ (n : ℕ) * (∏ k in Finset.Icc 1 n, a k) ^ (1 / (n : ℝ)) ≤ (n : ℝ) / 2 ^ (n : ℕ) * 1 := by
        intro n
        have h₅ : 0 ≤ (n : ℝ) / 2 ^ (n : ℕ) := by positivity
        have h₆ : (∏ k in Finset.Icc 1 n, a k) ^ (1 / (n : ℝ)) ≤ 1 := by
          have h₇ : (∏ k in Finset.Icc 1 n, a k) ≤ 1 := by
            have h₈ : ∏ k in Finset.Icc 1 n, a k ≤ ∏ k in Finset.Icc 1 n, 1 := by
              apply Finset.prod_le_prod
              · intro i _
                exact ha₂ i
              · intro i _
                have h₉ : a i ≤ 1 := by
                  have h₁₀ : ∑' k : ℕ+, a k = 1 := ha₁
                  have h₁₁ : a i ≤ ∑' k : ℕ+, a k := by
                    exact le_tsum (by aesop) (by aesop)
                  linarith
                linarith
            simp at h₈ ⊢
            <;> simp_all
          have h₉ : 0 ≤ ∏ k in Finset.Icc 1 n, a k := by
            apply Finset.prod_nonneg
            intro i _
            exact ha₂ i
          have h₁₀ : (∏ k in Finset.Icc 1 n, a k) ^ (1 / (n : ℝ)) ≤ 1 := by
            by_cases h : ∏ k in Finset.Icc 1 n, a k = 0
            · -- If the product is zero
              have h₁₁ : (∏ k in Finset.Icc 1 n, a k) ^ (1 / (n : ℝ)) = 0 := by
                rw [h]
                simp [Real.zero_rpow]
                <;>
                aesop
              rw [h₁₁]
              <;>
              norm_num
            · -- If the product is not zero
              have h₁₁ : 0 < ∏ k in Finset.Icc 1 n, a k := by
                by_contra h₁₁
                have h₁₂ : ∏ k in Finset.Icc 1 n, a k = 0 := by
                  by_contra h₁₂
                  have h₁₃ : 0 < ∏ k in Finset.Icc 1 n, a k := by
                    apply lt_of_le_of_ne
                    · exact le_of_not_gt (fun h₁₄ => by linarith)
                    · intro h₁₄
                      aesop
                  aesop
                aesop
              have h₁₂ : (∏ k in Finset.Icc 1 n, a k) ^ (1 / (n : ℝ)) ≤ 1 := by
                have h₁₃ : 0 < (n : ℝ) := by positivity
                have h₁₄ : (∏ k in Finset.Icc 1 n, a k) ≤ 1 := by
                  linarith
                have h₁₅ : (∏ k in Finset.Icc 1 n, a k) ^ (1 / (n : ℝ)) ≤ 1 := by
                  calc
                    (∏ k in Finset.Icc 1 n, a k) ^ (1 / (n : ℝ)) ≤ 1 ^ (1 / (n : ℝ)) := by
                      gcongr
                      <;>
                      aesop
                    _ = 1 := by
                      simp [Real.one_rpow]
                linarith
              linarith
          linarith
        calc
          (n : ℝ) / 2 ^ (n : ℕ) * (∏ k in Finset.Icc 1 n, a k) ^ (1 / (n : ℝ)) ≤ (n : ℝ) / 2 ^ (n : ℕ) * 1 := by
            gcongr
          _ = (n : ℝ) / 2 ^ (n : ℕ) * 1 := by simp
      have h₅ : ∑' n : ℕ+, (n : ℝ) / 2 ^ (n : ℕ) * (∏ k in Finset.Icc 1 n, a k) ^ (1 / (n : ℝ)) ≤ ∑' n : ℕ+, (n : ℝ) / 2 ^ (n : ℕ) * 1 := by
        apply tsum_le_tsum _ (by
          apply Summable.mul_left
          -- We need to show that the series ∑' n : ℕ+, (n : ℝ) / 2 ^ (n : ℕ) is summable.
          -- This can be done using the comparison test with a geometric series.
          apply Summable.comp_injective _ (fun a b h => by simpa using h)
          -- We use the fact that ∑' n : ℕ, (n : ℝ) / 2 ^ n is summable.
          <;>
            simp_all [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_ofNat]
          <;>
            norm_num
          <;>
            apply summable_geometric_two) (by
          apply Summable.mul_left
          -- We need to show that the series ∑' n : ℕ+, (n : ℝ) / 2 ^ (n : ℕ) is summable.
          -- This can be done using the comparison test with a geometric series.
          apply Summable.comp_injective _ (fun a b h => by simpa using h)
          -- We use the fact that ∑' n : ℕ, (n : ℝ) / 2 ^ n is summable.
          <;>
            simp_all [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_ofNat]
          <;>
            norm_num
          <;>
            apply summable_geometric_two)
        intro n
        exact h₄ n
      have h₆ : ∑' n : ℕ+, (n : ℝ) / 2 ^ (n : ℕ) * 1 ≤ (2 / 3 : ℝ) := by
        -- Prove that the sum of n/2^n for all positive integers n is 2/3
        have h₇ : ∑' n : ℕ+, (n : ℝ) / 2 ^ (n : ℕ) * 1 = ∑' n : ℕ+, (n : ℝ) / 2 ^ (n : ℕ) := by simp
        rw [h₇]
        -- Use the formula for the sum of the series
        have h₈ : ∑' n : ℕ+, (n : ℝ) / 2 ^ (n : ℕ) = 2 := by
          -- Prove that the sum is 2
          have h₉ : ∑' n : ℕ, (n : ℝ) / 2 ^ n = 2 := by
            -- Use the formula for the sum of the series
            have h₁₀ : ∑' n : ℕ, (n : ℝ) / 2 ^ n = 2 := by
              -- Prove that the sum is 2
              have h₁₁ : ∑' n : ℕ, (n : ℝ) / 2 ^ n = ∑' n : ℕ, (n : ℝ) * (1 / 2 : ℝ) ^ n := by
                congr with n
                <;> field_simp [pow_ne_zero]
                <;> ring_nf
              rw [h₁₁]
              -- Use the formula for the sum of the series
              have h₁₂ : ∑' n : ℕ, (n : ℝ) * (1 / 2 : ℝ) ^ n = 2 := by
                -- Prove that the sum is 2
                rw [tsum_coe_mul_geometric_of_norm_lt_one] <;> norm_num
              rw [h₁₂]
            exact h₁₀
          -- Transfer the sum to the positive integers
          have h₁₀ : ∑' n : ℕ+, (n : ℝ) / 2 ^ (n : ℕ) = ∑' n : ℕ, (n : ℝ) / 2 ^ n := by
            -- Prove that the sums are equal
            rw [← Equiv.tsum_eq Nat.castAddMonoidHom.toAddEquiv.symm]
            <;> simp [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_ofNat]
            <;> congr 1 <;> ext n <;> simp [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_ofNat]
          rw [h₁₀]
          -- Use the formula for the sum of the series
          exact h₉
        rw [h₈]
        -- Prove the final result
        <;> norm_num
      -- Combine the results to get the final bound
      linarith
    exact h₃
  exact ⟨h₁, h₂⟩