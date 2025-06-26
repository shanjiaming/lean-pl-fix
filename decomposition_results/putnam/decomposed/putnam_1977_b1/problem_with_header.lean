import Mathlib

open RingHom Set Nat Filter Topology

-- 2 / 3
/--
Find $\prod_{n=2}^{\infty} \frac{(n^3 - 1)}{(n^3 + 1)}$.
-/
theorem putnam_1977_b1
: Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ )) := by
  have h_main : ∀ (N : ℤ), N ≥ 2 → ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)) := by 
    intro N hN
    have h₁ : ∀ (n : ℤ), n ≥ 2 → ((n : ℝ) ^ 3 - 1 : ℝ) / ((n : ℝ) ^ 3 + 1 : ℝ) = ((n : ℝ) - 1) / ((n : ℝ) + 1) * (((n : ℝ) + 1) ^ 2 - ((n : ℝ) + 1) + 1) / ((n : ℝ) ^ 2 - (n : ℝ) + 1) := by
      intro n hn
      have h₁ : (n : ℝ) ^ 3 - 1 = ((n : ℝ) - 1) * ((n : ℝ) ^ 2 + (n : ℝ) + 1 : ℝ) := by ring
      have h₂ : (n : ℝ) ^ 3 + 1 = ((n : ℝ) + 1) * ((n : ℝ) ^ 2 - (n : ℝ) + 1 : ℝ) := by ring
      rw [h₁, h₂]
      have h₃ : (n : ℝ) ≠ -1 := by
        intro h
        norm_cast at h
        <;> nlinarith
      have h₄ : (n : ℝ) ^ 2 - (n : ℝ) + 1 ≠ 0 := by
        nlinarith [sq_nonneg ((n : ℝ) - 1)]
      field_simp [h₃, h₄, sub_eq_zero, add_eq_zero_iff_eq_neg]
      <;> ring_nf
      <;> field_simp [h₃, h₄, sub_eq_zero, add_eq_zero_iff_eq_neg]
      <;> ring_nf
      <;> nlinarith [sq_nonneg ((n : ℝ) - 1)]
    have h₂ : ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)) := by
      have h₃ : ∀ (N : ℤ), N ≥ 2 → ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)) := by
        intro N hN
        have h₄ : ∀ (K : ℤ), 2 ≤ K → ∏ n in Finset.Icc (2 : ℤ) K, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (K ^ 2 + K + 1) / (3 * K * (K + 1)) := by
          intro K hK
          have h₅ : ∀ (n : ℕ), ∏ k in Finset.Icc 2 n, ((k : ℝ) ^ 3 - 1) / ((k : ℝ) ^ 3 + 1) = (2 : ℝ) * (n ^ 2 + n + 1) / (3 * n * (n + 1)) := by
            intro n
            induction' n with n ih
            · norm_num [Finset.prod_eq_one]
            · cases n with
              | zero =>
                norm_num [Finset.prod_eq_one]
              | succ n =>
                cases n with
                | zero =>
                  norm_num [Finset.prod_Icc_succ_top]
                | succ n =>
                  simp_all [Finset.prod_Icc_succ_top, Nat.cast_add, Nat.cast_one, Nat.cast_zero, Nat.cast_mul, Nat.cast_pow]
                  <;> field_simp
                  <;> ring_nf
                  <;> field_simp
                  <;> ring_nf
                  <;> nlinarith
          have h₆ : K ≥ 2 := by assumption
          have h₇ : ∏ n in Finset.Icc (2 : ℤ) K, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (K ^ 2 + K + 1) / (3 * K * (K + 1)) := by
            have h₈ : ∏ n in Finset.Icc (2 : ℤ) K, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = ∏ n in Finset.Icc 2 (K.toNat), ((n : ℝ) ^ 3 - 1) / ((n : ℝ) ^ 3 + 1) := by
              have h₉ : Finset.Icc (2 : ℤ) K = Finset.Icc 2 (K.toNat) := by
                have h₁₀ : K ≥ 0 := by linarith
                have h₁₁ : K.toNat = K.natAbs := by simp [Int.toNat_of_nonneg h₁₀]
                have h₁₂ : K.natAbs = K.toNat := by simp [Int.toNat_of_nonneg h₁₀]
                have h₁₃ : Finset.Icc (2 : ℤ) K = Finset.Icc 2 (K.toNat) := by
                  apply Finset.ext
                  intro n
                  simp [Finset.mem_Icc]
                  <;>
                  (try omega) <;>
                  (try {
                    cases' le_total 0 n with hn hn <;>
                    cases' le_total 0 K with hK hK <;>
                    simp_all [Int.toNat_of_nonneg, Int.toNat_of_nonpos, Int.ofNat_le, Int.ofNat_lt, Int.ofNat_zero,
                      Int.ofNat_succ, Int.emod_eq_of_lt] <;>
                    (try omega) <;>
                    (try {
                      norm_num at * <;>
                      omega
                    }) <;>
                    (try {
                      linarith
                    }) <;>
                    (try {
                      ring_nf at *
                      <;>
                      omega
                    })
                  })
                  <;>
                  (try omega)
                exact h₁₃
              rw [h₉]
              <;>
              simp [Finset.prod_eq_multiset_prod, Int.toNat_of_nonneg (by linarith : (0 : ℤ) ≤ K)]
              <;>
              norm_cast
              <;>
              simp_all [Int.toNat_of_nonneg, Int.toNat_of_nonpos, Int.ofNat_le, Int.ofNat_lt, Int.ofNat_zero,
                Int.ofNat_succ, Int.emod_eq_of_lt]
              <;>
              (try omega)
              <;>
              (try {
                norm_num at * <;>
                omega
              })
              <;>
              (try {
                linarith
              })
              <;>
              (try {
                ring_nf at *
                <;>
                omega
              })
            rw [h₈]
            have h₉ : ∏ n in Finset.Icc 2 (K.toNat), ((n : ℝ) ^ 3 - 1) / ((n : ℝ) ^ 3 + 1) = (2 : ℝ) * (K.toNat ^ 2 + K.toNat + 1) / (3 * (K.toNat : ℝ) * (K.toNat + 1)) := by
              have h₁₀ : ∏ n in Finset.Icc 2 (K.toNat), ((n : ℝ) ^ 3 - 1) / ((n : ℝ) ^ 3 + 1) = (2 : ℝ) * (K.toNat ^ 2 + K.toNat + 1) / (3 * (K.toNat : ℝ) * (K.toNat + 1)) := by
                have h₁₁ := h₅ (K.toNat)
                simpa using h₁₁
              exact h₁₀
            rw [h₉]
            have h₁₀ : (K.toNat : ℝ) = (K : ℝ) := by
              norm_cast
              <;>
              simp_all [Int.toNat_of_nonneg, Int.toNat_of_nonpos, Int.ofNat_le, Int.ofNat_lt, Int.ofNat_zero,
                Int.ofNat_succ, Int.emod_eq_of_lt]
              <;>
              (try omega)
              <;>
              (try {
                norm_num at * <;>
                omega
              })
              <;>
              (try {
                linarith
              })
              <;>
              (try {
                ring_nf at *
                <;>
                omega
              })
            rw [h₁₀]
            <;>
            ring_nf at *
            <;>
            field_simp at *
            <;>
            ring_nf at *
            <;>
            norm_cast at *
            <;>
            simp_all [Int.toNat_of_nonneg, Int.toNat_of_nonpos, Int.ofNat_le, Int.ofNat_lt, Int.ofNat_zero,
              Int.ofNat_succ, Int.emod_eq_of_lt]
            <;>
            (try omega)
            <;>
            (try {
              norm_num at * <;>
              omega
            })
            <;>
            (try {
              linarith
            })
            <;>
            (try {
              ring_nf at *
              <;>
              omega
            })
          exact h₇
        have h₅ : ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)) := by
          have h₆ := h₄ N hN
          exact h₆
        exact h₅
      have h₃ : ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)) := by
        have h₄ := h₃ N hN
        exact h₄
      exact h₃
    exact h₂
    <;>
    (try
      {
        simp_all
      })
    <;>
    (try
      {
        field_simp
        <;>
        ring_nf
        <;>
        norm_cast
        <;>
        simp_all [Int.toNat_of_nonneg, Int.toNat_of_nonpos, Int.ofNat_le, Int.ofNat_lt, Int.ofNat_zero, Int.ofNat_succ, Int.emod_eq_of_lt]
        <;>
        (try omega)
        <;>
        (try
          {
            norm_num at * <;>
            omega
          })
        <;>
        (try
          {
            linarith
          })
        <;>
        (try
          {
            ring_nf at *
            <;>
            omega
          })
      })
  
  have h_main_limit : Tendsto (fun (N : ℤ) ↦ (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by 
    have h₁ : Tendsto (fun (N : ℤ) ↦ (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by
      have h₂ : Tendsto (fun (N : ℤ) ↦ (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by
        -- Establish the limit of the sequence as N → ∞ using the properties of polynomials and rational functions.
        have h₃ : Tendsto (fun (N : ℤ) ↦ (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by
          -- Use the fact that the numerator is a cubic polynomial and the denominator is a cubic polynomial to apply the limit properties.
          have h₄ : Tendsto (fun (N : ℤ) ↦ (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by
            -- Simplify the expression to show that it approaches 2/3 as N → ∞.
            have h₅ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by
              -- Use the limit properties to evaluate the limit.
              have h₆ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by
                -- Use the limit properties to evaluate the limit.
                have h₇ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by
                  -- Use the limit properties to evaluate the limit.
                  have h₈ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by
                    -- Use the properties of limits to evaluate the limit.
                    have h₉ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by
                      -- Use the properties of limits to evaluate the limit.
                      have h₁₀ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by
                        -- Use the properties of limits to evaluate the limit.
                        have h₁₁ : (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) = (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) := rfl
                        rw [h₁₁]
                        -- Use the properties of limits to evaluate the limit.
                        have h₁₂ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by
                          -- Use the properties of limits to evaluate the limit.
                          have h₁₃ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by
                            -- Use the properties of limits to evaluate the limit.
                            have h₁₄ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by
                              -- Use the properties of limits to evaluate the limit.
                              have h₁₅ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by
                                -- Use the properties of limits to evaluate the limit.
                                convert Tendsto.const_mul (2 / 3 : ℝ) (tendsto_const_nhds : Tendsto (fun (N : ℤ) => (1 : ℝ)) atTop (𝓝 1)) using 1
                                <;>
                                simp [mul_comm]
                                <;>
                                field_simp
                                <;>
                                ring_nf
                                <;>
                                norm_num
                                <;>
                                simp_all [mul_comm]
                                <;>
                                norm_num
                                <;>
                                simp_all [mul_comm]
                                <;>
                                norm_num
                                <;>
                                linarith
                              exact h₁₅
                            exact h₁₄
                          exact h₁₃
                        exact h₁₂
                      exact h₁₀
                    exact h₉
                  exact h₈
                exact h₇
              exact h₆
            exact h₅
          exact h₄
        exact h₃
      exact h₂
    exact h₁
  
  have h_final : Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ )) := by
    have h₂ : Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)) := by
      have h₃ : ∀ᶠ (N : ℤ) in atTop, ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)) := by
        filter_upwards [eventually_ge_atTop (2 : ℤ)] with N hN
        exact h_main N hN
      have h₄ : Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)) := by
        have h₅ : Tendsto (fun (N : ℤ) ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3 : ℝ))) := by
          apply Tendsto.congr' _ h_main_limit
          apply h₃.mono
          intro N hN
          rw [hN]
        exact h₅
      exact h₄
    exact h₂
  
  exact h_final