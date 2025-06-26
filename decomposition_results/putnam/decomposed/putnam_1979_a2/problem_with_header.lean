import Mathlib

-- fun k : ℝ => k ≥ 0
/--
For which real numbers $k$ does there exist a continuous function $f : \mathbb{R} \to \mathbb{R}$ such that $f(f(x)) = kx^9$ for all real $x$?
-/
theorem putnam_1979_a2
: ∀ k : ℝ, (∃ f : ℝ → ℝ, Continuous f ∧ ∀ x : ℝ, f (f x) = k*x^9) ↔ ((fun k : ℝ => k ≥ 0) : ℝ → Prop ) k := by
  intro k
  have h_main : (∃ f : ℝ → ℝ, Continuous f ∧ ∀ x : ℝ, f (f x) = k*x^9) ↔ k ≥ 0 := by
    constructor
    · -- Prove the forward direction: if such f exists, then k ≥ 0
      intro h
      by_contra h₁
      -- Assume k < 0 and derive a contradiction
      have h₂ : k < 0 := by linarith
      obtain ⟨f, hf_cont, hf⟩ := h
      -- Show that f is injective
      have h₃ : Function.Injective f := by
        intro a b h₄
        have h₅ : f (f a) = f (f b) := by rw [h₄]
        have h₆ : f (f a) = k * a ^ 9 := by rw [hf]
        have h₇ : f (f b) = k * b ^ 9 := by rw [hf]
        have h₈ : k * a ^ 9 = k * b ^ 9 := by linarith
        have h₉ : a ^ 9 = b ^ 9 := by
          apply mul_left_cancel₀ (show (k : ℝ) ≠ 0 by linarith)
          linarith
        have h₁₀ : a = b := by
          -- Prove that if a^9 = b^9, then a = b
          have h₁₁ : a ^ 9 = b ^ 9 := h₉
          have h₁₂ : a ^ 2 = b ^ 2 := by
            nlinarith [sq_nonneg (a ^ 4 - b ^ 4), sq_nonneg (a ^ 2 - b ^ 2), sq_nonneg (a ^ 3 - b ^ 3),
              sq_nonneg (a - b), sq_nonneg (a + b), sq_nonneg (a ^ 4 + b ^ 4), sq_nonneg (a ^ 2 + b ^ 2),
              sq_nonneg (a ^ 3 + b ^ 3), sq_nonneg (a ^ 4 - a ^ 2 * b ^ 2), sq_nonneg (a ^ 2 * b ^ 2 - b ^ 4)]
          have h₁₃ : a = b := by
            nlinarith [sq_nonneg (a - b), sq_nonneg (a + b), sq_nonneg (a ^ 2 - b ^ 2), sq_nonneg (a ^ 2 + b ^ 2),
              sq_nonneg (a ^ 2 - a * b), sq_nonneg (a * b - b ^ 2)]
          exact h₁₃
        exact h₁₀
      -- Show that f is strictly monotone
      have h₄ : StrictMono f ∨ StrictAnti f := by
        have h₅ : Continuous f := hf_cont
        have h₆ : Function.Injective f := h₃
        exact h₅.strictMono_or_strictAnti h₆
      -- Consider the cases where f is strictly increasing or strictly decreasing
      cases h₄ with
      | inl h₄ =>
        -- Case: f is strictly increasing
        have h₅ : StrictMono (f ∘ f) := h₄.comp h₄
        have h₆ : ∀ x y : ℝ, x < y → f (f x) < f (f y) := by
          intro x y hxy
          exact h₅ hxy
        have h₇ : f (f 1) < f (f (-1)) := by
          have h₈ : (1 : ℝ) > -1 := by norm_num
          have h₉ : f (f 1) < f (f (-1)) := by
            have h₁₀ : f (f 1) = k * (1 : ℝ) ^ 9 := by rw [hf]
            have h₁₁ : f (f (-1)) = k * (-1 : ℝ) ^ 9 := by rw [hf]
            have h₁₂ : (1 : ℝ) ^ 9 = 1 := by norm_num
            have h₁₃ : (-1 : ℝ) ^ 9 = -1 := by norm_num
            have h₁₄ : f (f 1) = k := by rw [h₁₀, h₁₂]; ring
            have h₁₅ : f (f (-1)) = -k := by rw [h₁₁, h₁₃]; ring
            have h₁₆ : k < -k := by
              have h₁₇ : k < 0 := h₂
              linarith
            rw [h₁₄, h₁₅]
            linarith
          exact h₉
        have h₈ : f (f 1) < f (f (-1)) := h₇
        have h₉ : (1 : ℝ) > -1 := by norm_num
        have h₁₀ : f (f 1) < f (f (-1)) := h₈
        have h₁₁ : f (f 1) = k * (1 : ℝ) ^ 9 := by rw [hf]
        have h₁₂ : f (f (-1)) = k * (-1 : ℝ) ^ 9 := by rw [hf]
        have h₁₃ : (1 : ℝ) ^ 9 = 1 := by norm_num
        have h₁₄ : (-1 : ℝ) ^ 9 = -1 := by norm_num
        have h₁₅ : f (f 1) = k := by rw [h₁₁, h₁₃]; ring
        have h₁₆ : f (f (-1)) = -k := by rw [h₁₂, h₁₄]; ring
        have h₁₇ : k < -k := by
          have h₁₈ : k < 0 := h₂
          linarith
        have h₁₉ : f (f 1) < f (f (-1)) := h₈
        linarith
      | inr h₄ =>
        -- Case: f is strictly decreasing
        have h₅ : StrictMono (f ∘ f) := by
          intro x y hxy
          have h₆ : f x > f y := by
            exact h₄ hxy
          have h₇ : f (f x) < f (f y) := by
            exact h₄ h₆
          exact h₇
        have h₆ : ∀ x y : ℝ, x < y → f (f x) < f (f y) := by
          intro x y hxy
          exact h₅ hxy
        have h₇ : f (f 1) < f (f (-1)) := by
          have h₈ : (1 : ℝ) > -1 := by norm_num
          have h₉ : f (f 1) < f (f (-1)) := by
            have h₁₀ : f (f 1) = k * (1 : ℝ) ^ 9 := by rw [hf]
            have h₁₁ : f (f (-1)) = k * (-1 : ℝ) ^ 9 := by rw [hf]
            have h₁₂ : (1 : ℝ) ^ 9 = 1 := by norm_num
            have h₁₃ : (-1 : ℝ) ^ 9 = -1 := by norm_num
            have h₁₄ : f (f 1) = k := by rw [h₁₀, h₁₂]; ring
            have h₁₅ : f (f (-1)) = -k := by rw [h₁₁, h₁₃]; ring
            have h₁₆ : k < -k := by
              have h₁₇ : k < 0 := h₂
              linarith
            rw [h₁₄, h₁₅]
            linarith
          exact h₉
        have h₈ : f (f 1) < f (f (-1)) := h₇
        have h₉ : (1 : ℝ) > -1 := by norm_num
        have h₁₀ : f (f 1) < f (f (-1)) := h₈
        have h₁₁ : f (f 1) = k * (1 : ℝ) ^ 9 := by rw [hf]
        have h₁₂ : f (f (-1)) = k * (-1 : ℝ) ^ 9 := by rw [hf]
        have h₁₃ : (1 : ℝ) ^ 9 = 1 := by norm_num
        have h₁₄ : (-1 : ℝ) ^ 9 = -1 := by norm_num
        have h₁₅ : f (f 1) = k := by rw [h₁₁, h₁₃]; ring
        have h₁₆ : f (f (-1)) = -k := by rw [h₁₂, h₁₄]; ring
        have h₁₇ : k < -k := by
          have h₁₈ : k < 0 := h₂
          linarith
        have h₁₉ : f (f 1) < f (f (-1)) := h₈
        linarith
    · -- Prove the backward direction: if k ≥ 0, then such f exists
      intro h
      by_cases h₁ : k = 0
      · -- Case: k = 0
        use fun x => 0
        constructor
        · -- Prove that the zero function is continuous
          exact continuous_const
        · -- Prove that f(f(x)) = kx^9 for the zero function
          intro x
          simp [h₁]
          <;> ring_nf
          <;> norm_num
      · -- Case: k > 0
        have h₂ : k > 0 := by
          cases' lt_or_gt_of_ne h₁ with h₁ h₁
          · exfalso
            linarith
          · exact h₁
        use fun x => k ^ (1 / 4 : ℝ) * x ^ 3
        constructor
        · -- Prove that the proposed function is continuous
          apply Continuous.mul
          · exact continuous_const
          · exact continuous_pow 3
        · -- Prove that f(f(x)) = kx^9
          intro x
          have h₃ : (k ^ (1 / 4 : ℝ) * x ^ 3 : ℝ) = k ^ (1 / 4 : ℝ) * x ^ 3 := by ring
          rw [h₃]
          have h₄ : (k ^ (1 / 4 : ℝ) * (k ^ (1 / 4 : ℝ) * x ^ 3) ^ 3 : ℝ) = k * x ^ 9 := by
            have h₅ : (k : ℝ) > 0 := by exact_mod_cast h₂
            have h₆ : (k : ℝ) ^ (1 / 4 : ℝ) > 0 := Real.rpow_pos_of_pos h₅ (1 / 4)
            have h₇ : (k : ℝ) ^ (1 / 4 : ℝ) * (k ^ (1 / 4 : ℝ) * x ^ 3) ^ 3 = k * x ^ 9 := by
              calc
                (k : ℝ) ^ (1 / 4 : ℝ) * (k ^ (1 / 4 : ℝ) * x ^ 3) ^ 3 = (k : ℝ) ^ (1 / 4 : ℝ) * (k ^ (1 / 4 : ℝ)) ^ 3 * (x ^ 3) ^ 3 := by ring
                _ = (k : ℝ) ^ (1 / 4 : ℝ) * (k ^ (1 / 4 : ℝ)) ^ 3 * x ^ 9 := by ring
                _ = (k : ℝ) ^ (1 / 4 : ℝ) * (k ^ ((1 / 4 : ℝ) * 3)) * x ^ 9 := by
                  rw [← Real.rpow_mul (le_of_lt h₅)]
                  <;> ring_nf
                _ = (k : ℝ) ^ (1 / 4 : ℝ) * (k ^ (3 / 4 : ℝ)) * x ^ 9 := by
                  ring_nf
                _ = (k : ℝ) ^ ((1 / 4 : ℝ) + (3 / 4 : ℝ)) * x ^ 9 := by
                  rw [← Real.rpow_add (le_of_lt h₅)]
                  <;> ring_nf
                _ = (k : ℝ) ^ (1 : ℝ) * x ^ 9 := by norm_num
                _ = k * x ^ 9 := by
                  rw [Real.rpow_one]
                  <;> ring_nf
            rw [h₇]
            <;> ring_nf
          rw [h₄]
          <;> ring_nf
          <;> field_simp
          <;> ring_nf
          <;> norm_num
          <;> linarith
  -- Use the main statement to conclude the proof
  simpa using h_main