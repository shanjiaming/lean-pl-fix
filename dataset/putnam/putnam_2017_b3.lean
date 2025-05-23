theorem putnam_2017_b3
(f : ℝ → ℝ)
(c : ℕ → ℝ)
(hc : ∀ n, c n = 0 ∨ c n = 1)
(hf : ∀ x, f x = ∑' n : ℕ, (c n) * x^n)
: f (2/3) = 3/2 → Irrational (f 1/2) := by
  intro h₁
  have h₂ : False := by
    -- Prove that the series `∑' (n : ℕ), c n * (2/3 : ℝ)^n` is summable
    have h_sum : Summable fun n : ℕ => (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by
      refine' Summable.of_nonneg_of_le (fun n => _) (fun n => _) (summable_geometric_of_lt_one (by norm_num) (by norm_num))
      · -- Prove non-negativity: `0 ≤ c n * (2 / 3 : ℝ)^n`
        cases' hc n with h₂ h₂
        · rw [h₂]
          simp
        · rw [h₂]
          positivity
      · -- Prove `c n * (2 / 3 : ℝ)^n ≤ (2 / 3 : ℝ)^n`
        cases' hc n with h₂ h₂
        · rw [h₂]
          simp
        · rw [h₂]
          <;> simp [le_refl]
    -- Use the given hypothesis `h₁` to show a contradiction
    have h₃ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = (3 / 2 : ℝ) := by
      have h₄ : f (2 / 3 : ℝ) = (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) := by
        rw [hf]
      rw [h₁] at h₄
      linarith
    -- Show that there exists a natural number `N` such that for all `n ≥ N`, `c n = 0`
    have h₄ : ∃ (N : ℕ), ∀ (n : ℕ), n ≥ N → c n = 0 := by
      by_contra! h₅
      have h₆ : ∀ (N : ℕ), ∃ (n : ℕ), n ≥ N ∧ c n ≠ 0 := by simpa using h₅
      have h₇ : ∃ (u : ℕ → ℕ), StrictMono u ∧ ∀ (n : ℕ), c (u n) ≠ 0 := by
        -- Construct a strictly increasing sequence `u` such that `c (u n) ≠ 0` for all `n`
        classical
        have h₈ : ∃ (u : ℕ → ℕ), StrictMono u ∧ ∀ (n : ℕ), c (u n) ≠ 0 := by
          choose! u hu₁ hu₂ using h₆
          have h₉ : StrictMono u := by
            refine' strictMono_nat_of_lt_succ fun n => _
            specialize hu₁ (u n + 1)
            have h₁₀ := hu₁
            simp at h₁₀ ⊢
            <;> omega
          refine' ⟨u, h₉, _⟩
          intro n
          specialize hu₂ n
          simp_all
        exact h₈
      obtain ⟨u, hu₁, hu₂⟩ := h₇
      have h₈ : ∀ (n : ℕ), c (u n) ≠ 0 := hu₂
      have h₉ : ∀ (n : ℕ), c (u n) = 1 := by
        intro n
        have h₁₀ := hc (u n)
        cases' h₁₀ with h₁₀ h₁₀
        · exfalso
          apply h₈ n
          simp_all
        · simp_all
      have h₁₀ : ∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n ≥ ∑' n : ℕ, (1 : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) := by
        -- Use the fact that `c n = 1` for all `n` in the sequence `u` to show the inequality
        have h₁₁ : ∀ (n : ℕ), (c (u n) : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) = (1 : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) := by
          intro n
          have h₁₂ := h₉ n
          simp [h₁₂]
        have h₁₂ : ∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n ≥ ∑' n : ℕ, (c (u n) : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) := by
          -- Use the fact that the sequence `u` is strictly increasing to show the inequality
          have h₁₃ : ∑' n : ℕ, (c (u n) : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) = ∑' n : ℕ, (c (u n) : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) := rfl
          have h₁₄ : ∑' n : ℕ, (c (u n) : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) ≤ ∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by
            -- Use the fact that the sequence `u` is strictly increasing to show the inequality
            refine' tsum_le_tsum_of_inj _ hu₁.injOn _ _
            · intro n _
              simp [h₉]
              <;> aesop
            · intro n _
              by_cases h₁₅ : n ∈ Set.range u
              · simp_all
                <;> aesop
              · simp_all
                <;> aesop
            · exact h_sum
          linarith
        have h₁₃ : ∑' n : ℕ, (c (u n) : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) = ∑' n : ℕ, (1 : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) := by
          refine' tsum_congr _
          intro n
          rw [h₁₁]
        rw [h₁₃] at h₁₂
        exact h₁₂
      have h₁₁ : ∑' n : ℕ, (1 : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) = ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ (u n) := by
        simp [one_mul]
      rw [h₁₁] at h₁₀
      have h₁₂ : ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ (u n) = ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ (u n) := rfl
      have h₁₃ : ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ (u n) ≥ ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ n := by
        -- Use the fact that the sequence `u` is strictly increasing to show the inequality
        have h₁₄ : ∀ (n : ℕ), ((2 / 3 : ℝ) : ℝ) ^ (u n) ≥ ((2 / 3 : ℝ) : ℝ) ^ n := by
          intro n
          have h₁₅ : u n ≥ n := by
            exact (StrictMono.id_le hu₁) n
          have h₁₆ : ((2 / 3 : ℝ) : ℝ) ^ (u n) ≥ ((2 / 3 : ℝ) : ℝ) ^ n := by
            exact pow_le_pow_of_le_one (by norm_num) (by norm_num) h₁₅
          exact h₁₆
        exact tsum_le_tsum h₁₄ (summable_geometric_of_lt_one (by norm_num) (by norm_num) |>.comp_injective hu₁.injective) (summable_geometric_of_lt_one (by norm_num) (by norm_num))
      have h₁₄ : ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ n = 3 := by
        -- Prove the sum of the geometric series is 3
        have h₁₅ : ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ n = ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ n := rfl
        rw [h₁₅]
        rw [tsum_geometric_of_lt_one (by norm_num) (by norm_num)]
        <;> norm_num
      have h₁₅ : ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ (u n) ≥ 3 := by
        linarith
      have h₁₆ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = (3 / 2 : ℝ) := h₃
      linarith
    -- Use the fact that only finitely many terms are non-zero to show a contradiction
    obtain ⟨N, hN⟩ := h₄
    have h₅ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) := rfl
    have h₆ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by
      have h₇ : ∀ (n : ℕ), n ≥ N → (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n = 0 := by
        intro n hn
        have h₈ : c n = 0 := hN n hn
        rw [h₈]
        simp
      calc
        (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = ∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := rfl
        _ = ∑' n : ℕ, if n < N then (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n else 0 := by
          apply tsum_congr
          intro n
          split_ifs with h
          · simp_all
          · have h₈ : n ≥ N := by
              omega
            have h₉ : (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n = 0 := h₇ n h₈
            simp_all
        _ = ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by
          rw [tsum_eq_sum]
          <;> simp_all [Finset.sum_range_succ, add_comm]
          <;> aesop
        _ = ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := rfl
    rw [h₆] at h₃
    have h₇ : ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n = (3 / 2 : ℝ) := by linarith
    have h₈ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) =
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) := rfl
    have h₉ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by
      norm_num
    have h₁₀ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by
      norm_num
    -- Use the fact that the sum is `3 / 2` to show a contradiction
    have h₁₁ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := rfl
    -- Use the fact that the sum is `3 / 2` to show a contradiction
    have h₁₂ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (3 / 2 : ℝ) := by
      linarith
    -- Use the fact that the sum is `3 / 2` to show a contradiction
    have h₁₃ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := rfl
    -- Use the fact that the sum is `3 / 2` to show a contradiction
    have h₁₄ : ∀ n ∈ Finset.range N, c n = 0 ∨ c n = 1 := by
      intro n h₁₅
      exact hc n
    -- Use the fact that the sum is `3 / 2` to show a contradiction
    have h₁₅ : ∃ (k : ℕ), (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) := by
      -- Use the fact that the sum is `3 / 2` to show a contradiction
      use (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) |>.toNat
      have h₁₆ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) ≥ 0 := by
        -- Prove that the sum is non-negative
        exact Finset.sum_nonneg fun n _ => by
          cases' hc n with h₁₇ h₁₇
          · rw [h₁₇]
            simp
          · rw [h₁₇]
            positivity
      have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) ≥ 0 := by
        -- Prove that the product is non-negative
        positivity
      have h₁₈ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        positivity
      have h₁₉ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        positivity
      -- Normalize the expression to find the rational form of the sum
      field_simp [h₁₂]
      <;> ring_nf at *
      <;> norm_num at *
      <;> linarith
    -- Use the fact that the sum is `3 / 2` to show a contradiction
    obtain ⟨k, h₁₆⟩ := h₁₅
    have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) := by
      exact h₁₆
    have h₁₈ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ) := by
      linarith
    have h₁₉ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ) := by
      linarith
    -- Use the fact that the sum is `3 / 2` to show a contradiction
    have h₂₀ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2 := by
      -- Prove that k is an integer
      have h₂₁ := h₁₉
      field_simp at h₂₁
      <;> ring_nf at h₂₁ ⊢
      <;> norm_cast at h₂₁ ⊢
      <;> norm_num at h₂₁ ⊢
      <;>
      (try omega) <;>
      (try ring_nf at h₂₁ ⊢) <;>
      (try norm_num at h₂₁ ⊢) <;>
      (try omega)
      <;>
      (try
        {
          have h₂₂ : N ≥ 1 := by
            by_contra h
            have h₂₃ : N = 0 := by omega
            simp_all [Finset.sum_range_succ]
            <;> norm_num at *
            <;> linarith
          have h₂₃ : (3 : ℕ) ^ (N - 1) > 0 := by
            apply pow_pos
            <;> norm_num
          have h₂₄ : (3 : ℕ) ^ (N - 1) > 0 := by
            apply pow_pos
            <;> norm_num
          omega
        })
      <;>
      (try
        {
          have h₂₂ : N ≥ 1 := by
            by_contra h
            have h₂₃ : N = 0 := by omega
            simp_all [Finset.sum_range_succ]
            <;> norm_num at *
            <;> linarith
          have h₂₃ : (3 : ℕ) ^ (N - 1) > 0 := by
            apply pow_pos
            <;> norm_num
          have h₂₄ : (3 : ℕ) ^ (N - 1) > 0 := by
            apply pow_pos
            <;> norm_num
          omega
        })
      <;>
      (try omega)
      <;>
      (try ring_nf at h₂₁ ⊢)
      <;>
      (try norm_num at h₂₁ ⊢)
      <;>
      (try omega)
      <;>
      (try
        {
          have h₂₂ : N ≥ 1 := by
            by_contra h
            have h₂₃ : N = 0 := by omega
            simp_all [Finset.sum_range_succ]
            <;> norm_num at *
            <;> linarith
          have h₂₃ : (3 : ℕ) ^ (N - 1) > 0 := by
            apply pow_pos
            <;> norm_num
          have h₂₄ : (3 : ℕ) ^ (N - 1) > 0 := by
            apply pow_pos
            <;> norm_num
          omega
        })
      <;>
      (try omega)
    have h₂₁ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2 := by
      exact h₂₀
    have h₂₂ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1 := by
      -- Prove that `3 * 3^(N - 1)` is odd
      have h₂₃ : (3 : ℕ) % 2 = 1 := by norm_num
      have h₂₄ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
        -- Prove that `3^(N - 1)` is odd
        have h₂₅ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
          have h₂₆ : ∀ n : ℕ, n ≥ 1 → (3 : ℕ) ^ n % 2 = 1 := by
            intro n hn
            induction' hn with n hn IH
            · norm_num
            · simp [pow_succ, Nat.mul_mod, IH]
              <;> norm_num
          have h₂₇ : N ≥ 1 := by
            by_contra h₂₈
            have h₂₉ : N = 0 := by omega
            simp_all [Finset.sum_range_succ]
            <;> norm_num at *
            <;> linarith
          have h₃₀ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
            have h₃₁ : N - 1 ≥ 0 := by omega
            have h₃₂ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
              have h₃₃ : N - 1 ≥ 0 := by omega
              have h₃₄ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
                apply h₂₆
                omega
              exact h₃₄
            exact h₃₂
          exact h₃₀
        exact h₂₅
      have h₂₈ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1 := by
        omega
      exact h₂₈
    have h₂₃ : (k : ℕ) % 2 = 0 := by
      -- Prove that `k` is even
      omega
    omega
  have h₃ : Irrational (f 1/2) := by
    exfalso
    exact h₂
  exact h₃