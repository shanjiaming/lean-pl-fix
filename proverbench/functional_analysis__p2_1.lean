theorem series_convergence' {b : ℕ → ℝ} (h_pos : ∀ n, b n > 0)
  (h_lim : Tendsto b atTop (𝓝 (1/2))): Summable (fun n => |b n^n * cos (n * π) / n|) := by
  have h_main : Summable (fun n => (b n)^n / n : ℕ → ℝ) := by
    have h₁ : ∃ (N : ℕ), ∀ n ≥ N, b n < 3 / 4 := by
      have h₂ : Filter.Tendsto b atTop (𝓝 (1 / 2)) := h_lim
      have h₃ : ∀ᶠ (n : ℕ) in atTop, b n ∈ Set.Ioo (1 / 2 - 1 / 4) (1 / 2 + 1 / 4) := by
        have h₄ : Filter.Tendsto b atTop (𝓝 (1 / 2)) := h_lim
        have h₅ : (1 / 2 : ℝ) - 1 / 4 < 1 / 2 + 1 / 4 := by norm_num
        have h₆ : b ⁻¹' Set.Ioo (1 / 2 - 1 / 4) (1 / 2 + 1 / 4) ∈ atTop := by
          apply h₄ (IsOpen.mem_nhds isOpen_Ioo)
          norm_num [Set.mem_Ioo]
        exact h₆
      have h₇ : ∃ (N : ℕ), ∀ (n : ℕ), n ≥ N → b n ∈ Set.Ioo (1 / 2 - 1 / 4) (1 / 2 + 1 / 4) := by
        rw [Filter.eventually_atTop] at h₃
        obtain ⟨N, hN⟩ := h₃
        exact ⟨N, fun n hn => hN n hn⟩
      obtain ⟨N, hN⟩ := h₇
      refine' ⟨N, fun n hn => _⟩
      have h₈ : b n ∈ Set.Ioo (1 / 2 - 1 / 4) (1 / 2 + 1 / 4) := hN n hn
      have h₉ : b n < 1 / 2 + 1 / 4 := h₈.2
      norm_num at h₉ ⊢
      <;> linarith
    obtain ⟨N, hN⟩ := h₁
    have h₂ : Summable (fun n => (b n)^n / n : ℕ → ℝ) := by
      have h₃ : ∀ n ≥ N, (b n : ℝ) < 3 / 4 := by
        intro n hn
        exact hN n hn
      have h₄ : Summable (fun n : ℕ => ((3 / 4 : ℝ) : ℝ) ^ n : ℕ → ℝ) := by
        apply summable_geometric_of_lt_one
        <;> norm_num
      have h₅ : ∀ n ≥ N, (b n : ℝ) ^ n / n ≤ ((3 / 4 : ℝ) : ℝ) ^ n := by
        intro n hn
        have h₅₁ : (b n : ℝ) < 3 / 4 := h₃ n hn
        have h₅₂ : 0 < (b n : ℝ) := by exact_mod_cast h_pos n
        have h₅₃ : (b n : ℝ) ^ n ≤ ((3 / 4 : ℝ) : ℝ) ^ n := by
          exact pow_le_pow_of_le_left (by positivity) (by linarith) n
        have h₅₄ : (b n : ℝ) ^ n / n ≤ (b n : ℝ) ^ n := by
          cases n with
          | zero =>
            norm_num at hn ⊢
            <;> simp_all [Nat.cast_zero]
            <;> linarith
          | succ n =>
            exact div_le_self (by positivity) (by
              norm_num
              <;>
              exact_mod_cast Nat.one_le_iff_ne_zero.mpr (by intro h; simp_all))
        calc
          (b n : ℝ) ^ n / n ≤ (b n : ℝ) ^ n := h₅₄
          _ ≤ ((3 / 4 : ℝ) : ℝ) ^ n := h₅₃
      have h₆ : Summable (fun n : ℕ => (b n : ℝ) ^ n / n : ℕ → ℝ) := by
        refine' Summable.of_nonneg_of_le (fun n => _) (fun n => _) (h₄.comp_le fun n => _)
        · -- Prove nonnegativity
          exact div_nonneg (pow_nonneg (by exact_mod_cast (le_of_lt (h_pos n))) n) (Nat.cast_nonneg n)
        · -- Prove the bound
          cases n with
          | zero =>
            norm_num
            <;> simp_all [Nat.cast_zero]
            <;> linarith
          | succ n =>
            by_cases h : n.succ ≥ N
            · -- Case n.succ ≥ N
              exact h₅ _ h
            · -- Case n.succ < N
              have h₇ : n.succ < N := by linarith
              have h₈ : n.succ ≤ N := by linarith
              have h₉ : (b n.succ : ℝ) ^ n.succ / n.succ ≤ ((3 / 4 : ℝ) : ℝ) ^ n.succ := by
                have h₁₀ : (b n.succ : ℝ) ^ n.succ / n.succ ≤ (b n.succ : ℝ) ^ n.succ := by
                  exact div_le_self (by positivity) (by
                    norm_num
                    <;>
                    exact_mod_cast Nat.one_le_iff_ne_zero.mpr (by intro h; simp_all))
                have h₁₁ : (b n.succ : ℝ) ^ n.succ ≤ ((3 / 4 : ℝ) : ℝ) ^ n.succ := by
                  by_cases h₁₂ : n.succ ≥ N
                  · -- Case n.succ ≥ N
                    exact h₅ _ h₁₂
                  · -- Case n.succ < N
                    have h₁₃ : n.succ < N := by linarith
                    have h₁₄ : (b n.succ : ℝ) < 3 / 4 := by
                      have h₁₅ := hN n.succ
                      have h₁₆ : n.succ ≥ N → b n.succ < 3 / 4 := by tauto
                      have h₁₇ : ¬n.succ ≥ N := by tauto
                      have h₁₈ : b n.succ < 3 / 4 := by tauto
                      exact h₁₈
                    have h₁₅ : 0 < (b n.succ : ℝ) := by exact_mod_cast h_pos n.succ
                    have h₁₆ : (b n.succ : ℝ) ^ n.succ ≤ ((3 / 4 : ℝ) : ℝ) ^ n.succ := by
                      exact pow_le_pow_of_le_left (by positivity) (by linarith) n.succ
                    exact h₁₆
                calc
                  (b n.succ : ℝ) ^ n.succ / n.succ ≤ (b n.succ : ℝ) ^ n.succ := h₁₀
                  _ ≤ ((3 / 4 : ℝ) : ℝ) ^ n.succ := h₁₁
              exact h₉
        · -- Prove the bound for the summable function
          cases n with
          | zero =>
            norm_num
            <;> simp_all [Nat.cast_zero]
            <;> linarith
          | succ n =>
            by_cases h : n.succ ≥ N
            · -- Case n.succ ≥ N
              exact h₅ _ h
            · -- Case n.succ < N
              have h₇ : n.succ < N := by linarith
              have h₈ : n.succ ≤ N := by linarith
              have h₉ : (b n.succ : ℝ) ^ n.succ / n.succ ≤ ((3 / 4 : ℝ) : ℝ) ^ n.succ := by
                have h₁₀ : (b n.succ : ℝ) ^ n.succ / n.succ ≤ (b n.succ : ℝ) ^ n.succ := by
                  exact div_le_self (by positivity) (by
                    norm_num
                    <;>
                    exact_mod_cast Nat.one_le_iff_ne_zero.mpr (by intro h; simp_all))
                have h₁₁ : (b n.succ : ℝ) ^ n.succ ≤ ((3 / 4 : ℝ) : ℝ) ^ n.succ := by
                  by_cases h₁₂ : n.succ ≥ N
                  · -- Case n.succ ≥ N
                    exact h₅ _ h₁₂
                  · -- Case n.succ < N
                    have h₁₃ : n.succ < N := by linarith
                    have h₁₄ : (b n.succ : ℝ) < 3 / 4 := by
                      have h₁₅ := hN n.succ
                      have h₁₆ : n.succ ≥ N → b n.succ < 3 / 4 := by tauto
                      have h₁₇ : ¬n.succ ≥ N := by tauto
                      have h₁₈ : b n.succ < 3 / 4 := by tauto
                      exact h₁₈
                    have h₁₅ : 0 < (b n.succ : ℝ) := by exact_mod_cast h_pos n.succ
                    have h₁₆ : (b n.succ : ℝ) ^ n.succ ≤ ((3 / 4 : ℝ) : ℝ) ^ n.succ := by
                      exact pow_le_pow_of_le_left (by positivity) (by linarith) n.succ
                    exact h₁₆
                calc
                  (b n.succ : ℝ) ^ n.succ / n.succ ≤ (b n.succ : ℝ) ^ n.succ := h₁₀
                  _ ≤ ((3 / 4 : ℝ) : ℝ) ^ n.succ := h₁₁
              exact h₉
      exact h₆
    exact h₂
  
  have h_final : Summable (fun n => |b n^n * cos (n * π) / n|) := by
    have h₁ : (fun n => |b n^n * cos (n * π) / n| : ℕ → ℝ) = (fun n => (b n)^n / n : ℕ → ℝ) := by
      funext n
      have h₂ : |b n ^ n * Real.cos (n * Real.pi) / (n : ℝ)| = (b n) ^ n / n := by
        have h₃ : Real.cos (n * Real.pi) = (-1 : ℝ) ^ n := by
          rw [show (n : ℝ) * Real.pi = (n : ℝ) * Real.pi by rfl]
          rw [Real.cos_eq_cos_add_int_mul_two_pi _ n]
          simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
            pow_mul, pow_two, pow_three]
          <;> ring_nf
          <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
          <;> ring_nf
          <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
            pow_mul, pow_two, pow_three]
          <;> ring_nf
          <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
          <;> ring_nf
          <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
            pow_mul, pow_two, pow_three]
          <;> ring_nf
          <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
          <;> ring_nf
          <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
            pow_mul, pow_two, pow_three]
          <;> ring_nf
          <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
          <;> ring_nf
        rw [h₃]
        have h₄ : b n > 0 := h_pos n
        have h₅ : (b n : ℝ) > 0 := by exact_mod_cast h₄
        have h₆ : |(b n : ℝ) ^ n * ((-1 : ℝ) : ℝ) ^ n / (n : ℝ)| = (b n : ℝ) ^ n / n := by
          have h₇ : |(b n : ℝ) ^ n * ((-1 : ℝ) : ℝ) ^ n / (n : ℝ)| = |(b n : ℝ) ^ n| * |((-1 : ℝ) : ℝ) ^ n| / |(n : ℝ)| := by
            simp [abs_mul, abs_div, abs_of_nonneg, abs_of_nonpos, h₅.le]
            <;> ring_nf
            <;> field_simp [abs_mul, abs_div, abs_of_nonneg, abs_of_nonpos, h₅.le]
            <;> ring_nf
          rw [h₇]
          have h₈ : |(b n : ℝ) ^ n| = (b n : ℝ) ^ n := by
            exact abs_of_nonneg (by positivity)
          have h₉ : |((-1 : ℝ) : ℝ) ^ n| = 1 := by
            have h₁₀ : ((-1 : ℝ) : ℝ) ^ n = 1 ∨ ((-1 : ℝ) : ℝ) ^ n = -1 := by
              cases' Nat.even_or_odd n with h₁₀ h₁₀
              · -- Case: n is even
                rw [show ((-1 : ℝ) : ℝ) ^ n = 1 by
                  have h₁₁ : Even n := h₁₀
                  rw [even_iff_two_dvd] at h₁₁
                  obtain ⟨k, rfl⟩ := h₁₁
                  simp [pow_mul, pow_two, mul_one, mul_neg, neg_mul, neg_neg]
                  <;> ring_nf
                  <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
                    pow_mul, pow_two, pow_three]
                  <;> ring_nf
                  <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
                  <;> ring_nf
                  <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
                    pow_mul, pow_two, pow_three]
                  <;> ring_nf
                  <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
                  <;> ring_nf
                  <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
                    pow_mul, pow_two, pow_three]
                  <;> ring_nf
                  <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
                  <;> ring_nf
                  <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
                    pow_mul, pow_two, pow_three]
                  <;> ring_nf
                  <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
                  <;> ring_nf
                ]
                <;> simp
              · -- Case: n is odd
                rw [show ((-1 : ℝ) : ℝ) ^ n = -1 by
                  have h₁₁ : Odd n := h₁₀
                  rw [Odd] at h₁₁
                  obtain ⟨k, rfl⟩ := h₁₁
                  simp [pow_add, pow_mul, pow_one, mul_neg, mul_one, neg_mul, neg_neg]
                  <;> ring_nf
                  <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
                    pow_mul, pow_two, pow_three]
                  <;> ring_nf
                  <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
                  <;> ring_nf
                  <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
                    pow_mul, pow_two, pow_three]
                  <;> ring_nf
                  <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
                  <;> ring_nf
                  <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
                    pow_mul, pow_two, pow_three]
                  <;> ring_nf
                  <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
                  <;> ring_nf
                  <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
                    pow_mul, pow_two, pow_three]
                  <;> ring_nf
                  <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
                  <;> ring_nf
                ]
                <;> simp
            cases' h₁₀ with h₁₀ h₁₀ <;> simp [h₁₀, abs_of_pos, abs_of_nonneg, h₅.le]
            <;> norm_num
          have h₁₀ : |(n : ℝ)| = (n : ℝ) := by
            exact abs_of_nonneg (by
              cases n with
              | zero => norm_num
              | succ n =>
                positivity
              )
          rw [h₈, h₉, h₁₀]
          <;> field_simp [h₅.ne']
          <;> ring_nf
          <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
            pow_mul, pow_two, pow_three]
          <;> ring_nf
          <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
          <;> ring_nf
          <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
            pow_mul, pow_two, pow_three]
          <;> ring_nf
          <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
          <;> ring_nf
          <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
            pow_mul, pow_two, pow_three]
          <;> ring_nf
          <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
          <;> ring_nf
          <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
            pow_mul, pow_two, pow_three]
          <;> ring_nf
          <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
          <;> ring_nf
        rw [h₆]
        <;> field_simp [h₅.ne']
        <;> ring_nf
        <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
          pow_mul, pow_two, pow_three]
        <;> ring_nf
        <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
        <;> ring_nf
        <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
          pow_mul, pow_two, pow_three]
        <;> ring_nf
        <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
        <;> ring_nf
        <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
          pow_mul, pow_two, pow_three]
        <;> ring_nf
        <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
        <;> ring_nf
        <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
          pow_mul, pow_two, pow_three]
        <;> ring_nf
        <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
        <;> ring_nf
      rw [h₂]
      <;> simp [h_pos]
      <;> field_simp [h_pos]
      <;> ring_nf
      <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
        pow_mul, pow_two, pow_three]
      <;> ring_nf
      <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
      <;> ring_nf
      <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
        pow_mul, pow_two, pow_three]
      <;> ring_nf
      <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
      <;> ring_nf
      <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
        pow_mul, pow_two, pow_three]
      <;> ring_nf
      <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
      <;> ring_nf
      <;> simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
        pow_mul, pow_two, pow_three]
      <;> ring_nf
      <;> field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two]
      <;> ring_nf
    rw [h₁]
    exact h_main
  
  exact h_final