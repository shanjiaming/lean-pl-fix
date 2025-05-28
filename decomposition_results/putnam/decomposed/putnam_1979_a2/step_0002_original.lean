theorem h_main (k : ℝ) : (∃ f, Continuous f ∧ ∀ (x : ℝ), f (f x) = k * x ^ 9) ↔ k ≥ 0 :=
  by
  constructor
  · intro h
    by_contra h₁
    have h₂ : k < 0 := by sorry
    obtain ⟨f, hf_cont, hf⟩ := h
    have h₃ : Function.Injective f := by sorry
    have h₄ : StrictMono f ∨ StrictAnti f := by sorry
    cases h₄ with
    | inl h₄ =>
      have h₅ : StrictMono (f ∘ f) := h₄.comp h₄
      have h₆ : ∀ x y : ℝ, x < y → f (f x) < f (f y) := by
        intro x y hxy
        exact h₅ hxy
      have h₇ : f (f 1) < f (f (-1)) := by
        have h₈ : (1 : ℝ) > -1 := by norm_num
        have h₉ : f (f 1) < f (f (-1)) :=
          by
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
    | inr
      h₄ =>
      have h₅ : StrictMono (f ∘ f) := by
        intro x y hxy
        have h₆ : f x > f y := by exact h₄ hxy
        have h₇ : f (f x) < f (f y) := by exact h₄ h₆
        exact h₇
      have h₆ : ∀ x y : ℝ, x < y → f (f x) < f (f y) := by
        intro x y hxy
        exact h₅ hxy
      have h₇ : f (f 1) < f (f (-1)) := by
        have h₈ : (1 : ℝ) > -1 := by norm_num
        have h₉ : f (f 1) < f (f (-1)) :=
          by
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
  · intro h
    by_cases h₁ : k = 0
    · use fun x => 0
      constructor
      · exact continuous_const
      · intro x
        simp [h₁] <;> ring_nf <;> norm_num
    ·
      have h₂ : k > 0 := by sorry
      use fun x => k ^ (1 / 4 : ℝ) * x ^ 3
      constructor
      · apply Continuous.mul
        · exact continuous_const
        · exact continuous_pow 3
      · intro x
        have h₃ : (k ^ (1 / 4 : ℝ) * x ^ 3 : ℝ) = k ^ (1 / 4 : ℝ) * x ^ 3 := by sorry
        rw [h₃]
        have h₄ : (k ^ (1 / 4 : ℝ) * (k ^ (1 / 4 : ℝ) * x ^ 3) ^ 3 : ℝ) = k * x ^ 9 := by sorry
        rw [h₄] <;> ring_nf <;> field_simp <;> ring_nf <;> norm_num <;> linarith