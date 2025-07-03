import Mathlib

open Set Nat Polynomial

-- 25
/--
Given $n$, let $k(n)$ be the minimal degree of any monic integral polynomial $f$ such that the value of $f(x)$ is divisible by $n$ for every integer $x$. Find the value of $k(1000000)$.
-/
theorem putnam_1974_a6
(hdivnallx : Polynomial ℤ → Prop)
(hdivnallx_def : hdivnallx = fun f => Monic f ∧ (∀ x : ℤ, (10^6 : ℤ) ∣ f.eval x))
: sInf {d : ℕ | ∃ f : Polynomial ℤ, hdivnallx f ∧ d = f.natDegree} = ((25) : ℕ ) := by
  have h₁ : (25 : ℕ) ∈ {d : ℕ | ∃ f : Polynomial ℤ, hdivnallx f ∧ d = f.natDegree} := by
    rw [hdivnallx_def] at *
    have h₂ : ∃ (f : Polynomial ℤ), (Monic f ∧ ∀ (x : ℤ), (10 ^ 6 : ℤ) ∣ f.eval x) ∧ 25 = f.natDegree := by
      use ∏ i in Finset.range 25, (Polynomial.X + Polynomial.C (i : ℤ))
      constructor
      · constructor
        · -- Prove that the polynomial is monic
          apply Polynomial.monic_prod_of_monic
          intro i _
          apply Polynomial.monic_X_add_C
        · -- Prove that for all integers x, 10^6 divides f.eval x
          intro x
          have h₃ : (∏ i in Finset.range 25, (Polynomial.X + Polynomial.C (i : ℤ))).eval x = ∏ i in Finset.range 25, (x + i : ℤ) := by
            simp [Polynomial.eval_prod, Polynomial.eval_add, Polynomial.eval_X, Polynomial.eval_C, Finset.prod_range_succ]
            <;> ring_nf
            <;> norm_num
          rw [h₃]
          -- Prove that the product is divisible by 10^6 for all integers x
          have h₄ : (10 : ℤ) ^ 6 ∣ ∏ i in Finset.range 25, (x + i : ℤ) := by
            -- Use the fact that the product of 25 consecutive integers is divisible by 5^6 and 2^6
            have h₅ : (5 : ℤ) ^ 6 ∣ ∏ i in Finset.range 25, (x + i : ℤ) := by
              -- Use the fact that the product of 25 consecutive integers is divisible by 5^6
              apply Int.dvd_of_emod_eq_zero
              have h₆ : (∏ i in Finset.range 25, (x + i : ℤ)) % (5 : ℤ) ^ 6 = 0 := by
                -- Each product of 25 consecutive integers has at least 6 factors of 5
                have h₇ : ∀ (x : ℤ), (∏ i in Finset.range 25, (x + i : ℤ)) % (5 : ℤ) ^ 6 = 0 := by
                  intro x
                  -- Prove that the product is divisible by 5^6
                  have h₈ : (∏ i in Finset.range 25, (x + i : ℤ)) % (5 : ℤ) ^ 6 = 0 := by
                    -- Use the fact that the product of 25 consecutive integers is divisible by 5^6
                    have h₉ : ∃ (k : ℤ), ∏ i in Finset.range 25, (x + i : ℤ) = k * (5 : ℤ) ^ 6 := by
                      -- Use the fact that the product of 25 consecutive integers is divisible by 5^6
                      have h₁₀ : (5 : ℤ) ^ 6 ∣ ∏ i in Finset.range 25, (x + i : ℤ) := by
                        -- Use the fact that the product of 25 consecutive integers is divisible by 5^6
                        apply Int.dvd_of_emod_eq_zero
                        have h₁₁ : (∏ i in Finset.range 25, (x + i : ℤ)) % (5 : ℤ) ^ 6 = 0 := by
                          -- Each product of 25 consecutive integers has at least 6 factors of 5
                          have h₁₂ : (∏ i in Finset.range 25, (x + i : ℤ)) % (5 : ℤ) ^ 6 = 0 := by
                            -- Use the fact that the product of 25 consecutive integers is divisible by 5^6
                            norm_num [Finset.prod_range_succ, Int.mul_emod, Int.add_emod, Int.emod_emod]
                            <;>
                              (try omega) <;>
                              (try
                                {
                                  -- Use the fact that the product of 25 consecutive integers is divisible by 5^6
                                  have h₁₃ : x % 3125 = 0 ∨ x % 3125 = 1 ∨ x % 3125 = 2 ∨ x % 3125 = 3 ∨ x % 3125 = 4 ∨ x % 3125 = 5 ∨ x % 3125 = 6 ∨ x % 3125 = 7 ∨ x % 3125 = 8 ∨ x % 3125 = 9 ∨ x % 3125 = 10 ∨ x % 3125 = 11 ∨ x % 3125 = 12 ∨ x % 3125 = 13 ∨ x % 3125 = 14 ∨ x % 3125 = 15 ∨ x % 3125 = 16 ∨ x % 3125 = 17 ∨ x % 3125 = 18 ∨ x % 3125 = 19 ∨ x % 3125 = 20 ∨ x % 3125 = 21 ∨ x % 3125 = 22 ∨ x % 3125 = 23 ∨ x % 3125 = 24 ∨ x % 3125 = 25 ∨ x % 3125 = 26 ∨ x % 3125 = 27 ∨ x % 3125 = 28 ∨ x % 3125 = 29 ∨ x % 3125 = 30 ∨ x % 3125 = 31 ∨ x % 3125 = 32 ∨ x % 3125 = 33 ∨ x % 3125 = 34 ∨ x % 3125 = 35 ∨ x % 3125 = 36 ∨ x % 3125 = 37 ∨ x % 3125 = 38 ∨ x % 3125 = 39 ∨ x % 3125 = 40 ∨ x % 3125 = 41 ∨ x % 3125 = 42 ∨ x % 3125 = 43 ∨ x % 3125 = 44 ∨ x % 3125 = 45 ∨ x % 3125 = 46 ∨ x % 3125 = 47 ∨ x % 3125 = 48 ∨ x % 3125 = 49 ∨ x % 3125 = 50 ∨ x % 3125 = 51 ∨ x % 3125 = 52 ∨ x % 3125 = 53 ∨ x % 3125 = 54 ∨ x % 3125 = 55 ∨ x % 3125 = 56 ∨ x % 3125 = 57 ∨ x % 3125 = 58 ∨ x % 3125 = 59 ∨ x % 3125 = 60 ∨ x % 3125 = 61 ∨ x % 3125 = 62 ∨ x % 3125 = 63 ∨ x % 3125 = 64 ∨ x % 3125 = 65 ∨ x % 3125 = 66 ∨ x % 3125 = 67 ∨ x % 3125 = 68 ∨ x % 3125 = 69 ∨ x % 3125 = 70 ∨ x % 3125 = 71 ∨ x % 3125 = 72 ∨ x % 3125 = 73 ∨ x % 3125 = 74 ∨ x % 3125 = 75 ∨ x % 3125 = 76 ∨ x % 3125 = 77 ∨ x % 3125 = 78 ∨ x % 3125 = 79 ∨ x % 3125 = 80 ∨ x % 3125 = 81 ∨ x % 3125 = 82 ∨ x % 3125 = 83 ∨ x % 3125 = 84 ∨ x % 3125 = 85 ∨ x % 3125 = 86 ∨ x % 3125 = 87 ∨ x % 3125 = 88 ∨ x % 3125 = 89 ∨ x % 3125 = 90 ∨ x % 3125 = 91 ∨ x % 3125 = 92 ∨ x % 3125 = 93 ∨ x % 3125 = 94 ∨ x % 3125 = 95 ∨ x % 3125 = 96 ∨ x % 3125 = 97 ∨ x % 3125 = 98 ∨ x % 3125 = 99 ∨ x % 3125 = 100 := by omega
                          -- Each product of 25 consecutive integers has at least 6 factors of 5
                          rcases h₁₂ with h₁₂
                          <;> simp [h₁₂, Int.mul_emod, Int.add_emod, Int.emod_emod]
                          <;> norm_num
                          <;> omega
                        exact h₁₁
                      obtain ⟨k, hk⟩ := h₁₀
                      use k
                      <;> linarith
                    obtain ⟨k, hk⟩ := h₉
                    rw [hk]
                    <;> simp [Int.mul_emod, Int.emod_emod]
                    <;> norm_num
                  exact h₈
                exact h₇ x
              exact h₆
            have h₅' : (2 : ℤ) ^ 6 ∣ ∏ i in Finset.range 25, (x + i : ℤ) := by
              apply Int.dvd_of_emod_eq_zero
              have h₆ : (∏ i in Finset.range 25, (x + i : ℤ)) % (2 : ℤ) ^ 6 = 0 := by
                have h₇ : ∀ (x : ℤ), (∏ i in Finset.range 25, (x + i : ℤ)) % (2 : ℤ) ^ 6 = 0 := by
                  intro x
                  have h₈ : (∏ i in Finset.range 25, (x + i : ℤ)) % (2 : ℤ) ^ 6 = 0 := by
                    -- Use the fact that the product of 25 consecutive integers is divisible by 2^6
                    norm_num [Finset.prod_range_succ, Int.mul_emod, Int.add_emod, Int.emod_emod]
                    <;>
                      (try omega) <;>
                      (try
                        {
                          have h₉ : x % 64 = 0 ∨ x % 64 = 1 ∨ x % 64 = 2 ∨ x % 64 = 3 ∨ x % 64 = 4 ∨ x % 64 = 5 ∨ x % 64 = 6 ∨ x % 64 = 7 ∨ x % 64 = 8 ∨ x % 64 = 9 ∨ x % 64 = 10 ∨ x % 64 = 11 ∨ x % 64 = 12 ∨ x % 64 = 13 ∨ x % 64 = 14 ∨ x % 64 = 15 ∨ x % 64 = 16 ∨ x % 64 = 17 ∨ x % 64 = 18 ∨ x % 64 = 19 ∨ x % 64 = 20 ∨ x % 64 = 21 ∨ x % 64 = 22 ∨ x % 64 = 23 ∨ x % 64 = 24 ∨ x % 64 = 25 ∨ x % 64 = 26 ∨ x % 64 = 27 ∨ x % 64 = 28 ∨ x % 64 = 29 ∨ x % 64 = 30 ∨ x % 64 = 31 ∨ x % 64 = 32 ∨ x % 64 = 33 ∨ x % 64 = 34 ∨ x % 64 = 35 ∨ x % 64 = 36 ∨ x % 64 = 37 ∨ x % 64 = 38 ∨ x % 64 = 39 ∨ x % 64 = 40 ∨ x % 64 = 41 ∨ x % 64 = 42 ∨ x % 64 = 43 ∨ x % 64 = 44 ∨ x % 64 = 45 ∨ x % 64 = 46 ∨ x % 64 = 47 ∨ x % 64 = 48 ∨ x % 64 = 49 ∨ x % 64 = 50 ∨ x % 64 = 51 ∨ x % 64 = 52 ∨ x % 64 = 53 ∨ x % 64 = 54 ∨ x % 64 = 55 ∨ x % 64 = 56 ∨ x % 64 = 57 ∨ x % 64 = 58 ∨ x % 64 = 59 ∨ x % 64 = 60 ∨ x % 64 = 61 ∨ x % 64 = 62 ∨ x % 64 = 63 := by omega
                          rcases h₉ with (h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉ | h₉) <;>
                            simp [h₉, Finset.prod_range_succ, Int.mul_emod, Int.add_emod, Int.emod_emod]
                            <;> norm_num <;> omega
                        })
                  exact h₈
                exact h₇ x
              exact h₆
            have h₆ : (10 : ℤ) ^ 6 ∣ ∏ i in Finset.range 25, (x + i : ℤ) := by
              -- Prove that the product is divisible by 10^6
              have h₇ : (10 : ℤ) ^ 6 = (2 : ℤ) ^ 6 * (5 : ℤ) ^ 6 := by norm_num
              rw [h₇]
              -- Use the fact that the product is divisible by both 2^6 and 5^6
              exact dvd_mul_of_dvd_left h₅' _
            exact h₆
          exact h₄
      · -- Prove that the degree of the polynomial is 25
        norm_num [Finset.prod_range_succ, Polynomial.natDegree_mul, Polynomial.natDegree_X_add_C,
          Polynomial.natDegree_C]
        <;> rfl
    obtain ⟨f, hf⟩ := h₂
    exact ⟨f, by simpa [hdivnallx_def] using hf⟩
  
  have h₂ : ∀ d ∈ {d : ℕ | ∃ f : Polynomial ℤ, hdivnallx f ∧ d = f.natDegree}, (25 : ℕ) ≤ d := by
    intro d hd
    rw [Set.mem_setOf_eq] at hd
    rcases hd with ⟨f, hf, rfl⟩
    have h₃ : hdivnallx f := hf
    rw [hdivnallx_def] at h₃
    have h₄ : Monic f := h₃.1
    have h₅ : ∀ x : ℤ, (10 ^ 6 : ℤ) ∣ f.eval x := h₃.2
    have h₆ : 25 ≤ f.natDegree := by
      by_contra h₆
      have h₇ : f.natDegree < 25 := by linarith
      have h₈ : f.natDegree ≤ 24 := by linarith
      have h₉ : f.degree ≤ 24 := by
        have h₁₀ : (f.natDegree : WithBot ℕ) ≤ 24 := by exact_mod_cast h₈
        have h₁₁ : f.degree ≤ 24 := by
          have h₁₂ : f.degree ≤ f.natDegree := by
            exact Polynomial.degree_le_natDegree
          have h₁₃ : (f.natDegree : WithBot ℕ) ≤ 24 := by exact_mod_cast h₈
          -- Use the fact that the degree of `f` is less than or equal to its natural degree and the natural degree is less than or equal to 24
          exact le_trans h₁₂ h₁₃
        exact h₁₁
      have h₁₀ : f.degree ≤ 24 := h₉
      have h₁₁ : ¬Monic f := by
        -- Prove that if `f` is a monic polynomial of degree less than 25, then it cannot satisfy the condition that `10^6` divides `f.eval x` for all integers `x`
        -- Use the fact that `f.natDegree` is less than 25 to derive a contradiction
        intro h₁₁
        have h₁₂ := h₅ 0
        have h₁₃ := h₅ 1
        have h₁₄ := h₅ (-1)
        have h₁₅ := h₅ 2
        have h₁₆ := h₅ (-2)
        have h₁₇ := h₅ 3
        have h₁₈ := h₅ (-3)
        have h₁₉ := h₅ 4
        have h₂₀ := h₅ (-4)
        have h₂₁ := h₅ 5
        have h₂₂ := h₅ (-5)
        have h₂₃ := h₅ 6
        have h₂₄ := h₅ (-6)
        have h₂₅ := h₅ 7
        have h₂₆ := h₅ (-7)
        have h₂₇ := h₅ 8
        have h₂₈ := h₅ (-8)
        have h₂₉ := h₅ 9
        have h₃₀ := h₅ (-9)
        have h₃₁ := h₅ 10
        have h₃₂ := h₅ (-10)
        -- Normalize the expressions to derive a contradiction
        norm_num at h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉ h₂₀ h₂₁ h₂₂ h₂₃ h₂₄ h₂₅ h₂₆ h₂₇ h₂₈ h₂₉ h₃₀ h₃₁ h₃₂
        -- Use the monicity of `f` to show that `f.natDegree` must be at least 25
        have h₃₃ : f.natDegree ≥ 25 := by
          by_contra h₃₄
          have h₃₅ : f.natDegree < 25 := by linarith
          have h₃₆ : f.natDegree ≤ 24 := by linarith
          -- Use the fact that `f.natDegree` is less than 25 to derive a contradiction
          have h₃₇ := h₅ 0
          have h₃₈ := h₅ 1
          have h₃₉ := h₅ (-1)
          have h₄₀ := h₅ 2
          have h₄₁ := h₅ (-2)
          have h₄₂ := h₅ 3
          have h₄₃ := h₅ (-3)
          have h₄₄ := h₅ 4
          have h₄₅ := h₅ (-4)
          have h₄₆ := h₅ 5
          have h₄₇ := h₅ (-5)
          have h₄₈ := h₅ 6
          have h₄₉ := h₅ (-6)
          have h₅₀ := h₅ 7
          have h₅₁ := h₅ (-7)
          have h₅₂ := h₅ 8
          have h₅₃ := h₅ (-8)
          have h₅₄ := h₅ 9
          have h₅₅ := h₅ (-9)
          have h₅₆ := h₅ 10
          have h₅₇ := h₅ (-10)
          norm_num at h₃₇ h₃₈ h₃₉ h₄₀ h₄₁ h₄₂ h₄₃ h₄₄ h₄₅ h₄₆ h₄₇ h₄₈ h₄₉ h₅₀ h₅₁ h₅₂ h₅₃ h₅₄ h₅₅ h₅₆ h₅₇
          <;>
            (try contradiction) <;>
            (try omega) <;>
            (try {
              have h₅₈ := h₄.coeff_natDegree
              have h₅₉ : f.coeff f.natDegree = 1 := by
                exact h₄.coeff_natDegree
              simp_all [Polynomial.coeff_eq_zero_of_natDegree_lt]
              <;> norm_num at *
              <;> omega
            }) <;>
            (try {
              have h₅₈ := h₄.coeff_natDegree
              have h₅₉ : f.coeff f.natDegree = 1 := by
                exact h₄.coeff_natDegree
              simp_all [Polynomial.coeff_eq_zero_of_natDegree_lt]
              <;> norm_num at *
              <;> omega
            })
        -- Conclude that the assumption `f.natDegree < 25` is false
        linarith
      -- Conclude that `f` cannot be monic
      exact h₁₁ h₄
    -- Conclude that `f.natDegree ≥ 25`
    exact h₆
  
  have h₃ : sInf {d : ℕ | ∃ f : Polynomial ℤ, hdivnallx f ∧ d = f.natDegree} = (25 : ℕ) := by
    have h₄ : sInf {d : ℕ | ∃ f : Polynomial ℤ, hdivnallx f ∧ d = f.natDegree} = 25 := by
      apply le_antisymm
      · -- Show that the infimum is less than or equal to 25
        apply csInf_le
        · -- The set is non-empty
          exact ⟨25, h₁⟩
        · -- 25 is in the set
          exact h₁
      · -- Show that the infimum is greater than or equal to 25
        have h₅ : ∀ d ∈ {d : ℕ | ∃ f : Polynomial ℤ, hdivnallx f ∧ d = f.natDegree}, (25 : ℕ) ≤ d := h₂
        have h₆ : (25 : ℕ) ≤ sInf {d : ℕ | ∃ f : Polynomial ℤ, hdivnallx f ∧ d = f.natDegree} := by
          -- Use the fact that 25 is less than or equal to every element in the set
          have h₇ : ∃ d : ℕ, d ∈ {d : ℕ | ∃ f : Polynomial ℤ, hdivnallx f ∧ d = f.natDegree} := ⟨25, h₁⟩
          have h₈ : ∀ d ∈ {d : ℕ | ∃ f : Polynomial ℤ, hdivnallx f ∧ d = f.natDegree}, (25 : ℕ) ≤ d := h₂
          have h₉ : (25 : ℕ) ≤ sInf {d : ℕ | ∃ f : Polynomial ℤ, hdivnallx f ∧ d = f.natDegree} := by
            -- Use the property of the infimum
            apply le_csInf
            · -- The set is non-empty
              exact h₇
            · -- 25 is less than or equal to every element in the set
              intro d hd
              exact h₈ d hd
          exact h₉
        exact h₆
    simpa using h₄
  
  apply h₃