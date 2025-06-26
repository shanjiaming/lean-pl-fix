import Mathlib

/--
Let $f$ be a real function on the real line with continuous third derivative.  Prove that there exists a point $a$ such that \[f(a)\cdot f'(a) \cdot f''(a) \cdot f'''(a)\geq 0 .\]
-/
theorem putnam_1998_a3
(f : ℝ → ℝ)
(hf : ContDiff ℝ 3 f)
: ∃ a : ℝ, (f a) * (deriv f a) * (iteratedDeriv 2 f a) * (iteratedDeriv 3 f a) ≥ 0 := by
  have h1 : (∃ (a : ℝ), deriv f a = 0) → ∃ (a : ℝ), (f a) * (deriv f a) * (iteratedDeriv 2 f a) * (iteratedDeriv 3 f a) ≥ 0 := by
    intro h
    obtain ⟨a, ha⟩ := h
    refine' ⟨a, _⟩
    have h₁ : deriv f a = 0 := ha
    have h₂ : (f a) * (deriv f a) * (iteratedDeriv 2 f a) * (iteratedDeriv 3 f a) = 0 := by
      simp [h₁, mul_assoc]
    linarith
  
  have h2 : (∃ (a : ℝ), iteratedDeriv 2 f a = 0) → ∃ (a : ℝ), (f a) * (deriv f a) * (iteratedDeriv 2 f a) * (iteratedDeriv 3 f a) ≥ 0 := by
    intro h
    obtain ⟨a, ha⟩ := h
    refine' ⟨a, _⟩
    have h₁ : iteratedDeriv 2 f a = 0 := ha
    have h₂ : (f a) * (deriv f a) * (iteratedDeriv 2 f a) * (iteratedDeriv 3 f a) = 0 := by
      simp [h₁, mul_assoc]
    linarith
  
  have h3 : (∃ (a : ℝ), iteratedDeriv 3 f a = 0) → ∃ (a : ℝ), (f a) * (deriv f a) * (iteratedDeriv 2 f a) * (iteratedDeriv 3 f a) ≥ 0 := by
    intro h
    obtain ⟨a, ha⟩ := h
    refine' ⟨a, _⟩
    have h₁ : iteratedDeriv 3 f a = 0 := ha
    have h₂ : (f a) * (deriv f a) * (iteratedDeriv 2 f a) * (iteratedDeriv 3 f a) = 0 := by
      simp [h₁, mul_assoc]
    linarith
  
  have h4 : (∃ (a : ℝ), f a = 0) → ∃ (a : ℝ), (f a) * (deriv f a) * (iteratedDeriv 2 f a) * (iteratedDeriv 3 f a) ≥ 0 := by
    intro h
    obtain ⟨a, ha⟩ := h
    refine' ⟨a, _⟩
    have h₁ : f a = 0 := ha
    have h₂ : (f a) * (deriv f a) * (iteratedDeriv 2 f a) * (iteratedDeriv 3 f a) = 0 := by
      simp [h₁, mul_assoc]
    linarith
  
  have h_main : (∀ (x : ℝ), f x ≠ 0) → (∀ (x : ℝ), deriv f x ≠ 0) → (∀ (x : ℝ), iteratedDeriv 2 f x ≠ 0) → (∀ (x : ℝ), iteratedDeriv 3 f x ≠ 0) → ∃ (a : ℝ), (f a) * (deriv f a) * (iteratedDeriv 2 f a) * (iteratedDeriv 3 f a) ≥ 0 := by
    intro hf₁ hf₂ hf₃ hf₄
    -- We use the fact that the product is continuous and the derivatives are never zero to find a point where the product is non-negative.
    have h₅ : ∃ (a : ℝ), (f a) * (deriv f a) * (iteratedDeriv 2 f a) * (iteratedDeriv 3 f a) ≥ 0 := by
      by_contra h
      -- Assume the product is always negative, and derive a contradiction.
      push_neg at h
      have h₆ : ∀ (x : ℝ), (f x) * (deriv f x) * (iteratedDeriv 2 f x) * (iteratedDeriv 3 f x) < 0 := by simpa using h
      -- Use the fact that the product is negative everywhere to find a contradiction.
      have h₇ : ∀ (x : ℝ), f x ≠ 0 := hf₁
      have h₈ : ∀ (x : ℝ), deriv f x ≠ 0 := hf₂
      have h₉ : ∀ (x : ℝ), iteratedDeriv 2 f x ≠ 0 := hf₃
      have h₁₀ : ∀ (x : ℝ), iteratedDeriv 3 f x ≠ 0 := hf₄
      -- Use the fact that the product is negative everywhere to find a contradiction.
      have h₁₁ : ∀ (x : ℝ), f x ≠ 0 := hf₁
      have h₁₂ : ∀ (x : ℝ), deriv f x ≠ 0 := hf₂
      have h₁₃ : ∀ (x : ℝ), iteratedDeriv 2 f x ≠ 0 := hf₃
      have h₁₄ : ∀ (x : ℝ), iteratedDeriv 3 f x ≠ 0 := hf₄
      -- Use the fact that the product is negative everywhere to find a contradiction.
      have h₁₅ : ContinuousOn (fun x ↦ (f x) * (deriv f x) * (iteratedDeriv 2 f x) * (iteratedDeriv 3 f x)) Set.univ := by
        have h₁₅₁ : ContinuousOn (fun x ↦ f x) Set.univ := (hf.continuous).continuousOn
        have h₁₅₂ : ContinuousOn (fun x ↦ deriv f x) Set.univ := by
          have h₁₅₂₁ : ContDiff ℝ 1 f := by
            exact hf.of_le (by norm_num)
          exact h₁₅₂₁.continuous.continuousOn
        have h₁₅₃ : ContinuousOn (fun x ↦ iteratedDeriv 2 f x) Set.univ := by
          have h₁₅₃₁ : ContDiff ℝ 2 f := by
            exact hf.of_le (by norm_num)
          exact h₁₅₃₁.continuous_iteratedDeriv (by norm_num) |>.continuousOn
        have h₁₅₄ : ContinuousOn (fun x ↦ iteratedDeriv 3 f x) Set.univ := by
          have h₁₅₄₁ : ContDiff ℝ 3 f := hf
          exact h₁₅₄₁.continuous_iteratedDeriv (by norm_num) |>.continuousOn
        -- Use the fact that the product of continuous functions is continuous.
        have h₁₅₅ : ContinuousOn (fun x ↦ (f x) * (deriv f x) * (iteratedDeriv 2 f x) * (iteratedDeriv 3 f x)) Set.univ := by
          have h₁₅₅₁ : ContinuousOn (fun x ↦ (f x) * (deriv f x)) Set.univ :=
            ContinuousOn.mul h₁₅₁ h₁₅₂
          have h₁₅₅₂ : ContinuousOn (fun x ↦ (f x) * (deriv f x) * (iteratedDeriv 2 f x)) Set.univ :=
            ContinuousOn.mul h₁₅₅₁ h₁₅₃
          have h₁₅₅₃ : ContinuousOn (fun x ↦ (f x) * (deriv f x) * (iteratedDeriv 2 f x) * (iteratedDeriv 3 f x)) Set.univ :=
            ContinuousOn.mul h₁₅₅₂ h₁₅₄
          exact h₁₅₅₃
        exact h₁₅₅
      -- Use the fact that the product is negative everywhere to find a contradiction.
      have h₁₆ : ∃ (a : ℝ), (f a) * (deriv f a) * (iteratedDeriv 2 f a) * (iteratedDeriv 3 f a) ≥ 0 := by
        by_contra h₁₆
        push_neg at h₁₆
        have h₁₇ := h₁₆
        have h₁₈ := h₆ 0
        have h₁₉ := h₆ 1
        have h₂₀ := h₆ (-1)
        have h₂₁ := h₆ 2
        have h₂₂ := h₆ (-2)
        norm_num at h₁₈ h₁₉ h₂₀ h₂₁ h₂₂
        <;>
        (try
          norm_num) <;>
        (try
          linarith) <;>
        (try
          exact absurd h₁₈ (by linarith)) <;>
        (try
          exact absurd h₁₉ (by linarith)) <;>
        (try
          exact absurd h₂₀ (by linarith)) <;>
        (try
          exact absurd h₂₁ (by linarith)) <;>
        (try
          exact absurd h₂₂ (by linarith))
      obtain ⟨a, ha⟩ := h₁₆
      have h₁₇ := h₆ a
      linarith
    exact h₅
  
  have h_final : ∃ (a : ℝ), (f a) * (deriv f a) * (iteratedDeriv 2 f a) * (iteratedDeriv 3 f a) ≥ 0 := by
    by_cases h : ∃ (a : ℝ), f a = 0
    · -- Case 1: There exists a point `a` where `f a = 0`.
      exact h4 h
    · -- Case 2: No such `a` exists, i.e., `f x ≠ 0` for all `x`.
      push_neg at h
      -- Now we know `f x ≠ 0` for all `x`.
      by_cases h₂ : ∃ (a : ℝ), deriv f a = 0
      · -- Case 2.1: There exists a point `a` where `deriv f a = 0`.
        exact h1 h₂
      · -- Case 2.2: No such `a` exists, i.e., `deriv f x ≠ 0` for all `x`.
        push_neg at h₂
        -- Now we know `deriv f x ≠ 0` for all `x`.
        by_cases h₃ : ∃ (a : ℝ), iteratedDeriv 2 f a = 0
        · -- Case 2.2.1: There exists a point `a` where `iteratedDeriv 2 f a = 0`.
          exact h2 h₃
        · -- Case 2.2.2: No such `a` exists, i.e., `iteratedDeriv 2 f x ≠ 0` for all `x`.
          push_neg at h₃
          -- Now we know `iteratedDeriv 2 f x ≠ 0` for all `x`.
          by_cases h₄ : ∃ (a : ℝ), iteratedDeriv 3 f a = 0
          · -- Case 2.2.2.1: There exists a point `a` where `iteratedDeriv 3 f a = 0`.
            exact h3 h₄
          · -- Case 2.2.2.2: No such `a` exists, i.e., `iteratedDeriv 3 f x ≠ 0` for all `x`.
            push_neg at h₄
            -- All derivatives are non-zero everywhere.
            have h₅ : ∀ (x : ℝ), f x ≠ 0 := h
            have h₆ : ∀ (x : ℝ), deriv f x ≠ 0 := h₂
            have h₇ : ∀ (x : ℝ), iteratedDeriv 2 f x ≠ 0 := h₃
            have h₈ : ∀ (x : ℝ), iteratedDeriv 3 f x ≠ 0 := h₄
            -- Apply `h_main` to conclude the proof.
            exact h_main h₅ h₆ h₇ h₈
  
  by_cases h : ∃ (a : ℝ), f a = 0
  · -- Case 1: There exists a with f a = 0
    exact h4 h
  · -- Case 2: f a ≠ 0 for all a
    by_cases h₁ : ∃ (a : ℝ), deriv f a = 0
    · -- Subcase 2.1: There exists a with deriv f a = 0
      exact h1 h₁
    · -- Subcase 2.2: deriv f a ≠ 0 for all a
      by_cases h₂ : ∃ (a : ℝ), iteratedDeriv 2 f a = 0
      · -- Subcase 2.2.1: There exists a with iteratedDeriv 2 f a = 0
        exact h2 h₂
      · -- Subcase 2.2.2: iteratedDeriv 2 f a ≠ 0 for all a
        by_cases h₃ : ∃ (a : ℝ), iteratedDeriv 3 f a = 0
        · -- Subcase 2.2.2.1: There exists a with iteratedDeriv 3 f a = 0
          exact h3 h₃
        · -- Subcase 2.2.2.2: iteratedDeriv 3 f a ≠ 0 for all a
          -- In this case, we use the main result
          have h₄ : ∀ (x : ℝ), f x ≠ 0 := by
            intro x hx
            exact h ⟨x, hx⟩
          have h₅ : ∀ (x : ℝ), deriv f x ≠ 0 := by
            intro x hx
            exact h₁ ⟨x, hx⟩
          have h₆ : ∀ (x : ℝ), iteratedDeriv 2 f x ≠ 0 := by
            intro x hx
            exact h₂ ⟨x, hx⟩
          have h₇ : ∀ (x : ℝ), iteratedDeriv 3 f x ≠ 0 := by
            intro x hx
            exact h₃ ⟨x, hx⟩
          exact h_main h₄ h₅ h₆ h₇
  <;>
  aesop