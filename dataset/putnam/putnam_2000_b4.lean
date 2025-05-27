theorem putnam_2000_b4
(f : ℝ → ℝ)
(hfcont : Continuous f)
(hf : ∀ x, f (2 * x ^ 2 - 1) = 2 * x * f x)
: ∀ x, x ∈ Icc (-1) 1 → f x = 0 := by
  have h1 : f 1 = 0 := by
    have h₁ : f (2 * (1 : ℝ) ^ 2 - 1) = 2 * (1 : ℝ) * f 1 := by
      apply hf
    have h₂ : f (2 * (1 : ℝ) ^ 2 - 1) = f 1 := by
      norm_num at h₁ ⊢
      <;> linarith
    have h₃ : f 1 = 2 * (1 : ℝ) * f 1 := by
      linarith
    have h₄ : f 1 = 0 := by
      linarith
    exact h₄
  
  have h2 : f (-1) = 0 := by
    have h₂ : f (2 * (-1 : ℝ) ^ 2 - 1) = 2 * (-1 : ℝ) * f (-1) := by
      apply hf
    have h₃ : f (2 * (-1 : ℝ) ^ 2 - 1) = f 1 := by
      norm_num at h₂ ⊢
      <;> linarith
    have h₄ : f 1 = 2 * (-1 : ℝ) * f (-1) := by
      linarith
    have h₅ : f (-1) = 0 := by
      linarith [h1]
    exact h₅
  
  have h3 : f (-1/2) = 0 := by
    have h₃ : f (2 * (-1 / 2 : ℝ) ^ 2 - 1) = 2 * (-1 / 2 : ℝ) * f (-1 / 2 : ℝ) := by
      apply hf
    have h₄ : f (2 * (-1 / 2 : ℝ) ^ 2 - 1) = f (-1 / 2 : ℝ) := by
      have h₅ : (2 * (-1 / 2 : ℝ) ^ 2 - 1 : ℝ) = (-1 / 2 : ℝ) := by
        norm_num
      rw [h₅]
    have h₅ : f (-1 / 2 : ℝ) = 2 * (-1 / 2 : ℝ) * f (-1 / 2 : ℝ) := by
      linarith
    have h₆ : f (-1 / 2 : ℝ) = 0 := by
      have h₇ : f (-1 / 2 : ℝ) = -f (-1 / 2 : ℝ) := by
        linarith
      have h₈ : f (-1 / 2 : ℝ) = 0 := by
        linarith
      exact h₈
    exact h₆
  
  have h4 : ∀ x, x ∈ Icc (-1) 1 → f x = 0 := by
    intro x hx
    by_contra h
    have hx₁ : -1 ≤ x := by exact hx.1
    have hx₂ : x ≤ 1 := by exact hx.2
    have h5 : ContinuousOn f (Icc (-1) 1) := hfcont.continuousOn
    have h6 : IsCompact (Icc (-1) 1) := isCompact_Icc
    have h7 : ∃ x₀ ∈ Icc (-1) 1, ∀ y ∈ Icc (-1) 1, abs (f y) ≤ abs (f x₀) := by
      -- Use the extreme value theorem to find the maximum of |f(x)| on [-1, 1]
      have h8 : ∃ x₀ ∈ Icc (-1) 1, ∀ y ∈ Icc (-1) 1, abs (f y) ≤ abs (f x₀) := by
        -- Use the fact that |f| is continuous and the interval is compact
        have h9 : ContinuousOn (fun y => abs (f y)) (Icc (-1) 1) := ContinuousOn.abs h5
        obtain ⟨x₀, hx₀, hx₀_max⟩ :=
          IsCompact.exists_forall_ge h6 (Set.nonempty_Icc.mpr (by linarith)) h9
        exact ⟨x₀, hx₀, fun y hy => by
          have h10 := hx₀_max y hy
          simpa using h10⟩
      exact h8
    obtain ⟨x₀, hx₀, hx₀_max⟩ := h7
    have h8 : x₀ ∈ Icc (-1) 1 := hx₀
    have h9 : ∀ y ∈ Icc (-1) 1, abs (f y) ≤ abs (f x₀) := hx₀_max
    have h10 : abs (f x₀) > 0 := by
      have h11 : f x ≠ 0 := h
      have h12 : x ∈ Icc (-1) 1 := hx
      have h13 : abs (f x) > 0 := by
        have h14 : f x ≠ 0 := h
        have h15 : abs (f x) > 0 := by
          apply abs_pos.mpr
          exact h14
        exact h15
      have h16 : abs (f x) ≤ abs (f x₀) := h9 x h12
      linarith
    have h11 : x₀ ∈ Icc (-1) 1 := hx₀
    have h12 : -1 ≤ x₀ := h11.1
    have h13 : x₀ ≤ 1 := h11.2
    have h14 : ∃ (y : ℝ), y ∈ Icc (-1) 1 ∧ 2 * y ^ 2 - 1 = x₀ := by
      -- Find y such that 2y² - 1 = x₀
      have h15 : -1 ≤ x₀ := h12
      have h16 : x₀ ≤ 1 := h13
      have h17 : 0 ≤ (x₀ + 1) / 2 := by linarith
      have h18 : (x₀ + 1) / 2 ≤ 1 := by linarith
      use Real.sqrt ((x₀ + 1) / 2)
      constructor
      · -- Prove y ∈ Icc (-1) 1
        constructor
        · -- Prove -1 ≤ y
          have h19 : 0 ≤ (x₀ + 1) / 2 := by linarith
          have h20 : 0 ≤ Real.sqrt ((x₀ + 1) / 2) := Real.sqrt_nonneg _
          have h21 : Real.sqrt ((x₀ + 1) / 2) ≥ 0 := by linarith
          have h22 : -1 ≤ Real.sqrt ((x₀ + 1) / 2) := by
            by_contra h23
            have h24 : Real.sqrt ((x₀ + 1) / 2) < -1 := by linarith
            have h25 : Real.sqrt ((x₀ + 1) / 2) ^ 2 > 1 := by
              nlinarith [Real.sqrt_nonneg ((x₀ + 1) / 2), Real.sq_sqrt (show 0 ≤ (x₀ + 1) / 2 by linarith)]
            nlinarith [Real.sqrt_nonneg ((x₀ + 1) / 2), Real.sq_sqrt (show 0 ≤ (x₀ + 1) / 2 by linarith)]
          exact h22
        · -- Prove y ≤ 1
          have h19 : 0 ≤ (x₀ + 1) / 2 := by linarith
          have h20 : Real.sqrt ((x₀ + 1) / 2) ≤ 1 := by
            apply Real.sqrt_le_iff.mpr
            constructor
            · nlinarith
            · nlinarith
          nlinarith [Real.sq_sqrt (show 0 ≤ (x₀ + 1) / 2 by linarith)]
      · -- Prove 2 * y ^ 2 - 1 = x₀
        have h19 : 0 ≤ (x₀ + 1) / 2 := by linarith
        have h20 : 2 * (Real.sqrt ((x₀ + 1) / 2)) ^ 2 - 1 = x₀ := by
          nlinarith [Real.sq_sqrt (show 0 ≤ (x₀ + 1) / 2 by linarith)]
        exact h20
    obtain ⟨y, hy, hy_eq⟩ := h14
    have h15 : y ∈ Icc (-1) 1 := hy
    have h16 : 2 * y ^ 2 - 1 = x₀ := hy_eq
    have h17 : f x₀ = f (2 * y ^ 2 - 1) := by rw [h16]
    have h18 : f (2 * y ^ 2 - 1) = 2 * y * f y := by
      apply hf
    have h19 : f x₀ = 2 * y * f y := by linarith
    have h20 : abs (f x₀) = abs (2 * y * f y) := by rw [h19]
    have h21 : abs (f y) ≤ abs (f x₀) := h9 y h15
    have h22 : abs (2 * y * f y) = 2 * abs y * abs (f y) := by
      simp [abs_mul, abs_mul, abs_of_nonneg, abs_of_nonpos, abs_of_pos, abs_of_neg]
      <;>
      cases' le_or_lt 0 y with h h <;>
      cases' le_or_lt 0 (f y) with h' h' <;>
      simp_all [abs_of_nonneg, abs_of_pos, abs_of_nonpos, abs_of_neg, le_of_lt] <;>
      ring_nf <;>
      nlinarith
    have h23 : abs (f x₀) = 2 * abs y * abs (f y) := by
      rw [h20, h22]
    have h24 : 2 * abs y * abs (f y) ≤ 2 * abs y * abs (f x₀) := by
      have h25 : abs (f y) ≤ abs (f x₀) := h9 y h15
      have h26 : 2 * abs y * abs (f y) ≤ 2 * abs y * abs (f x₀) := by
        gcongr
      exact h26
    have h25 : abs (f x₀) ≤ 2 * abs y * abs (f x₀) := by linarith
    have h26 : abs y ≥ 1 / 2 := by
      by_contra h27
      have h28 : abs y < 1 / 2 := by linarith
      have h29 : 2 * abs y < 1 := by linarith
      have h30 : 2 * abs y * abs (f x₀) < abs (f x₀) := by
        have h31 : 0 < abs (f x₀) := by linarith
        have h32 : 2 * abs y < 1 := by linarith
        have h33 : 2 * abs y * abs (f x₀) < abs (f x₀) := by
          nlinarith
        exact h33
      have h34 : abs (f x₀) < abs (f x₀) := by linarith
      linarith
    have h27 : y ∈ Icc (-1) 1 := h15
    have h28 : -1 ≤ y := h27.1
    have h29 : y ≤ 1 := h27.2
    have h30 : abs y ≥ 1 / 2 := h26
    have h31 : y = 1 / 2 ∨ y = -1 / 2 := by
      cases' le_or_lt 0 y with h32 h32
      · -- Case: y ≥ 0
        have h33 : abs y = y := by
          rw [abs_of_nonneg h32]
        have h34 : y ≥ 1 / 2 := by linarith
        have h35 : y ≤ 1 := h29
        have h36 : y = 1 / 2 := by
          by_contra h37
          have h38 : y > 1 / 2 := by
            by_cases h39 : y > 1 / 2
            · exact h39
            · exfalso
              have h40 : y ≤ 1 / 2 := by linarith
              have h41 : y ≥ 1 / 2 := by linarith
              have h42 : y = 1 / 2 := by linarith
              contradiction
          have h43 : 2 * y ^ 2 - 1 > -1 / 2 := by
            nlinarith
          have h44 : f (2 * y ^ 2 - 1) = 2 * y * f y := by
            apply hf
          have h45 : abs (f y) ≤ abs (f x₀) := h9 y h15
          have h46 : abs (f (2 * y ^ 2 - 1)) ≤ abs (f x₀) := h9 (2 * y ^ 2 - 1) (by
            constructor <;> nlinarith [h28, h29, h38, h43])
          have h47 : abs (2 * y * f y) ≤ abs (f x₀) := by
            rw [← h44]
            exact h46
          have h48 : 2 * abs y * abs (f y) ≤ abs (f x₀) := by
            have h49 : abs (2 * y * f y) = 2 * abs y * abs (f y) := by
              simp [abs_mul, abs_mul, abs_of_nonneg, abs_of_nonpos, abs_of_pos, abs_of_neg]
              <;>
              cases' le_or_lt 0 y with h h <;>
              cases' le_or_lt 0 (f y) with h' h' <;>
              simp_all [abs_of_nonneg, abs_of_pos, abs_of_nonpos, abs_of_neg, le_of_lt] <;>
              ring_nf <;>
              nlinarith
            rw [h49] at h47
            exact h47
          have h50 : abs (f x₀) ≤ 2 * abs y * abs (f x₀) := by linarith
          have h51 : 2 * abs y * abs (f x₀) ≤ abs (f x₀) := by
            have h52 : 2 * abs y * abs (f x₀) ≤ abs (f x₀) := by
              nlinarith [Real.sqrt_nonneg ((x₀ + 1) / 2), Real.sq_sqrt (show 0 ≤ (x₀ + 1) / 2 by linarith)]
            exact h52
          nlinarith
        exact Or.inl h36
      · -- Case: y < 0
        have h33 : abs y = -y := by
          rw [abs_of_neg h32]
        have h34 : -y ≥ 1 / 2 := by linarith
        have h35 : y ≤ 1 := h29
        have h36 : y = -1 / 2 := by
          by_contra h37
          have h38 : y < -1 / 2 := by
            by_cases h39 : y < -1 / 2
            · exact h39
            · exfalso
              have h40 : y ≥ -1 / 2 := by linarith
              have h41 : y ≤ -1 / 2 := by
                by_contra h42
                have h43 : y > -1 / 2 := by linarith
                have h44 : y = -1 / 2 := by linarith
                contradiction
              have h42 : y = -1 / 2 := by linarith
              contradiction
          have h43 : 2 * y ^ 2 - 1 > -1 / 2 := by
            nlinarith
          have h44 : f (2 * y ^ 2 - 1) = 2 * y * f y := by
            apply hf
          have h45 : abs (f y) ≤ abs (f x₀) := h9 y h15
          have h46 : abs (f (2 * y ^ 2 - 1)) ≤ abs (f x₀) := h9 (2 * y ^ 2 - 1) (by
            constructor <;> nlinarith [h28, h29, h38, h43])
          have h47 : abs (2 * y * f y) ≤ abs (f x₀) := by
            rw [← h44]
            exact h46
          have h48 : 2 * abs y * abs (f y) ≤ abs (f x₀) := by
            have h49 : abs (2 * y * f y) = 2 * abs y * abs (f y) := by
              simp [abs_mul, abs_mul, abs_of_nonneg, abs_of_nonpos, abs_of_pos, abs_of_neg]
              <;>
              cases' le_or_lt 0 y with h h <;>
              cases' le_or_lt 0 (f y) with h' h' <;>
              simp_all [abs_of_nonneg, abs_of_pos, abs_of_nonpos, abs_of_neg, le_of_lt] <;>
              ring_nf <;>
              nlinarith
            rw [h49] at h47
            exact h47
          have h50 : abs (f x₀) ≤ 2 * abs y * abs (f x₀) := by linarith
          have h51 : 2 * abs y * abs (f x₀) ≤ abs (f x₀) := by
            have h52 : 2 * abs y * abs (f x₀) ≤ abs (f x₀) := by
              nlinarith [Real.sqrt_nonneg ((x₀ + 1) / 2), Real.sq_sqrt (show 0 ≤ (x₀ + 1) / 2 by linarith)]
            exact h52
          nlinarith
        exact Or.inr h36
    cases h31 with
    | inl h32 =>
      have h33 : y = 1 / 2 := h32
      have h34 : y ∈ Icc (-1) 1 := h15
      have h35 : f x₀ = 2 * y * f y := h19
      have h36 : f y = 0 := by
        have h37 : f (2 * y ^ 2 - 1) = 2 * y * f y := by apply hf
        have h38 : f (2 * y ^ 2 - 1) = f (-1 / 2) := by
          rw [h33]
          <;> norm_num <;> linarith
        have h39 : f (-1 / 2) = 0 := h3
        have h40 : 2 * y * f y = 0 := by
          linarith
        have h41 : y = 1 / 2 := h33
        rw [h41] at h40
        norm_num at h40 ⊢
        <;>
        linarith
      have h37 : f x₀ = 0 := by
        rw [h35, h36]
        <;> ring_nf
        <;> simp_all
        <;> linarith
      have h38 : abs (f x₀) > 0 := h10
      linarith
    | inr h32 =>
      have h33 : y = -1 / 2 := h32
      have h34 : y ∈ Icc (-1) 1 := h15
      have h35 : f x₀ = 2 * y * f y := h19
      have h36 : f y = 0 := by
        have h37 : f (2 * y ^ 2 - 1) = 2 * y * f y := by apply hf
        have h38 : f (2 * y ^ 2 - 1) = f (-1 / 2) := by
          rw [h33]
          <;> norm_num <;> linarith
        have h39 : f (-1 / 2) = 0 := h3
        have h40 : 2 * y * f y = 0 := by
          linarith
        have h41 : y = -1 / 2 := h33
        rw [h41] at h40
        norm_num at h40 ⊢
        <;>
        linarith
      have h37 : f x₀ = 0 := by
        rw [h35, h36]
        <;> ring_nf
        <;> simp_all
        <;> linarith
      have h38 : abs (f x₀) > 0 := h10
      linarith
  
  exact h4