theorem putnam_1983_a3
(p : ℕ)
(F : ℕ → ℕ)
(poddprime : Odd p ∧ p.Prime)
(hF : ∀ n : ℕ, F n = ∑ i in Finset.range (p - 1), (i + 1) * n ^ i)
: ∀ a ∈ Finset.Icc 1 p, ∀ b ∈ Finset.Icc 1 p, a ≠ b → ¬(F a ≡ F b [MOD p]) := by
  have hp : p.Prime := poddprime.2
  have hp_ne_one : p ≠ 1 := Nat.Prime.ne_one hp
  have hp_gt_one : 1 < p := Nat.Prime.one_lt hp
  have hp_odd : p % 2 = 1 := by
    have h := poddprime.1
    cases' h with k hk
    have h₁ := Nat.Prime.eq_two_or_odd hp
    cases' h₁ with h₁ h₁
    · exfalso
      omega
    · omega

  have hF₁ : F 1 = (p - 1) * p / 2 := by
    have h₁ : F 1 = ∑ i in Finset.range (p - 1), (i + 1) * 1 ^ i := by
      rw [hF]
    rw [h₁]
    have h₂ : ∑ i in Finset.range (p - 1), (i + 1) * 1 ^ i = ∑ i in Finset.range (p - 1), (i + 1 : ℕ) := by
      apply Finset.sum_congr rfl
      intro i _
      simp [pow_one]
    rw [h₂]
    have h₃ : ∑ i in Finset.range (p - 1), (i + 1 : ℕ) = (∑ i in Finset.range (p - 1), (i + 1 : ℕ)) := rfl
    rw [h₃]
    have h₄ : ∑ i in Finset.range (p - 1), (i + 1 : ℕ) = ∑ k in Finset.range (p - 1), (k + 1 : ℕ) := rfl
    rw [h₄]
    have h₅ : ∑ k in Finset.range (p - 1), (k + 1 : ℕ) = (∑ k in Finset.range (p - 1), (k + 1 : ℕ)) := rfl
    rw [h₅]
    have h₆ : ∑ k in Finset.range (p - 1), (k + 1 : ℕ) = (p - 1) * p / 2 := by
      have h₇ : ∑ k in Finset.range (p - 1), (k + 1 : ℕ) = ∑ k in Finset.range (p - 1), (k + 1 : ℕ) := rfl
      rw [h₇]
      have h₈ : p - 1 ≥ 1 := by
        have h₉ : p ≥ 2 := by omega
        omega
      have h₉ : ∑ k in Finset.range (p - 1), (k + 1 : ℕ) = (∑ k in Finset.range (p - 1), (k + 1 : ℕ)) := rfl
      rw [h₉]
      have h₁₀ : ∑ k in Finset.range (p - 1), (k + 1 : ℕ) = (p - 1) * p / 2 := by
        have h₁₁ : ∀ n : ℕ, n ≥ 1 → ∑ k in Finset.range n, (k + 1 : ℕ) = n * (n + 1) / 2 := by
          intro n hn
          have h₁₂ : ∑ k in Finset.range n, (k + 1 : ℕ) = ∑ k in Finset.range n, (k + 1 : ℕ) := rfl
          rw [h₁₂]
          have h₁₃ : ∑ k in Finset.range n, (k + 1 : ℕ) = n * (n + 1) / 2 := by
            classical
            have h₁₄ : ∑ k in Finset.range n, (k + 1 : ℕ) = ∑ k in Finset.range n, (k + 1 : ℕ) := rfl
            rw [h₁₄]
            -- Use induction on n to prove the formula for the sum of the first n natural numbers
            have h₁₅ : ∀ n : ℕ, n ≥ 1 → ∑ k in Finset.range n, (k + 1 : ℕ) = n * (n + 1) / 2 := by
              intro n hn
              induction' hn with n hn IH
              · simp
              · cases n with
                | zero =>
                  simp at hn
                | succ n =>
                  simp_all [Finset.sum_range_succ, Nat.succ_eq_add_one, Nat.mul_succ, Nat.div_eq_of_lt]
                  <;> ring_nf at *
                  <;> omega
            exact h₁₅ n hn
          exact h₁₃
        have h₁₂ : p - 1 ≥ 1 := by omega
        have h₁₃ : ∑ k in Finset.range (p - 1), (k + 1 : ℕ) = (p - 1) * ((p - 1) + 1) / 2 := by
          apply h₁₁
          omega
        rw [h₁₃]
        have h₁₄ : (p - 1) * ((p - 1) + 1) / 2 = (p - 1) * p / 2 := by
          have h₁₅ : p ≥ 2 := by omega
          have h₁₆ : (p - 1) + 1 = p := by
            have h₁₇ : p ≥ 2 := by omega
            omega
          rw [h₁₆]
          <;>
          (try omega) <;>
          (try ring_nf) <;>
          (try omega)
        rw [h₁₄]
      rw [h₁₀]
    rw [h₆]
    <;>
    (try omega) <;>
    (try ring_nf) <;>
    (try omega)

  have hFp : F p ≡ 1 [MOD p] := by
    have h₁ : F p = ∑ i in Finset.range (p - 1), (i + 1) * p ^ i := by rw [hF]
    rw [h₁]
    have h₂ : ∑ i in Finset.range (p - 1), (i + 1) * p ^ i ≡ 1 [MOD p] := by
      have h₃ : ∀ (i : ℕ), i ∈ Finset.range (p - 1) → ((i + 1 : ℕ) * p ^ i : ℕ) % p = if i = 0 then 1 else 0 := by
        intro i hi
        have h₄ : i < p - 1 := Finset.mem_range.mp hi
        have h₅ : i ≤ p - 1 := by omega
        have h₆ : p - 1 < p := by omega
        by_cases h₇ : i = 0
        · -- Case i = 0
          simp_all [h₇, Nat.pow_zero, Nat.mul_one, Nat.mod_eq_of_lt]
          <;>
          (try omega)
          <;>
          (try ring_nf at *)
          <;>
          (try omega)
        · -- Case i ≠ 0
          have h₈ : i > 0 := by
            by_contra h
            have h₉ : i = 0 := by omega
            contradiction
          have h₉ : p ^ i ≠ 0 := by positivity
          have h₁₀ : ((i + 1 : ℕ) * p ^ i : ℕ) % p = 0 := by
            have h₁₁ : p ∣ (i + 1 : ℕ) * p ^ i := by
              have h₁₂ : p ∣ p ^ i := by
                exact dvd_pow_self _ (by omega)
              have h₁₃ : p ∣ (i + 1 : ℕ) * p ^ i := by
                exact dvd_mul_of_dvd_right h₁₂ _
              exact h₁₃
            have h₁₄ : ((i + 1 : ℕ) * p ^ i : ℕ) % p = 0 := by
              exact Nat.mod_eq_zero_of_dvd h₁₁
            exact h₁₄
          simp_all
          <;>
          (try omega)
          <;>
          (try ring_nf at *)
          <;>
          (try omega)
      -- Use the above result to simplify the sum modulo p
      have h₄ : (∑ i in Finset.range (p - 1), (i + 1) * p ^ i : ℕ) % p = 1 := by
        calc
          (∑ i in Finset.range (p - 1), (i + 1) * p ^ i : ℕ) % p = (∑ i in Finset.range (p - 1), ((i + 1) * p ^ i : ℕ) % p) % p := by
            simp [Finset.sum_nat_mod, Nat.add_mod, Nat.mul_mod, Nat.pow_mod]
          _ = (∑ i in Finset.range (p - 1), if i = 0 then 1 else 0 : ℕ) % p := by
            apply congr_arg (· % p)
            apply Finset.sum_congr rfl
            intro i hi
            rw [h₃ i hi]
          _ = 1 := by
            have h₅ : (∑ i in Finset.range (p - 1), if i = 0 then 1 else 0 : ℕ) = 1 := by
              have h₆ : p - 1 > 0 := by omega
              have h₇ : (∑ i in Finset.range (p - 1), if i = 0 then 1 else 0 : ℕ) = 1 := by
                -- We need to show that the sum of the if-then-else expressions is 1.
                -- This is true because only the first term (i = 0) is 1, and all other terms are 0.
                -- Since p - 1 > 0, the sum is 1.
                calc
                  (∑ i in Finset.range (p - 1), if i = 0 then 1 else 0 : ℕ) = ∑ i in Finset.range (p - 1), if i = 0 then 1 else 0 := rfl
                  _ = 1 := by
                    -- We need to show that the sum of the if-then-else expressions is 1.
                    -- This is true because only the first term (i = 0) is 1, and all other terms are 0.
                    -- Since p - 1 > 0, the sum is 1.
                    have h₈ : p - 1 > 0 := by omega
                    have h₉ : (∑ i in Finset.range (p - 1), if i = 0 then 1 else 0 : ℕ) = 1 := by
                      cases p with
                      | zero => omega
                      | succ p =>
                        cases p with
                        | zero => omega
                        | succ p =>
                          simp [Finset.sum_range_succ, Finset.sum_range_zero, Nat.succ_eq_add_one]
                          <;>
                          (try omega) <;>
                          (try decide) <;>
                          (try ring_nf) <;>
                          (try omega)
                    exact h₉
              exact h₇
            have h₈ : (∑ i in Finset.range (p - 1), if i = 0 then 1 else 0 : ℕ) % p = 1 := by
              rw [h₅]
              have h₉ : 1 % p = 1 := by
                have h₁₀ : 1 < p := by omega
                have h₁₁ : 1 % p = 1 := Nat.mod_eq_of_lt (by omega)
                exact h₁₁
              omega
            omega
          _ = 1 := by rfl
      have h₅ : (∑ i in Finset.range (p - 1), (i + 1) * p ^ i : ℕ) % p = 1 := h₄
      have h₆ : (∑ i in Finset.range (p - 1), (i + 1) * p ^ i : ℕ) ≡ 1 [MOD p] := by
        rw [Nat.ModEq]
        exact h₅
      exact h₆
    exact h₂

  have hF_a_2 (a : ℕ) (ha : a ∈ Finset.Icc 2 (p - 1)) : (a : ℕ) ≠ 1 ∧ a < p := by
    have h₁ : a ∈ Finset.Icc 2 (p - 1) := ha
    have h₂ : 2 ≤ a ∧ a ≤ p - 1 := by simpa using Finset.mem_Icc.mp h₁
    have h₃ : a ≠ 1 := by
      by_contra h
      have h₄ : a = 1 := by omega
      omega
    have h₄ : a < p := by
      have h₅ : a ≤ p - 1 := h₂.2
      have h₆ : p - 1 < p := Nat.sub_lt (by omega) (by omega)
      omega
    exact ⟨h₃, h₄⟩

  have hF_a_mod (a : ℕ) (ha : a ∈ Finset.Icc 2 (p - 1)) : F a ≡ (1 : ℕ) * (Nat.modPred (a) p) [MOD p] := by
    have h₁ : a ∈ Finset.Icc 2 (p - 1) := ha
    have h₂ : 2 ≤ a ∧ a ≤ p - 1 := by simpa using Finset.mem_Icc.mp h₁
    have h₃ : a < p := by
      have h₄ : a ≤ p - 1 := h₂.2
      have h₅ : p - 1 < p := Nat.sub_lt (by omega) (by omega)
      omega
    have h₄ : F a = ∑ i in Finset.range (p - 1), (i + 1) * a ^ i := by rw [hF]
    rw [h₄]
    have h₅ : p.Prime := hp
    have h₆ : p ≠ 0 := by
      have h₇ : 1 < p := Nat.Prime.one_lt hp
      omega
    have h₇ : ∑ i in Finset.range (p - 1), (i + 1) * a ^ i ≡ (1 : ℕ) * (Nat.modPred a p) [MOD p] := by
      have h₈ : a ≥ 1 := by omega
      have h₉ : a ≤ p - 1 := by omega
      have h₁₀ : a < p := by omega
      have h₁₁ : ∑ i in Finset.range (p - 1), (i + 1) * a ^ i ≡ (1 : ℕ) * (Nat.modPred a p) [MOD p] := by
        -- Use the fact that a < p to simplify the sum modulo p
        have h₁₂ : a < p := by omega
        have h₁₃ : Nat.modPred a p = a := by
          rw [Nat.modPred_eq_self]
          <;> omega
        rw [h₁₃]
        have h₁₄ : ∑ i in Finset.range (p - 1), (i + 1) * a ^ i ≡ (1 : ℕ) * a [MOD p] := by
          -- Use the fact that the sum is congruent to a modulo p
          have h₁₅ : ∑ i in Finset.range (p - 1), (i + 1) * a ^ i ≡ (1 : ℕ) * a [MOD p] := by
            -- Prove that the sum is congruent to a modulo p
            have h₁₆ : ∀ (i : ℕ), i ∈ Finset.range (p - 1) → ((i + 1 : ℕ) * a ^ i : ℕ) % p = if i = 0 then a % p else 0 := by
              intro i hi
              have h₁₇ : i < p - 1 := Finset.mem_range.mp hi
              have h₁₈ : i ≤ p - 1 := by omega
              by_cases h₁₉ : i = 0
              · -- Case i = 0
                simp_all [h₁₉, Nat.pow_zero, Nat.mul_one, Nat.mod_eq_of_lt]
                <;>
                (try omega)
                <;>
                (try ring_nf at *)
                <;>
                (try omega)
              · -- Case i ≠ 0
                have h₂₀ : i > 0 := by
                  by_contra h
                  have h₂₁ : i = 0 := by omega
                  contradiction
                have h₂₁ : a ^ i ≠ 0 := by positivity
                have h₂₂ : ((i + 1 : ℕ) * a ^ i : ℕ) % p = 0 := by
                  have h₂₃ : p ∣ (i + 1 : ℕ) * a ^ i := by
                    have h₂₄ : p ∣ a ^ i := by
                      -- Prove that p divides a^i using the fact that a < p and i > 0
                      have h₂₅ : i ≥ 1 := by omega
                      have h₂₆ : a ^ i ≥ a := by
                        calc
                          a ^ i ≥ a ^ 1 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
                          _ = a := by ring
                      have h₂₇ : p ∣ a ^ i := by
                        -- Use the fact that a < p to show that p divides a^i
                        have h₂₈ : a < p := by omega
                        have h₂₉ : a ^ i % p = 0 := by
                          have h₃₀ : a ^ i % p = 0 := by
                            have h₃₁ : p ∣ a ^ i := by
                              apply Nat.dvd_of_mod_eq_zero
                              have h₃₂ : a % p = a := by
                                have h₃₃ : a < p := by omega
                                have h₃₄ : a % p = a := by
                                  rw [Nat.mod_eq_of_lt h₃₃]
                                exact h₃₄
                              have h₃₅ : a ^ i % p = 0 := by
                                have h₃₆ : p ∣ a ^ i := by
                                  have h₃₇ : a ≥ 1 := by omega
                                  have h₃₈ : i ≥ 1 := by omega
                                  have h₃₉ : a ^ i ≥ a := by
                                    calc
                                      a ^ i ≥ a ^ 1 := Nat.pow_le_pow_of_le_right (by omega) (by omega)
                                      _ = a := by ring
                                  have h₄₀ : p ∣ a ^ i := by
                                    have h₄₁ : a ^ i % p = 0 := by
                                      have h₄₂ : a < p := by omega
                                      have h₄₃ : a % p = a := by
                                        rw [Nat.mod_eq_of_lt h₄₂]
                                      have h₄₄ : a ^ i % p = 0 := by
                                        apply Nat.mod_eq_zero_of_dvd
                                        have h₄₅ : p ∣ a ^ i := by
                                          have h₄₆ : a < p := by omega
                                          have h₄₇ : p ∣ a ^ i := by
                                            have h₄₈ : i ≥ 1 := by omega
                                            have h₄₉ : p ∣ a ^ i := by
                                              have h₅₀ : p ∣ a ^ i := by
                                                calc
                                                  p ∣ a := by
                                                    have h₅₁ : a < p := by omega
                                                    have h₅₂ : p ∣ a := by
                                                      by_contra h₅₃
                                                      have h₅₄ : a ≥ p := by omega
                                                      omega
                                                    exact h₅₂
                                                  _ ∣ a ^ i := by
                                                    exact dvd_pow (by omega) (by omega)
                                              exact h₅₀
                                            exact h₄₉
                                          exact h₄₇
                                        exact h₄₅
                                      exact h₄₄
                                    exact by
                                      simp_all [Nat.mod_eq_zero_of_dvd]
                                    <;> omega
                                  exact h₄₀
                                exact h₃₆
                              exact by
                                simp_all [Nat.mod_eq_zero_of_dvd]
                              <;> omega
                            exact h₃₁
                          exact h₃₀
                        exact h₂₉
                      exact by
                        simp_all [Nat.dvd_iff_mod_eq_zero]
                      <;> omega
                    have h₃₀ : p ∣ (i + 1 : ℕ) * a ^ i := by
                      have h₃₁ : p ∣ a ^ i := h₂₄
                      have h₃₂ : p ∣ (i + 1 : ℕ) * a ^ i := by
                        exact dvd_mul_of_dvd_right h₃₁ _
                      exact h₃₂
                    exact h₃₀
                  have h₃₃ : ((i + 1 : ℕ) * a ^ i : ℕ) % p = 0 := by
                    exact Nat.mod_eq_zero_of_dvd h₂₃
                  exact h₃₃
                simp_all [Nat.ModEq, Nat.mod_eq_of_lt]
                <;>
                (try omega)
                <;>
                (try ring_nf at *)
                <;>
                (try omega)
            have h₂₄ : (∑ i in Finset.range (p - 1), ((i + 1 : ℕ) * a ^ i : ℕ)) % p = a % p := by
              calc
                (∑ i in Finset.range (p - 1), ((i + 1 : ℕ) * a ^ i : ℕ)) % p = (∑ i in Finset.range (p - 1), (((i + 1 : ℕ) * a ^ i : ℕ) % p)) % p := by
                  simp [Finset.sum_nat_mod, Nat.add_mod, Nat.mul_mod, Nat.pow_mod]
                _ = (∑ i in Finset.range (p - 1), (if i = 0 then a % p else 0 : ℕ)) % p := by
                  apply congr_arg (· % p)
                  apply Finset.sum_congr rfl
                  intro i hi
                  rw [h₁₆ i hi]
                _ = a % p := by
                  have h₂₅ : (∑ i in Finset.range (p - 1), (if i = 0 then a % p else 0 : ℕ)) = a % p := by
                    have h₂₆ : p - 1 > 0 := by omega
                    have h₂₇ : (∑ i in Finset.range (p - 1), (if i = 0 then a % p else 0 : ℕ)) = a % p := by
                      -- We need to show that the sum of the if-then-else expressions is a % p.
                      -- This is true because only the first term (i = 0) is a % p, and all other terms are 0.
                      -- Since p - 1 > 0, the sum is a % p.
                      calc
                        (∑ i in Finset.range (p - 1), (if i = 0 then a % p else 0 : ℕ)) = ∑ i in Finset.range (p - 1), (if i = 0 then a % p else 0 : ℕ) := rfl
                        _ = a % p := by
                          -- We need to show that the sum of the if-then-else expressions is a % p.
                          -- This is true because only the first term (i = 0) is a % p, and all other terms are 0.
                          -- Since p - 1 > 0, the sum is a % p.
                          have h₂₈ : p - 1 > 0 := by omega
                          have h₂₉ : (∑ i in Finset.range (p - 1), (if i = 0 then a % p else 0 : ℕ)) = a % p := by
                            cases p with
                            | zero => omega
                            | succ p =>
                              cases p with
                              | zero => omega
                              | succ p =>
                                simp [Finset.sum_range_succ, Finset.sum_range_zero, Nat.succ_eq_add_one]
                                <;>
                                (try omega) <;>
                                (try decide) <;>
                                (try ring_nf) <;>
                                (try omega)
                          exact h₂₉
                    exact h₂₇
                  rw [h₂₅]
                  <;> simp [Nat.mod_eq_of_lt, h₁₀]
                _ = a % p := by rfl
            have h₂₅ : (∑ i in Finset.range (p - 1), (i + 1) * a ^ i : ℕ) ≡ (1 : ℕ) * a [MOD p] := by
              rw [Nat.ModEq]
              <;> simp_all [Nat.ModEq, Nat.mod_eq_of_lt]
              <;>
                (try omega)
              <;>
                (try ring_nf at *)
              <;>
                (try omega)
            exact h₂₅
          exact h₁₅
        exact h₁₄
      exact h₁₁
    have h₈ : ∑ i in Finset.range (p - 1), (i + 1) * a ^ i ≡ (1 : ℕ) * (Nat.modPred a p) [MOD p] := by
      simpa [Nat.ModEq] using h₇
    exact h₈
  have h_main : ∀ a ∈ Finset.Icc 1 p, ∀ b ∈ Finset.Icc 1 p, a ≠ b → ¬(F a ≡ F b [MOD p]) := by
    intro a ha b hb hab
    have h₁ : F a % p ≠ F b % p := by
      by_contra h
      have h₂ : a ∈ Finset.Icc 1 p := ha
      have h₃ : b ∈ Finset.Icc 1 p := hb
      have h₄ : a ≠ b := hab
      have h₅ : a ≤ p := Finset.mem_Icc.mp h₂ |>.2
      have h₆ : b ≤ p := Finset.mem_Icc.mp h₃ |>.2
      have h₇ : 1 ≤ a := Finset.mem_Icc.mp h₂ |>.1
      have h₈ : 1 ≤ b := Finset.mem_Icc.mp h₃ |>.1
      have h₉ : F a ≡ F b [MOD p] := by
        exact by
          simpa [Nat.ModEq, Nat.ModEq] using h
      -- We handle the cases for `a` and `b` being 1 or `p` or in between
      by_cases h₁₀ : a = p
      · -- Case `a = p`
        have h₁₁ : F a ≡ 1 [MOD p] := by simpa [h₁₀] using hFp
        have h₁₂ : F b ≡ 1 [MOD p] := by simpa [Nat.ModEq] using h₉.trans h₁₁
        -- If `b = 1`, then `F b ≡ 0 [MOD p]`
        by_cases h₁₃ : b = 1
        · have h₁₄ : F b = (p - 1) * p / 2 := by
            simpa [h₁₃, hF] using hF₁
          have h₁₅ : (p - 1) * p / 2 ≡ 0 [MOD p] := by
            have h₁₆ : p ∣ (p - 1) * p / 2 := by
              have h₁₇ : p ∣ (p - 1) * p := by
                have h₁₈ : p ∣ (p - 1) * p := by
                  apply Nat.dvd_of_mod_eq_zero
                  have h₁₉ : ((p - 1) * p : ℕ) % p = 0 := by
                    have h₂₀ : p ≠ 0 := hp_gt_one.ne'
                    simp [Nat.mul_mod, Nat.mod_eq_of_lt, hp_gt_one, h₂₀]
                  omega
                exact h₁₈
              have h₁₉ : p ∣ (p - 1) * p / 2 := by
                have h₂₀ : 2 ∣ (p - 1) * p := by
                  have h₂₁ : p % 2 = 1 := hp_odd
                  have h₂₂ : (p - 1) % 2 = 0 := by
                    omega
                  have h₂₃ : ((p - 1) * p : ℕ) % 2 = 0 := by
                    simp [Nat.mul_mod, h₂₂, h₂₁, Nat.add_mod, Nat.mod_mod]
                  omega
                have h₂₁ : p ∣ (p - 1) * p / 2 := by
                  have h₂₂ : (p - 1) * p / 2 = (p - 1) * p / 2 := rfl
                  rw [h₂₂]
                  have h₂₃ : p ∣ (p - 1) * p := by
                    exact h₁₇
                  have h₂₄ : p ∣ (p - 1) * p / 2 := by
                    have h₂₅ : 2 ∣ (p - 1) * p := h₂₀
                    have h₂₆ : p ∣ (p - 1) * p / 2 := by
                      have h₂₇ : (p - 1) * p / 2 = (p - 1) * p / 2 := rfl
                      rw [h₂₇]
                      exact Nat.dvd_div_of_mul_dvd (by
                        have h₂₈ : p * 2 ∣ (p - 1) * p := by
                          have h₂₉ : p * 2 ∣ (p - 1) * p := by
                            have h₃₀ : p * 2 ∣ (p - 1) * p := by
                              use (p - 1) / 2
                              have h₃₁ : p ≥ 2 := by omega
                              have h₃₂ : (p - 1) ≥ 1 := by omega
                              have h₃₃ : (p - 1) / 2 * (p * 2) = (p - 1) * p := by
                                have h₃₄ : (p - 1) / 2 * (p * 2) = (p - 1) * p := by
                                  have h₃₅ : p % 2 = 1 := hp_odd
                                  have h₃₆ : (p - 1) / 2 * 2 = p - 1 := by
                                    have h₃₇ : p - 1 ≥ 1 := by omega
                                    have h₃₈ : (p - 1) / 2 * 2 = p - 1 := by
                                      have h₃₉ : p % 2 = 1 := hp_odd
                                      have h₄₀ : (p - 1) / 2 * 2 = p - 1 := by
                                        omega
                                      exact h₄₀
                                    exact h₃₈
                                  have h₃₉ : (p - 1) / 2 * (p * 2) = ((p - 1) / 2 * 2) * p := by
                                    ring
                                  rw [h₃₉, h₃₆]
                                  <;> ring
                                  <;> omega
                                exact h₃₄
                              exact by
                                omega
                            exact h₃₀
                          exact h₂₉
                        exact by
                          simpa [mul_comm, mul_assoc, mul_left_comm] using h₂₈)
                      <;> omega
                    exact h₂₆
                  exact h₂₄
                exact h₂₁
              exact h₂₁
            exact h₁₉
          have h₁₇ : (p - 1) * p / 2 % p = 0 := by
            exact Nat.mod_eq_zero_of_dvd h₁₆
          have h₁₈ : (p - 1) * p / 2 ≡ 0 [MOD p] := by
            simpa [Nat.ModEq] using h₁₇
          omega
          <;> simp_all [Nat.ModEq]
          <;> omega
          <;> simp_all [Nat.ModEq]
          <;> omega
          <;> simp_all [Nat.ModEq]
          <;> omega
          <;> simp_all [Nat.ModEq]
          <;> omega
          <;> simp_all [Nat.ModEq]
          <;> omega
          <;> simp_all [Nat.ModEq]
          <;> omega
          <;> simp_all [Nat.ModEq]
          <;> omega
          <;> simp_all [Nat.ModEq]
          <;> omega
          <;> simp_all [Nat.ModEq]
          <;> omega
        have h₁₉ : ¬(F b ≡ 0 [MOD p]) := by
          simp_all [Nat.ModEq, Nat.ModEq]
          <;> omega
        have h₂₀ : F b ≡ 1 [MOD p] := h₁₂
        have h₂₁ : F b ≡ 1 [MOD p] := h₂₀
        omega
        <;> simp_all [Nat.ModEq]
        <;> omega
        ·
          have h₁₄ : b ∈ Finset.Icc 1 p := h₃
          have h₁₅ : 1 ≤ b := Finset.mem_Icc.mp h₁₄ |>.1
          have h₁₆ : b ≤ p := Finset.mem_Icc.mp h₁₄ |>.2
          by_cases h₁₇ : b = p
          · -- Case `b = p`
            simp_all [Nat.ModEq, Nat.ModEq]
            <;> omega
          · -- Case `b ≠ p`
            have h₁₈ : b < p := by
              omega
            have h₁₉ : b ≤ p - 1 := by omega
            have h₂₀ : (b : ℕ) ≠ 1 := by omega
            have h₂₁ : 2 ≤ b := by
              by_contra h
              have h₂₂ : b < 2 := by omega
              have h₂₃ : b = 1 := by omega
              contradiction
            have h₂₂ : b ∈ Finset.Icc 2 (p - 1) := by
              have h₂₃ : 2 ≤ b := h₂₁
              have h₂₄ : b ≤ p - 1 := h₁₉
              have h₂₅ : p - 1 ≥ 2 := by
                have h₂₆ := hp_gt_one
                omega
              exact Finset.mem_Icc.mpr ⟨h₂₃, h₂₄⟩
            have h₂₃ : F b ≡ (1 : ℕ) * (Nat.modPred b p) [MOD p] := by
              exact hF_a_mod b h₂₂
            have h₂₄ : F b % p = (1 * (Nat.modPred b p)) % p := by
              simpa [Nat.ModEq] using h₂₃
            have h₂₅ : F a ≡ 1 [MOD p] := by simpa [h₁₀] using hFp
            have h₂₆ : F a % p = 1 % p := by
              simpa [Nat.ModEq] using h₂₅
            have h₂₇ : F b % p = F a % p := by omega
            have h₂₈ : (1 * (Nat.modPred b p)) % p = 1 % p := by omega
            have h₂₉ : (1 * (Nat.modPred b p)) % p = (Nat.modPred b p) % p := by
              simp [Nat.mul_mod]
            have h₃₀ : (Nat.modPred b p) % p = 1 % p := by omega
            have h₃₁ : Nat.modPred b p = 1 := by
              have h₃₂ : Nat.modPred b p < p := by
                have h₃₃ : b < p := h₁₈
                have h₃₄ : Nat.modPred b p < p := by
                  have h₃₅ := h₃₃
                  have h₃₆ : Nat.modPred b p < p := by
                    calc
                      Nat.modPred b p < p := by
                        have h₃₇ : b < p := h₃₃
                        have h₃₈ : Nat.modPred b p < p := by
                          apply Nat.modPred_lt
                          <;> omega
                        exact h₃₈
                      _ = p := by rfl
                  exact h₃₆
                exact h₃₄
              have h₃₂₁ : (Nat.modPred b p) % p = 1 % p := by omega
              have h₃₂₂ : Nat.modPred b p = 1 := by
                have h₃₂₃ : Nat.modPred b p < p := h₃₂
                have h₃₂₄ : Nat.modPred b p ≤ p - 1 := by
                  omega
                have h₃₂₅ : Nat.modPred b p ≥ 1 := by
                  have h₃₂₆ := Nat.modPred_lt_self hp_gt_one
                  omega
                have h₃₂₇ : (Nat.modPred b p) % p = 1 % p := by omega
                have h₃₂₈ : Nat.modPred b p = 1 := by
                  have h₃₂₉ : Nat.modPred b p < p := h₃₂
                  have h₃₃₀ : Nat.modPred b p ≤ p - 1 := by
                    omega
                  have h₃₃₁ : Nat.modPred b p ≥ 1 := by
                    have h₃₃₂ := Nat.modPred_lt_self hp_gt_one
                    omega
                  interval_cases Nat.modPred b p <;> norm_num at h₃₂₇ ⊢ <;>
                    (try omega) <;>
                    (try simp_all [Nat.modEq_iff_dvd, Nat.mod_eq_of_lt]) <;>
                    (try omega)
                exact h₃₂₈
              exact h₃₂₂
            have h₃₂ : Nat.modPred b p = 1 := h₃₁
            have h₃₃ : b = 1 := by
              have h₃₄ : b ≠ 0 := by
                by_contra h₃₄
                simp_all
                <;> omega
              have h₃₅ : Nat.modPred b p = 1 := h₃₁
              have h₃₆ : b ≤ p := h₁₆
              have h₃₇ : b < p := h₁₈
              have h₃₈ : Nat.modPred b p < p := Nat.modPred_lt_self hp_gt_one
              have h₃₉ : Nat.modPred b p = 1 := h₃₁
              have h₄₀ : b = 1 := by
                have h₄₁ : b < p := h₃₇
                have h₄₂ : Nat.modPred b p = 1 := h₃₁
                have h₄₃ : Nat.modPred b p < p := Nat.modPred_lt_self hp_gt_one
                have h₄₄ : Nat.modPred b p = 1 := h₃₁
                have h₄₅ : b = 1 := by
                  by_contra h₄₅
                  have h₄₆ : b ≥ 2 := by
                    by_contra h₄₆
                    have h₄₇ : b < 2 := by omega
                    interval_cases b <;> norm_num at h₄₅ h₄₆ ⊢ <;> simp_all (config := {decide := true})
                      <;> (try omega) <;> (try nlinarith)
                  have h₄₈ : b ≠ 1 := by
                    omega
                  have h₄₉ : Nat.modPred b p ≠ 1 := by
                    have h₅₀ : b ≥ 2 := by omega
                    have h₅₁ : Nat.modPred b p = b := by
                      exact by
                        have h₅₂ : b < p := h₃₇
                        have h₅₃ : Nat.modPred b p = b := by
                          rw [Nat.modPred_eq_self]
                          <;> omega
                        exact h₅₃
                    rw [h₅₁]
                    <;> omega
                  omega
                exact h₄₅
              exact h₄₀
            omega
          <;> simp_all [Nat.ModEq, Nat.ModEq]
          <;> omega
      · -- Case `a ≠ p`
        by_cases h₁₁ : a = 1
        · -- Case `a = 1`
          have h₁₂ : F a = (p - 1) * p / 2 := by simpa [h₁₁, hF] using hF₁
          have h₁₃ : F a ≡ 0 [MOD p] := by
            have h₁₄ : p ∣ (p - 1) * p / 2 := by
              have h₁₅ : p ∣ (p - 1) * p := by
                have h₁₆ : p ∣ (p - 1) * p := by
                  apply Nat.dvd_of_mod_eq_zero
                  have h₁₇ : ((p - 1) * p : ℕ) % p = 0 := by
                    have h₁₈ : p ≠ 0 := hp_gt_one.ne'
                    simp [Nat.mul_mod, Nat.mod_eq_of_lt, hp_gt_one, h₁₈]
                  omega
                exact h₁₆
              have h₁₉ : p ∣ (p - 1) * p / 2 := by
                have h₂₀ : 2 ∣ (p - 1) * p := by
                  have h₂₁ : p % 2 = 1 := hp_odd
                  have h₂₂ : (p - 1) % 2 = 0 := by
                    omega
                  have h₂₃ : ((p - 1) * p : ℕ) % 2 = 0 := by
                    simp [Nat.mul_mod, h₂₂, h₂₁, Nat.add_mod, Nat.mod_mod]
                  omega
                have h₂₄ : p ∣ (p - 1) * p / 2 := by
                  have h₂₅ : (p - 1) * p / 2 = (p - 1) * p / 2 := rfl
                  rw [h₂₅]
                  have h₂₆ : p ∣ (p - 1) * p := h₁₅
                  have h₂₇ : p ∣ (p - 1) * p / 2 := by
                    have h₂₈ : 2 ∣ (p - 1) * p := h₂₀
                    have h₂₉ : p ∣ (p - 1) * p / 2 := by
                      have h₃₀ : (p - 1) * p / 2 = (p - 1) * p / 2 := rfl
                      rw [h₃₀]
                      exact Nat.dvd_div_of_mul_dvd (by
                        have h₃₁ : p * 2 ∣ (p - 1) * p := by
                          have h₃₂ : p * 2 ∣ (p - 1) * p := by
                            have h₃₃ : p * 2 ∣ (p - 1) * p := by
                              use (p - 1) / 2
                              have h₃₄ : p ≥ 2 := by omega
                              have h₃₅ : (p - 1) ≥ 1 := by omega
                              have h₃₆ : (p - 1) / 2 * (p * 2) = (p - 1) * p := by
                                have h₃₇ : (p - 1) / 2 * (p * 2) = (p - 1) * p := by
                                  have h₃₈ : p % 2 = 1 := hp_odd
                                  have h₃₉ : (p - 1) / 2 * 2 = p - 1 := by
                                    have h₄₀ : p - 1 ≥ 1 := by omega
                                    have h₄₁ : (p - 1) / 2 * 2 = p - 1 := by
                                      have h₄₂ : p % 2 = 1 := hp_odd
                                      have h₄₃ : (p - 1) / 2 * 2 = p - 1 := by
                                        omega
                                      exact h₄₃
                                    exact h₄₁
                                  have h₄₄ : (p - 1) / 2 * (p * 2) = ((p - 1) / 2 * 2) * p := by
                                    ring
                                  rw [h₄₄, h₃₉]
                                  <;> ring
                                  <;> omega
                                exact h₃₇
                              exact by
                                omega
                            exact h₃₃
                          exact h₃₂
                        exact by
                          simpa [mul_comm, mul_assoc, mul_left_comm] using h₃₁)
                      <;> omega
                    exact h₂₉
                  exact h₂₇
                exact h₂₄
              exact h₂₄
            have h₂₅ : p ∣ F a := by
              rw [h₁₂]
              exact h₁₄
            have h₂₆ : F a ≡ 0 [MOD p] := by
              exact Nat.modEq_zero_iff_dvd.mpr h₂₅
            exact h₂₆
          have h₁₄ : F a ≡ 0 [MOD p] := h₁₃
          by_cases h₁₅ : b = 1
          · -- Case `b = 1`
            exfalso
            simp_all [Nat.ModEq]
            <;> omega
          · -- Case `b ≠ 1`
            have h₁₆ : b ∈ Finset.Icc 1 p := hb
            have h₁₇ : 1 ≤ b := Finset.mem_Icc.mp h₁₆ |>.1
            have h₁₈ : b ≤ p := Finset.mem_Icc.mp h₁₆ |>.2
            by_cases h₁₉ : b = p
            · -- Case `b = p`
              have h₂₀ : F b ≡ 1 [MOD p] := by simpa [h₁₉] using hFp
              have h₂₁ : F a ≡ 0 [MOD p] := h₁₄
              have h₂₂ : ¬(F a ≡ F b [MOD p]) := by
                intro h
                have h₂₃ : F a ≡ F b [MOD p] := h
                have h₂₄ : F a ≡ 0 [MOD p] := h₂₁
                have h₂₅ : F b ≡ 1 [MOD p] := h₂₀
                have h₂₆ : (0 : ℕ) ≡ 1 [MOD p] := by
                  exact h₂₄.symm.trans (h₂₃.trans h₂₅)
                have h₂₇ : p ∣ 1 := by
                  simpa [Nat.ModEq, Nat.dvd_iff_mod_eq_zero] using h₂₆
                have h₂₈ : p ≤ 1 := Nat.le_of_dvd (by norm_num) h₂₇
                have h₂₉ : p ≥ 2 := by
                  linarith [hp_gt_one]
                linarith
              contrapose! h₂₂
              <;> simp_all [Nat.ModEq, Nat.ModEq]
              <;> omega
            · -- Case `b ≠ p`
              have h₂₀ : b < p := by
                have h₂₁ : b ≤ p := h₁₈
                have h₂₂ : b ≠ p := h₁₉
                omega
              have h₂₁ : b ≤ p - 1 := by omega
              have h₂₂ : (b : ℕ) ≠ 1 := by omega
              have h₂₃ : 2 ≤ b := by
                by_contra h
                have h₂₄ : b < 2 := by omega
                have h₂₅ : b = 1 := by omega
                contradiction
              have h₂₄ : b ∈ Finset.Icc 2 (p - 1) := by
                have h₂₅ : 2 ≤ b := h₂₃
                have h₂₆ : b ≤ p - 1 := by omega
                have h₂₇ : p - 1 ≥ 2 := by
                  have h₂₈ := hp_gt_one
                  omega
                exact Finset.mem_Icc.mpr ⟨h₂₅, h₂₆⟩
              have h₂₅ : F b ≡ (1 : ℕ) * (Nat.modPred b p) [MOD p] := by
                exact hF_a_mod b h₂₄
              have h₂₆ : F b % p = (1 * (Nat.modPred b p)) % p := by
                simpa [Nat.ModEq] using h₂₅
              have h₂₇ : F a ≡ 0 [MOD p] := h₁₄
              have h₂₈ : F b ≡ (1 : ℕ) * (Nat.modPred b p) [MOD p] := h₂₅
              have h₂₉ : (1 * (Nat.modPred b p)) % p ≠ 0 := by
                have h₃₀ : Nat.modPred b p < p := by
                  have h₃₁ : b < p := by omega
                  have h₃₂ : Nat.modPred b p < p := by
                    have h₃₃ : b < p := h₃₁
                    have h₃₄ : Nat.modPred b p < p := by
                      apply Nat.modPred_lt
                      <;> omega
                    exact h₃₄
                  exact h₃₂
                have h₃₁ : Nat.modPred b p ≠ 0 := by
                  by_contra h₃₁
                  have h₃₂ : Nat.modPred b p = 0 := by omega
                  have h₃₃ : b = p := by
                    have h₃₄ : Nat.modPred b p = 0 := h₃₂
                    have h₃₅ : b = p := by
                      have h₃₆ : b < p := by omega
                      have h₃₇ : Nat.modPred b p = b := by
                        rw [Nat.modPred_eq_self]
                        <;> omega
                      omega
                    exact h₃₅
                  omega
                have h₃₂ : (1 * (Nat.modPred b p)) % p ≠ 0 := by
                  have h₃₃ : (1 * (Nat.modPred b p)) % p = (Nat.modPred b p) % p := by
                    simp [Nat.mul_mod]
                  rw [h₃₃]
                  have h₃₄ : Nat.modPred b p % p ≠ 0 := by
                    have h₃₅ : Nat.modPred b p < p := h₃₀
                    have h₃₆ : Nat.modPred b p ≠ 0 := h₃₁
                    have h₃₇ : Nat.modPred b p % p ≠ 0 := by
                      by_contra h₃₇
                      have h₃₈ : Nat.modPred b p % p = 0 := h₃₇
                      omega
                    exact h₃₇
                  exact h₃₄
                exact h₃₂
              have h₃₀ : F b % p ≠ 0 := by
                have h₃₁ : F b % p = (1 * (Nat.modPred b p)) % p := h₂₆
                rw [h₃₁]
                exact h₂₉
              have h₃₁ : ¬(F a ≡ F b [MOD p]) := by
                intro h
                have h₃₂ : F a ≡ F b [MOD p] := h
                have h₃₃ : F a ≡ 0 [MOD p] := h₁₄
                have h₃₄ : F b ≡ F a [MOD p] := by
                  exact h₃₂.symm
                have h₃₅ : F b ≡ 0 [MOD p] := by
                  simpa [Nat.ModEq, Nat.ModEq] using h₃₄.trans h₃₃
                have h₃₆ : F b % p = 0 := by
                  simpa [Nat.ModEq, Nat.ModEq] using h₃₅
                omega
              exact h₃₁
        · -- Case `a ≠ 1`
          by_cases h₁₁ : a = p
          · -- Case `a = p`
            have h₁₂ : F a ≡ 1 [MOD p] := by simpa [h₁₁] using hFp
            have h₁₃ : b ≠ p := by
              intro h
              simp_all [Nat.ModEq, Nat.ModEq]
              <;> omega
            have h₁₄ : b < p := by
              have h₁₅ : b ≤ p := Finset.mem_Icc.mp hb |>.2
              have h₁₆ : b ≠ p := h₁₃
              omega
            have h₁₅ : b ≤ p - 1 := by omega
            by_cases h₁₆ : b = 1
            · -- Case `b = 1`
              have h₁₇ : F b = (p - 1) * p / 2 := by simpa [h₁₆, hF] using hF₁
              have h₁₈ : (p - 1) * p / 2 ≡ 0 [MOD p] := by
                have h₁₉ : p ∣ (p - 1) * p / 2 := by
                  have h₂₀ : p ∣ (p - 1) * p := by
                    have h₂₁ : p ∣ (p - 1) * p := by
                      apply Nat.dvd_of_mod_eq_zero
                      have h₂₂ : ((p - 1) * p : ℕ) % p = 0 := by
                        have h₂₃ : p ≠ 0 := hp_gt_one.ne'
                        simp [Nat.mul_mod, Nat.mod_eq_of_lt, hp_gt_one, h₂₃]
                      omega
                    exact h₂₁
                  have h₂₂ : p ∣ (p - 1) * p / 2 := by
                    have h₂₃ : 2 ∣ (p - 1) * p := by
                      have h₂₄ : p % 2 = 1 := hp_odd
                      have h₂₅ : (p - 1) % 2 = 0 := by
                        omega
                      have h₂₆ : ((p - 1) * p : ℕ) % 2 = 0 := by
                        simp [Nat.mul_mod, h₂₅, h₂₄, Nat.add_mod, Nat.mod_mod]
                      omega
                    have h₂₇ : p ∣ (p - 1) * p / 2 := by
                      have h₂₈ : (p - 1) * p / 2 = (p - 1) * p / 2 := rfl
                      rw [h₂₈]
                      have h₂₉ : p ∣ (p - 1) * p := h₂₀
                      have h₃₀ : p ∣ (p - 1) * p / 2 := by
                        have h₃₁ : 2 ∣ (p - 1) * p := h₂₃
                        have h₃₂ : p ∣ (p - 1) * p / 2 := by
                          have h₃₃ : (p - 1) * p / 2 = (p - 1) * p / 2 := rfl
                          rw [h₃₃]
                          exact Nat.dvd_div_of_mul_dvd (by
                            have h₃₄ : p * 2 ∣ (p - 1) * p := by
                              have h₃₅ : p * 2 ∣ (p - 1) * p := by
                                have h₃₆ : p * 2 ∣ (p - 1) * p := by
                                  use (p - 1) / 2
                                  have h₃₇ : p ≥ 2 := by omega
                                  have h₃₈ : (p - 1) ≥ 1 := by omega
                                  have h₃₉ : (p - 1) / 2 * (p * 2) = (p - 1) * p := by
                                    have h₄₀ : (p - 1) / 2 * (p * 2) = (p - 1) * p := by
                                      have h₄₁ : p % 2 = 1 := hp_odd
                                      have h₄₂ : (p - 1) / 2 * 2 = p - 1 := by
                                        have h₄₃ : p - 1 ≥ 1 := by omega
                                        have h₄₄ : (p - 1) / 2 * 2 = p - 1 := by
                                          have h₄₅ : p % 2 = 1 := hp_odd
                                          have h₄₆ : (p - 1) / 2 * 2 = p - 1 := by
                                            omega
                                          exact h₄₆
                                        exact h₄₄
                                      have h₄₇ : (p - 1) / 2 * (p * 2) = ((p - 1) / 2 * 2) * p := by
                                        ring
                                      rw [h₄₇, h₄₂]
                                      <;> ring
                                      <;> omega
                                    exact h₄₀
                                  exact by
                                    omega
                                exact h₃₆
                              exact h₃₅
                            exact by
                              simpa [mul_comm, mul_assoc, mul_left_comm] using h₃₄)
                            <;> omega
                          <;> omega
                        exact h₃₂
                      exact h₃₀
                    exact h₂₇
                  exact h₂₂
                have h₂₀ : p ∣ F b := by
                  rw [h₁₇]
                  exact h₁₉
                have h₂₁ : F b ≡ 0 [MOD p] := by
                  exact Nat.modEq_zero_iff_dvd.mpr h₂₀
                exact h₂₁
              have h₂₂ : F b ≡ 0 [MOD p] := h₁₈
              have h₂₃ : ¬(F a ≡ F b [MOD p]) := by
                intro h₂₄
                have h₂₅ : F a ≡ F b [MOD p] := h₂₄
                have h₂₆ : F a ≡ 1 [MOD p] := h₁₂
                have h₂₇ : F b ≡ 0 [MOD p] := h₂₂
                have h₂₈ : (1 : ℕ) ≡ 0 [MOD p] := by
                  exact h₂₆.symm.trans (h₂₅.trans h₂₇)
                have h₂₉ : p ∣ 1 := by
                  simpa [Nat.ModEq, Nat.dvd_iff_mod_eq_zero] using h₂₈
                have h₃₀ : p ≤ 1 := Nat.le_of_dvd (by norm_num) h₂₉
                have h₃₁ : p ≥ 2 := by
                  linarith [hp_gt_one]
                linarith
              contrapose! h₂₃
              <;> simp_all [Nat.ModEq, Nat.ModEq]
              <;> omega
            · -- Case `b ≠ 1`
              have h₁₇ : b ∈ Finset.Icc 1 p := hb
              have h₁₈ : 1 ≤ b := Finset.mem_Icc.mp h₁₇ |>.1
              have h₁₉ : b ≤ p := Finset.mem_Icc.mp h₁₇ |>.2
              by_cases h₂₀ : b = p
              · -- Case `b = p`
                exfalso
                simp_all [Nat.ModEq]
                <;> omega
              · -- Case `b ≠ p`
                have h₂₁ : b < p := by omega
                have h₂₂ : b ≤ p - 1 := by omega
                have h₂₃ : (b : ℕ) ≠ 1 := by omega
                have h₂₄ : 2 ≤ b := by
                  by_contra h
                  have h₂₅ : b < 2 := by omega
                  have h₂₆ : b = 1 := by omega
                  contradiction
                have h₂₅ : b ∈ Finset.Icc 2 (p - 1) := by
                  have h₂₆ : 2 ≤ b := h₂₄
                  have h₂₇ : b ≤ p - 1 := h₂₂
                  have h₂₈ : p - 1 ≥ 2 := by
                    have h₂₉ := hp_gt_one
                    omega
                  exact Finset.mem_Icc.mpr ⟨h₂₆, h₂₇⟩
                have h₂₆ : F b ≡ (1 : ℕ) * (Nat.modPred b p) [MOD p] := by
                  exact hF_a_mod b h₂₅
                have h₂₇ : F b % p = (1 * (Nat.modPred b p)) % p := by
                  simpa [Nat.ModEq] using h₂₆
                have h₂₈ : F a ≡ 1 [MOD p] := by simpa [h₁₁] using hFp
                have h₂₉ : F a % p = 1 % p := by
                  simpa [Nat.ModEq] using h₂₈
                have h₃₀ : F b % p = F a % p := by omega
                have h₃₁ : (1 * (Nat.modPred b p)) % p = 1 % p := by omega
                have h₃₂ : (1 * (Nat.modPred b p)) % p = (Nat.modPred b p) % p := by
                  simp [Nat.mul_mod]
                have h₃₃ : (Nat.modPred b p) % p = 1 % p := by omega
                have h₃₄ : Nat.modPred b p = 1 := by
                  have h₃₅ : Nat.modPred b p < p := by
                    have h₃₆ : b < p := h₂₁
                    have h₃₇ : Nat.modPred b p < p := by
                      have h₃₈ := h₃₆
                      have h₃₉ : Nat.modPred b p < p := by
                        apply Nat.modPred_lt
                        <;> omega
                      exact h₃₉
                    exact h₃₇
                  have h₃₅₁ : (Nat.modPred b p) % p = 1 % p := by omega
                  have h₃₅₂ : Nat.modPred b p = 1 := by
                    have h₃₅₃ : Nat.modPred b p < p := h₃₅
                    have h₃₅₄ : Nat.modPred b p ≤ p - 1 := by
                      omega
                    have h₃₅₅ : Nat.modPred b p ≥ 1 := by
                      have h₃₅₆ := Nat.modPred_lt_self hp_gt_one
                      omega
                    have h₃₅₇ : (Nat.modPred b p) % p = 1 % p := by omega
                    have h₃₅₈ : Nat.modPred b p = 1 := by
                      have h₃₅₉ : Nat.modPred b p < p := h₃₅
                      have h₃₆₀ : Nat.modPred b p ≤ p - 1 := by
                        omega
                      have h₃₆₁ : Nat.modPred b p ≥ 1 := by
                        have h₃₆₂ := Nat.modPred_lt_self hp_gt_one
                        omega
                      interval_cases Nat.modPred b p <;> norm_num at h₃₅₇ ⊢ <;>
                        (try omega) <;>
                        (try simp_all [Nat.modEq_iff_dvd, Nat.mod_eq_of_lt]) <;>
                        (try omega)
                    exact h₃₅₈
                  exact h₃₅₂
                have h₃₅ : Nat.modPred b p = 1 := h₃₄
                have h₃₆ : b = 1 := by
                  have h₃₇ : b ≠ 0 := by
                    by_contra h₃₇
                    simp_all
                    <;> omega
                  have h₃₈ : Nat.modPred b p = 1 := h₃₅
                  have h₃₉ : b ≤ p := h₁₉
                  have h₄₀ : b < p := h₂₁
                  have h₄₁ : Nat.modPred b p < p := Nat.modPred_lt_self hp_gt_one
                  have h₄₂ : Nat.modPred b p = 1 := h₃₅
                  have h₄₃ : b = 1 := by
                    have h₄₄ : b < p := h₄₀
                    have h₄₅ : Nat.modPred b p = 1 := h₃₅
                    have h₄₆ : Nat.modPred b p < p := Nat.modPred_lt_self hp_gt_one
                    have h₄₇ : Nat.modPred b p = 1 := h₃₅
                    have h₄₈ : b = 1 := by
                      by_contra h₄₈
                      have h₄₉ : b ≥ 2 := by
                        by_contra h₄₉
                        have h₅₀ : b < 2 := by omega
                        interval_cases b <;> norm_num at h₄₈ h₄₉ ⊢ <;> simp_all (config := {decide := true})
                          <;> (try omega) <;> (try nlinarith)
                      have h₅₁ : b ≠ 1 := by
                        omega
                      have h₅₂ : Nat.modPred b p ≠ 1 := by
                        have h₅₃ : b ≥ 2 := by omega
                        have h₅₄ : Nat.modPred b p = b := by
                          exact by
                            have h₅₅ : b < p := h₄₄
                            have h₅₆ : Nat.modPred b p = b := by
                              rw [Nat.modPred_eq_self]
                              <;> omega
                            exact h₅₆
                        rw [h₅₄]
                        <;> omega
                      omega
                    exact h₄₈
                  exact h₄₃
                omega
          · -- Case `a ≠ p`
            have h₁₂ : a < p := by
              have h₁₃ : a ≤ p := Finset.mem_Icc.mp ha |>.2
              have h₁₄ : a ≠ p := by intro h; simp_all
              omega
            have h₁₃ : a ∈ Finset.Icc 2 (p - 1) := by
              have h₁₄ : 2 ≤ a := by
                by_contra h
                have h₁₅ : a < 2 := by omega
                have h₁₆ : a = 1 := by
                  omega
                simp_all
              have h₁₅ : a ≤ p - 1 := by
                have h₁₆ : a < p := h₁₂
                omega
              exact Finset.mem_Icc.mpr ⟨h₁₄, h₁₅⟩
            have h₁₄ : F a ≡ (1 : ℕ) * (Nat.modPred a p) [MOD p] := hF_a_mod a h₁₃
            have h₁₅ : F a % p = (1 * (Nat.modPred a p)) % p := by
              simpa [Nat.ModEq] using h₁₄
            by_cases h₁₆ : b = 1
            · -- Case `b = 1`
              have h₁₇ : F b = (p - 1) * p / 2 := by simpa [h₁₆, hF] using hF₁
              have h₁₈ : (p - 1) * p / 2 ≡ 0 [MOD p] := by
                have h₁₉ : p ∣ (p - 1) * p / 2 := by
                  have h₂₀ : p ∣ (p - 1) * p := by
                    have h₂₁ : p ∣ (p - 1) * p := by
                      apply Nat.dvd_of_mod_eq_zero
                      have h₂₂ : ((p - 1) * p : ℕ) % p = 0 := by
                        have h₂₃ : p ≠ 0 := hp_gt_one.ne'
                        simp [Nat.mul_mod, Nat.mod_eq_of_lt, hp_gt_one, h₂₃]
                      omega
                    exact h₂₁
                  have h₂₂ : p ∣ (p - 1) * p / 2 := by
                    have h₂₃ : 2 ∣ (p - 1) * p := by
                      have h₂₄ : p % 2 = 1 := hp_odd
                      have h₂₅ : (p - 1) % 2 = 0 := by
                        omega
                      have h₂₆ : ((p - 1) * p : ℕ) % 2 = 0 := by
                        simp [Nat.mul_mod, h₂₅, h₂₄, Nat.add_mod, Nat.mod_mod]
                      omega
                    have h₂₇ : p ∣ (p - 1) * p / 2 := by
                      have h₂₈ : (p - 1) * p / 2 = (p - 1) * p / 2 := rfl
                      rw [h₂₈]
                      have h₂₉ : p ∣ (p - 1) * p := h₂₀
                      have h₃₀ : p ∣ (p - 1) * p / 2 := by
                        have h₃₁ : 2 ∣ (p - 1) * p := h₂₃
                        have h₃₂ : p ∣ (p - 1) * p / 2 := by
                          have h₃₃ : (p - 1) * p / 2 = (p - 1) * p / 2 := rfl
                          rw [h₃₃]
                          exact Nat.dvd_div_of_mul_dvd (by
                            have h₃₄ : p * 2 ∣ (p - 1) * p := by
                              have h₃₅ : p * 2 ∣ (p - 1) * p := by
                                have h₃₆ : p * 2 ∣ (p - 1) * p := by
                                  use (p - 1) / 2
                                  have h₃₇ : p ≥ 2 := by omega
                                  have h₃₈ : (p - 1) ≥ 1 := by omega
                                  have h₃₉ : (p - 1) / 2 * (p * 2) = (p - 1) * p := by
                                    have h₄₀ : (p - 1) / 2 * (p * 2) = (p - 1) * p := by
                                      have h₄₁ : p % 2 = 1 := hp_odd
                                      have h₄₂ : (p - 1) / 2 * 2 = p - 1 := by
                                        have h₄₃ : p - 1 ≥ 1 := by omega
                                        have h₄₄ : (p - 1) / 2 * 2 = p - 1 := by
                                          have h₄₅ : p % 2 = 1 := hp_odd
                                          have h₄₆ : (p - 1) / 2 * 2 = p - 1 := by
                                            omega
                                          exact h₄₆
                                        exact h₄₄
                                      have h₄₇ : (p - 1) / 2 * (p * 2) = ((p - 1) / 2 * 2) * p := by
                                        ring
                                      rw [h₄₇, h₄₂]
                                      <;> ring
                                      <;> omega
                                    exact h₄₀
                                  exact by
                                    omega
                                exact h₃₆
                              exact h₃₅
                            exact by
                              simpa [mul_comm, mul_assoc, mul_left_comm] using h₃₄)
                            <;> omega
                          <;> omega
                        exact h₃₂
                      exact h₃₀
                    exact h₂₇
                  exact h₂₂
                have h₂₃ : p ∣ F b := by
                  rw [h₁₇]
                  exact h₁₉
                have h₂₄ : F b ≡ 0 [MOD p] := by
                  exact Nat.modEq_zero_iff_dvd.mpr h₂₃
                exact h₂₄
              have h₂₅ : F b ≡ 0 [MOD p] := h₁₈
              have h₂₆ : (1 * (Nat.modPred a p)) % p ≠ 0 := by
                have h₂₇ : Nat.modPred a p < p := by
                  have h₂₈ : a < p := h₁₂
                  have h₂₉ : Nat.modPred a p < p := by
                    have h₃₀ : a < p := h₂₈
                    have h₃₁ : Nat.modPred a p < p := by
                      apply Nat.modPred_lt
                      <;> omega
                    exact h₃₁
                  exact h₂₉
                have h₃₁ : Nat.modPred a p ≠ 0 := by
                  by_contra h₃₁
                  have h₃₂ : Nat.modPred a p = 0 := by omega
                  have h₃₃ : a = p := by
                    have h₃₄ : Nat.modPred a p = 0 := h₃₂
                    have h₃₅ : a = p := by
                      have h₃₆ : a < p := h₁₂
                      have h₃₇ : Nat.modPred a p = a := by
                        rw [Nat.modPred_eq_self]
                        <;> omega
                      omega
                    exact h₃₅
                  omega
                have h₃₂ : (1 * (Nat.modPred a p)) % p ≠ 0 := by
                  have h₃₃ : (1 * (Nat.modPred a p)) % p = (Nat.modPred a p) % p := by
                    simp [Nat.mul_mod]
                  rw [h₃₃]
                  have h₃₄ : Nat.modPred a p % p ≠ 0 := by
                    have h₃₅ : Nat.modPred a p < p := h₂₇
                    have h₃₆ : Nat.modPred a p ≠ 0 := h₃₁
                    have h₃₇ : Nat.modPred a p % p ≠ 0 := by
                      by_contra h₃₇
                      have h₃₈ : Nat.modPred a p % p = 0 := h₃₇
                      omega
                    exact h₃₇
                  exact h₃₄
                exact h₃₂
              have h₃₃ : F a % p ≠ 0 := by
                have h₃₄ : F a % p = (1 * (Nat.modPred a p)) % p := h₁₅
                rw [h₃₄]
                exact h₂₆
              have h₃₄ : ¬(F a ≡ F b [MOD p]) := by
                intro h
                have h₃₅ : F a ≡ F b [MOD p] := h
                have h₃₆ : F b ≡ 0 [MOD p] := h₂₅
                have h₃₇ : F a ≡ 0 [MOD p] := by
                  simpa [Nat.ModEq, Nat.ModEq] using h₃₅.trans h₃₆
                have h₃₈ : F a % p = 0 := by
                  simpa [Nat.ModEq, Nat.ModEq] using h₃₇
                omega
              exact h₃₄
            · -- Case `b ≠ 1`
              have h₁₇ : b ∈ Finset.Icc 1 p := hb
              have h₁₈ : 1 ≤ b := Finset.mem_Icc.mp h₁₇ |>.1
              have h₁₉ : b ≤ p := Finset.mem_Icc.mp h₁₇ |>.2
              by_cases h₂₀ : b = p
              · -- Case `b = p`
                have h₂₁ : F b ≡ 1 [MOD p] := by simpa [h₂₀] using hFp
                have h₂₂ : F a ≡ (1 : ℕ) * (Nat.modPred a p) [MOD p] := by simpa [Nat.ModEq] using h₁₄
                have h₂₃ : F a % p = (1 * (Nat.modPred a p)) % p := by simpa [Nat.ModEq] using h₁₄
                have h₂₄ : (1 * (Nat.modPred a p)) % p ≠ 1 := by
                  have h₂₅ : a ∈ Finset.Icc 2 (p - 1) := h₁₃
                  have h₂₆ : a ≤ p - 1 := by
                    have h₂₇ : a ∈ Finset.Icc 2 (p - 1) := h₁₃
                    have h₂₈ : a ≤ p - 1 := Finset.mem_Icc.mp h₂₇ |>.2
                    exact h₂₈
                  have h₂₇ : Nat.modPred a p = a := by
                    have h₂₈ : a < p := by omega
                    have h₂₉ : Nat.modPred a p = a := by
                      rw [Nat.modPred_eq_self]
                      <;> omega
                    exact h₂₉
                  have h₃₀ : (1 * (Nat.modPred a p)) % p = a % p := by
                    simp [h₂₇, Nat.mul_mod]
                  have h₃₁ : a % p ≠ 1 := by
                    have h₃₂ : a ≥ 2 := by
                      have h₃₃ : a ∈ Finset.Icc 2 (p - 1) := h₁₃
                      have h₃₄ : 2 ≤ a := Finset.mem_Icc.mp h₃₃ |>.1
                      omega
                    have h₃₃ : a < p := by omega
                    have h₃₄ : a % p ≠ 1 := by
                      by_contra h
                      have h₃₅ : a % p = 1 := h
                      have h₃₆ : a ≥ 2 := h₃₂
                      have h₃₇ : a ≤ p - 1 := by omega
                      have h₃₈ : a ≠ 1 := by omega
                      have h₃₉ : a ≥ p := by
                        by_contra h₄₀
                        have h₄₁ : a < p := by omega
                        have h₄₂ : a % p = a := by
                          rw [Nat.mod_eq_of_lt h₄₁]
                        rw [h₄₂] at h₃₅
                        omega
                      omega
                    exact h₃₄
                  omega
                have h₃₂ : F a ≡ F b [MOD p] → False := by
                  intro h₃₃
                  have h₃₄ : F a % p = F b % p := by
                    simpa [Nat.ModEq] using h₃₃
                  have h₃₅ : F a % p = (1 * (Nat.modPred a p)) % p := h₁₅
                  have h₃₆ : F b ≡ 1 [MOD p] := h₂₁
                  have h₃₇ : F b % p = 1 % p := by simpa [Nat.ModEq] using h₃₆
                  have h₃₈ : (1 * (Nat.modPred a p)) % p = 1 % p := by
                    omega
                  have h₃₉ : (1 * (Nat.modPred a p)) % p ≠ 1 := h₂₄
                  omega
                exact h₃₂
              · -- Case `b ≠ p`
                have h₂₁ : b < p := by
                  have h₂₂ : b ≤ p := Finset.mem_Icc.mp hb |>.2
                  have h₂₃ : b ≠ p := h₂₀
                  omega
                have h₂₂ : b ≤ p - 1 := by omega
                by_cases h₂₃ : b = 1
                · -- Case `b = 1`
                  exfalso
                  simp_all [Nat.ModEq, Nat.ModEq]
                  <;> omega
                · -- Case `b ≠ 1`
                  have h₂₄ : (b : ℕ) ≠ 1 := by omega
                  have h₂₅ : 2 ≤ b := by
                    by_contra h
                    have h₂₆ : b < 2 := by omega
                    have h₂₇ : b = 1 := by omega
                    contradiction
                  have h₂₆ : b ∈ Finset.Icc 2 (p - 1) := by
                    have h₂₇ : 2 ≤ b := h₂₅
                    have h₂₈ : b ≤ p - 1 := by omega
                    have h₂₉ : p - 1 ≥ 2 := by
                      have h₃₀ := hp_gt_one
                      omega
                    exact Finset.mem_Icc.mpr ⟨h₂₇, h₂₈⟩
                  have h₂₇ : F b ≡ (1 : ℕ) * (Nat.modPred b p) [MOD p] := hF_a_mod b h₂₆
                  have h₂₈ : F b % p = (1 * (Nat.modPred b p)) % p := by
                    simpa [Nat.ModEq] using h₂₇
                  have h₂₉ : (1 * (Nat.modPred a p)) % p ≠ (1 * (Nat.modPred b p)) % p := by
                    have h₃₀ : Nat.modPred a p = a := by
                      have h₃₁ : a < p := h₁₂
                      have h₃₂ : a ≠ 0 := by
                        by_contra h
                        have h₃₃ : a = 0 := by omega
                        simp_all [Finset.mem_Icc]
                        <;> omega
                      have h₃₃ : Nat.modPred a p = a := by
                        rw [Nat.modPred_eq_self]
                        <;> omega
                      exact h₃₃
                    have h₃₁ : Nat.modPred b p = b := by
                      have h₃₂ : b < p := h₂₁
                      have h₃₃ : b ≠ 0 := by
                        by_contra h
                        have h₃₄ : b = 0 := by omega
                        simp_all [Finset.mem_Icc]
                        <;> omega
                      have h₃₄ : Nat.modPred b p = b := by
                        rw [Nat.modPred_eq_self]
                        <;> omega
                      exact h₃₄
                    have h₃₂ : (1 * (Nat.modPred a p)) % p = a % p := by
                      simp [h₃₀, Nat.mul_mod]
                    have h₃₃ : (1 * (Nat.modPred b p)) % p = b % p := by
                      simp [h₃₁, Nat.mul_mod]
                    have h₃₄ : a ≠ b := by
                      intro h₃₄
                      simp_all [Finset.mem_Icc]
                      <;> omega
                    have h₃₅ : a % p ≠ b % p := by
                      intro h₃₅
                      have h₃₆ : a ≡ b [MOD p] := by
                        simpa [Nat.ModEq] using h₃₅
                      have h₃₇ : a = b := by
                        have h₃₈ : a < p := h₁₂
                        have h₃₉ : b < p := h₂₁
                        have h₄₀ : a ≡ b [MOD p] := h₃₆
                        have h₄₁ : a = b := by
                          rw [Nat.ModEq] at h₄₀
                          have h₄₂ : a % p = b % p := h₄₀
                          have h₄₃ : a = b := by
                            omega
                          exact h₄₃
                        exact h₄₁
                      contradiction
                    omega
                  have h₃₀ : F a % p ≠ F b % p := by
                    omega
                  have h₃₁ : ¬(F a ≡ F b [MOD p]) := by
                    intro h₃₂
                    have h₃₃ : F a % p = F b % p := by
                      simpa [Nat.ModEq] using h₃₂
                    omega
                  exact h₃₁
    have h₂ : ¬(F a ≡ F b [MOD p]) := by
      by_contra h₃
      have h₄ : F a ≡ F b [MOD p] := h₃
      have h₅ : F a % p = F b % p := by
        simpa [Nat.ModEq, Nat.ModEq] using h₄
      have h₆ : F a % p ≠ F b % p := h₁
      contradiction
    exact h₂
  exact h_main
  <;> aesop